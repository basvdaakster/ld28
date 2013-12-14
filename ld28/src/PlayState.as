package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class PlayState extends FlxState 
	{
		
		protected var hud:FlxGroup;
		protected var thePlayer:Player;
		protected var dbgText:FlxText;
		
		protected var spawnPoint:FlxPoint = null;
		
		public function PlayState(spawnPoint:FlxPoint = null) {
			this.spawnPoint = spawnPoint;
			
			thePlayer = new Player();
			
			if (spawnPoint) {
				thePlayer.x = spawnPoint.x * 32 + 4;
				thePlayer.y = spawnPoint.y * 32 + 4;
			}
			
			// dbg
			dbgText = new FlxText(10, 10, FlxG.width - 10, "");
			dbgText.scrollFactor = new FlxPoint();
		}
		
		override public function create():void 
		{
			hud.add(dbgText);
			
			super.create();
		}
		
		override public function update():void 
		{
			dbgText.text = "Player Pos: (" + Math.round(thePlayer.x) + ", " + Math.round(thePlayer.y) + ")";
			
			super.update();
		}
		
	}

}