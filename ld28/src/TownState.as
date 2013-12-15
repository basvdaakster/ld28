package  
{
	import flash.events.TimerEvent;
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
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
		
		private var testMapData:Array = [51, 51, 51, 51, 51, 51, 38, 39, 40, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 31, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 41, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 31, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 41, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 31, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 41, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 31, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 41, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 9, 16, 40, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 20, 5, 50, 51, 51, 51, 48, 49, 50, 51, 51, 51, 38, 17, 9, 20, 5, 50, 51, 51, 51, 48, 49, 50, 51, 51, 51, 64, 7, 20, 20, 5, 50, 51, 51, 51, 48, 49, 50, 51, 51, 51, 34, 35, 20, 20, 22, 23, 51, 51, 51, 48, 49, 19, 39, 39, 39, 44, 45, 20, 20, 42, 50, 51, 51, 51, 48, 49, 49, 49, 49, 49, 54, 55, 20, 20, 52, 50, 51, 51, 51, 48, 49, 29, 59, 59, 59, 53, 7, 20, 20, 5, 50, 51, 51, 51, 48, 49, 50, 51, 51, 51, 74, 75, 75, 20, 5, 50, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 75, 65, 60, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 48, 49, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 58, 59, 60, 51, 51, 51, 51, 51, 51];
		
		public function TownState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			this.spawnPoint = new FlxPoint(7, 28);
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 15), Assets.SHEET_TEST, 32, 32);
			
			// Add portals
			var portal:Trigger = new Trigger(24, 22.75 * 32, function():void {
				var saloon:SaloonState = new SaloonState(new FlxPoint(7, 11), FlxObject.LEFT);
				FlxG.switchState(new TransitionState(saloon));
			});
			mapObjects.add(portal);
			
			for each(var tile:uint in Assets.SHEET_TEST_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var intro:IntroductionDude = new IntroductionDude();
			intro.x = 7 * 32;
			intro.y = 25 * 32;
			mapObjects.add(intro);
		}
		
		override public function create():void 
		{
			// Add to state
			add(tileMap);
			
			FlxG.worldBounds = tileMap.getBounds();
			FlxG.camera.follow(thePlayer);
			
			super.create();
		}
		
		override public function update():void 
		{
			FlxG.collide(tileMap, thePlayer);
			
			super.update();
		}
	}

}