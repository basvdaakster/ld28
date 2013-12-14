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
		
		private var tileMap:FlxTilemap;
		
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
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 9), Assets.SHEET_TEST, 32, 32);
		}
		
		override public function create():void 
		{
			// Add portal to next room
			var portal:FlxTile = new FlxTile(tileMap, 2, 32, 32, false, 0x1111);
			tileMap.setTileProperties(2, FlxObject.ANY, function():void {
				var saloon:SaloonState = new SaloonState(new FlxPoint(7, 11));
				FlxG.switchState(saloon);
			}, Player);
			
			// Add to state
			add(tileMap);
			add(thePlayer);
			add(dbgText);
			
			add(hud);
			
			FlxG.worldBounds = tileMap.getBounds();
			FlxG.camera.setBounds(0, 0, tileMap.width, tileMap.height);
			FlxG.camera.follow(thePlayer);
		}
		
		override public function update():void 
		{
			FlxG.collide(tileMap, thePlayer);
			
			super.update();
		}
		
	}

}