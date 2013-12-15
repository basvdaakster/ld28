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
		
		private var testMapData:Array = [
			2, 3, 3, 3, 3, 3, 3, 3, 4, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 45, 
			5, 6, 6, 6, 6, 6, 6, 6, 55, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			8, 9, 9, 9, 9, 9, 9, 9, 10];
		
		public function SaloonState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 9), Assets.SHEET_TEST, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(8 * 32 + 8, 11 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(2, 23));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal);
			
			// Disable collisions for floor tile
			for each(var tile:uint in Assets.SHEET_TEST_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var bartender:Bartender = new Bartender();
			bartender.x = bartender.y = 32;
			mapObjects.add(bartender);
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
			super.update();
		}
		
	}

}