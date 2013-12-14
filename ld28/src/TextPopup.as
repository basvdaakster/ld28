package  
{
	import flash.geom.Point;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class TextPopup extends FlxSprite
	{
		private var text:FlxText;
		private var buttons:Vector.<CustomButton>;
		
		private var things:FlxGroup;
		
		private var time:Number = 0;
		
		private var multilineButtons:Boolean;
		
		public function TextPopup(text:String, callback:* = null, multilineButtons:Boolean = false) 
		{
			height = 100;
			width = 400;
			
			this.multilineButtons = multilineButtons;
			
			things = new FlxGroup();
			
			this.text = new FlxText(0, 0, width - 4, text);
			this.text.shadow = 0xCC000000;
			
			buttons = new Vector.<CustomButton>();
			if (callback is Function) { 
				var but:CustomButton = new CustomButton("OK", callback);
				buttons.push(but);
				things.add(but);
			}
			if (callback is CustomButton) {
				callback = [ callback ];
			}
			if (callback is Array) {
				for (var i:uint = 0; i < callback.length; i++) {
					if(callback[i] is CustomButton) {
						var butt:CustomButton = callback[i] as CustomButton;
						buttons.push(butt);
						things.add(butt);
						height += butt.height;
					}
				}
			}
			makeGraphic(400, height, 0xffCEB17B);
			
			things.add(this.text);
			scrollFactor = new FlxPoint();
			
			things.setAll("scrollFactor", new FlxPoint());
		}
		
		public function removeFromState():void 
		{
			this.exists = false;
			FlxG.state.remove(this, true);
		}
		
		override public function update():void 
		{
			super.update();
			
			text.x = x + 2;
			text.y = y + 2;
			
			if(!multilineButtons) {
				var xx:int = x + width;
				for (var i:uint = 0; i < buttons.length; i++) {
					var but:FlxButton = buttons[i];
					
					xx -= but.width + 2;
					but.x = xx;
					but.y = y + height - but.height - 2;
				}
			}
			else {
				var yy:int = y + height;
				for (var i:uint = 0; i < buttons.length; i++) {
					var but:FlxButton = buttons[i];
					
					yy -= but.height + 2;
					but.x = x + width - but.width - 2;
					but.y = yy;
				}
			}
			
			if (time < 1) {
				time += FlxG.elapsed;
				alpha = Math.min(1, time / .2);
			}
			
			things.update();
		}
		
		override public function draw():void 
		{
			super.draw();
			things.draw();
		}
		
	}

}