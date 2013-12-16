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
	public class ShopState extends PlayState 
	{
		
		private var shopMap:Array = [2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 67, 68, 69, 70, 6, 6, 6, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 5, 6, 81, 82, 6, 81, 82, 6, 6, 45, 5, 6, 91, 92, 6, 91, 92, 6, 6, 55, 5, 6, 81, 82, 6, 81, 82, 6, 6, 7, 5, 6, 91, 92, 6, 91, 92, 6, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];
		private var shopTopMap:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 102, 0, 101, 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 102, 0, 101, 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	
		public function ShopState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			shopTopMap = Utils.convertTiledArray(shopTopMap);
			shopMap = Utils.convertTiledArray(shopMap);
			
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(shopTopMap, 10), Assets.MAIN_SHEET, 32, 32);
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(shopMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(9 * 32 + 8, 5 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 13));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal);
			
			// Disable collisions for floor tile
			for each(var tile:uint in Assets.MAIN_SHEET_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var storekeeper:Trader = new Trader(1, 1, Trader.NAKED, Item.COIN, Item.GROG, "You want some grog? That'd be one coin please.", "I don't deal with strangers! Be gone.", "Tell that old chum I said hi.");
			mapObjects.add(storekeeper);
		}
		override public function create():void 
		{
			FlxG.play(Assets.DOOR);
			
			super.create();
		}
	}

}