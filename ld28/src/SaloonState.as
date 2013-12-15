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
	public class SaloonState extends PlayState 
	{
		
		private var testMapData:Array = [2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 6, 6, 66, 6, 6, 66, 6, 6, 7, 67, 68, 68, 68, 69, 70, 6, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 45, 5, 6, 6, 6, 6, 6, 6, 66, 6, 55, 5, 6, 77, 6, 6, 6, 78, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 6, 78, 6, 6, 6, 77, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];
		
		public function SaloonState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : new FlxPoint(8, 4), facing);
			
			testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(9 * 32 + 8, 4 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 22));
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