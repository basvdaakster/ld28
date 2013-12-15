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
	public class TownHallState extends PlayState 
	{
		
		private var hallMap:Array = [2, 3, 3, 3, 3, 4, 2, 3, 3, 4, 5, 6, 6, 6, 6, 7, 5, 6, 6, 7, 86, 87, 88, 88, 87, 89, 5, 6, 6, 7, 5, 6, 6, 6, 6, 15, 3, 71, 3, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 77, 6, 6, 6, 6, 77, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 77, 6, 6, 93, 6, 77, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];
		
		public function TownHallState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			hallMap = Utils.convertTiledArray(hallMap);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(hallMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(5*32, 9 * 32 - 4, function():void {
				var town:TownState = new TownState(new FlxPoint(10, 8));
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
	