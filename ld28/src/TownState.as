package  
{
	import flash.events.TimerEvent;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class TownState extends PlayState
	{
		
		private var testMapData:Array = [
			1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			2, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1,
		];
		
		public function TownState(spawnPoint:FlxPoint = null) {
			this.spawnPoint = new FlxPoint(4, 14);
			super(spawnPoint ? spawnPoint : this.spawnPoint);
			
			//testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 9), Assets.SHEET_TEST, 32, 32);
		}
		
		override public function create():void 
		{
			// Add portal to next room
			var portal:FlxTile = new FlxTile(tileMap, 2, 32, 32, false, 0x1111);
			tileMap.setTileProperties(2, FlxObject.ANY, function():void {
				var saloon:SaloonState = DayData.saloonState;
				
				DayData.thePlayer.x = 7;
				DayData.thePlayer.y = 11;
				
				FlxG.switchState(new TransitionState(saloon));
			}, Player);
			
			// Add to state
			add(tileMap);
			add(thePlayer);
			add(dbgText);
			
			var interactible:Interactible = new Interactible();
			interactible.x = 96;
			interactible.y = 224;
			//add(interactible);
			
			var intro:IntroductionDude = new IntroductionDude();
			intro.x = 64;
			intro.y = 232;
			add(intro);
			
			add(hud);
			
			FlxG.worldBounds = tileMap.getBounds();
			FlxG.camera.follow(thePlayer);
		}
		
		override public function update():void 
		{
			FlxG.collide(tileMap, thePlayer);
			
			super.update();
		}
		
	}

}