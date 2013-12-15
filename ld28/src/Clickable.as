package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Clickable extends FlxButton
	{
		
		public static var RANGE:Number = 32;
		
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
		
	}

}