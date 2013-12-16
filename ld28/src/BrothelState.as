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
	public class BrothelState extends PlayState 
	{
		
		private var brothelMap:Array = [2, 3, 3, 3, 3, 4, 2, 3, 3, 4, 5, 6, 6, 6, 6, 45, 51, 6, 6, 7, 67, 68, 69, 70, 6, 55, 52, 6, 6, 7, 5, 6, 6, 6, 6, 7, 2, 3, 3, 4, 51, 6, 6, 6, 6, 45, 51, 6, 6, 7, 52, 6, 6, 6, 6, 55, 52, 6, 6, 7, 5, 6, 6, 6, 6, 7, 2, 3, 3, 4, 5, 6, 78, 6, 6, 45, 51, 6, 6, 7, 5, 6, 6, 6, 6, 55, 52, 6, 6, 7, 8, 9, 9, 9, 9, 10, 8, 9, 9, 10];
		private var brothelTopMap:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 104, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 104, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 104, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		
		public function BrothelState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			brothelMap = Utils.convertTiledArray(brothelMap);
			brothelTopMap = Utils.convertTiledArray(brothelTopMap);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(brothelMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(brothelTopMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(0-8, 5 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(13, 29));
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
	