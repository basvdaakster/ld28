package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class ChurchState extends PlayState 
	{
		
		private var churchMap:Array = [2, 3, 3, 3, 3, 4, 2, 3, 3, 4, 5, 6, 129, 130, 6, 7, 5, 6, 6, 7, 5, 6, 139, 140, 6, 7, 5, 6, 6, 7, 5, 6, 6, 6, 6, 15, 3, 71, 3, 7, 51, 6, 6, 6, 6, 6, 6, 6, 6, 7, 61, 6, 149, 150, 6, 149, 150, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 149, 150, 6, 149, 150, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];
		private var churchTopMap:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		
		public function ChurchState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			churchMap = Utils.convertTiledArray(churchMap);
			churchTopMap = Utils.convertTiledArray(churchTopMap);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(churchMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(churchTopMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(0-8, 5 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(13, 22));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal);
			
			// Disable collisions for floor tile
			for each(var tile:uint in Assets.MAIN_SHEET_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var bartender:Bartender = new Bartender();
			bartender.x = bartender.y = 32;
			mapObjects.add(bartender);
		}
		
	}

}	
	