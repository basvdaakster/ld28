package  
{
	import flash.display.BitmapData;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.system.input.Mouse;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class MenuState extends FlxState
	{
		override public function create():void 
		{
			FlxG.mouse.show();
		}		
	}

}