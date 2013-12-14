package  
{
	import org.flixel.FlxG;
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
		
		private var tileMap:FlxTilemap;
		
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
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 3, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			5, 6, 6, 6, 6, 6, 6, 6, 7, 
			8, 9, 9, 9, 9, 9, 9, 9, 10];
		
		public function SaloonState(spawnPoint:FlxPoint = null) {
			super(spawnPoint ? spawnPoint : this.spawnPoint);
			
			testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 9), Assets.SHEET_TEST, 32, 32);
		}
		
		override public function create():void 
		{
			// Add portal to next room
			var portal:FlxTile = new FlxTile(tileMap, 2, 32, 32, false, 0x1111);
			tileMap.setTileProperties(2, FlxObject.ANY, function():void {
				var town:TownState = new TownState(new FlxPoint(1, 11));
				FlxG.switchState(new TransitionState(town));
			}, Player);
			
			// Disable collisions for floor tile
			tileMap.setTileProperties(5, FlxObject.NONE);
			
			// Add to state
			add(tileMap);
			add(thePlayer);
			add(dbgText);
			
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