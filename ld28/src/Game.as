package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	[SWF(width="640", height="480", backgroundColor="#000000")]
	public class Game extends FlxGame
	{
		public static var instance:Game;
		
		public function Game():void 
		{
			super(640, 480, PlayState, 1);
			instance = this;
		}
	}
	
}