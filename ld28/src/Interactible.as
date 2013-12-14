package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Interactible extends FlxButton
	{
		
		public function Interactible() 
		{
			makeGraphic(24, 24);
			
			onOver = function():void {
				FlxG.mouse.load(Assets.CURSOR_HAND);
			};
			
			onOut = function():void {
				FlxG.mouse.load(Assets.CURSOR_POINTER);
			};
		}
		
	}

}