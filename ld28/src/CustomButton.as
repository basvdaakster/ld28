package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class CustomButton extends FlxButton 
	{
		
		private var text:FlxText;
		
		public function CustomButton(text:String, callback:Function = null, width:Number = 300) 
		{
			super(0, 0, "", callback);
			
			height = 18;
			makeGraphic(width, height, 0xff8b6147);
			
			this.text = new FlxText(x, y, width - 4, text);
			this.text.alignment = "center";
			this.text.scrollFactor = new FlxPoint();
			
			onOver = function():void {
				makeGraphic(width, height, 0xffbb7c51);
			};
			
			onOut = function():void {
				makeGraphic(width, height, 0xff8b6147);
			};
		}
		
		override public function update():void {
			super.update();
			
			text.x = x + 2;
			text.y = y + 2;
			
			text.update();
		}
		
		override public function draw():void 
		{
			super.draw();
			
			text.draw();
		}
		
	}

}