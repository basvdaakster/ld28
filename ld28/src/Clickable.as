package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Clickable extends FlxButton
	{
		
		public static var RANGE:Number = 64;
		protected var anim:FlxSprite;
		protected var animOff:FlxPoint = new FlxPoint();
		
		public function Clickable() 
		{
			super();
			
			onOver = function():void {
				FlxG.mouse.load(Assets.CURSOR_HAND);
			};
			
			onOut = function():void {
				FlxG.mouse.load(Assets.CURSOR_POINTER);
			};
			
			onUp = onClick;
		}
		
		public function onClick():void {
		}
		
		override public function update():void 
		{
			if (anim) anim.update();
			super.update();
		}
		
		override public function draw():void 
		{
			super.draw();
			if(anim) {
				anim.x = x + animOff.x;
				anim.y = y + animOff.y;
				anim.draw();
			}
		}
		
	}

}