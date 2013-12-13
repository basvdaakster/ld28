package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	[SWF(width="1280", height="720", backgroundColor="#000000")]
	public class Game extends FlxGame
	{
		public static var instance:Game;
		
		public function Game():void 
		{
			super(640, 360, MenuState, 2);
			instance = this;
		}
		
		public function Test():void {
			//Test voor GitHub
		}
	}
	
}