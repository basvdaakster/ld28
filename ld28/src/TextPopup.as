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
		private var buttons:Vector.<FlxButton>;
		
		private var things:FlxGroup;
		
		private var time:Number = 0;
		
		public function TextPopup(text:String, callback:* = null) 
		{
			makeGraphic(400, 100, 0xee5C758D);
			
			things = new FlxGroup();
			
			this.text = new FlxText(0, 0, width - 4, text);
			this.text.shadow = 0xCC000000;
			
			buttons = new Vector.<FlxButton>();
			if (callback is Function) { 
				var but:FlxButton = new FlxButton(400 - 20, height - 10, "OK", callback);
				buttons.push(but);
				things.add(but);
			}
			if (callback is FlxButton) {
				callback = [ callback ];
			}
			if (callback is Array) {
				for (var i:uint = 0; i < callback.length; i++) {
					if(callback[i] is FlxButton) {
						var but:FlxButton = callback[i] as FlxButton;
						buttons.push(but);
						things.add(but);
					}
				}
			}
			
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
			
			var xx:int = x + width;
			for (var i:uint = 0; i < buttons.length; i++) {
				var but:FlxButton = buttons[i];
				
				xx -= but.width + 2;
				but.x = xx;
				but.y = y + height - but.height - 2;
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