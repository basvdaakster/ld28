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
	public class CasinoState extends PlayState 
	{
		
		private var casinoMap:Array = [2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 6, 6, 66, 6, 6, 66, 6, 6, 7, 86, 87, 87, 88, 87, 87, 88, 87, 87, 89, 5, 6, 6, 6, 6, 6, 6, 6, 6, 45, 5, 6, 6, 6, 6, 6, 6, 66, 6, 55, 5, 6, 36, 37, 6, 6, 36, 37, 6, 7, 5, 6, 46, 47, 6, 6, 46, 47, 6, 7, 5, 6, 56, 57, 6, 6, 56, 57, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];
		
		public function CasinoState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : new FlxPoint(8, 4), facing);
			
			casinoMap = Utils.convertTiledArray(casinoMap);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(casinoMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(9 * 32 + 8, 4 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 29),FlxObject.UP);
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