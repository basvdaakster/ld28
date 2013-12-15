package 
{
	import flash.events.Event;
	import flash.system.SecurityPanel;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	[SWF(width="640", height="480")]
	public class Game extends FlxGame
	{
		public static var instance:Game;
		
		public function Game():void 
		{
			super(640/2, 480/2, TownState, 2);
			
			FlxG.bgColor = 0xff2e1709;
			
			instance = this;
			
			DayData.reset();
			FlxG.mouse.show();
			
			FlxG.debug = false;
			FlxG.visualDebug = false;
		}
		
		override protected function update():void 
		{
			if(FlxG.keys.justPressed("G")) {
				FlxG.debug = !FlxG.debug;
				FlxG.visualDebug = FlxG.debug;
			}
			
			super.update();
		}
	}
	
}