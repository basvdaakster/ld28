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
	public class BankState extends PlayState 
	{
		
		private var bankMap:Array = [2, 3, 3, 3, 4, 20, 20, 20, 20, 20, 5, 6, 6, 6, 7, 20, 20, 20, 20, 20, 86, 88, 88, 88, 89, 2, 127, 127, 127, 4, 5, 6, 6, 6, 7, 5, 6, 6, 6, 7, 51, 6, 6, 6, 137, 138, 6, 6, 6, 7, 61, 6, 6, 6, 147, 148, 6, 6, 6, 7, 5, 6, 6, 6, 7, 8, 9, 9, 9, 10, 5, 6, 6, 6, 7, 20, 20, 20, 20, 20, 5, 6, 6, 6, 7, 20, 20, 20, 20, 20, 8, 9, 9, 9, 10, 20, 20, 20, 20, 20];		
		private var bankTopMap:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 104, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		
		public function BankState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			bankMap = Utils.convertTiledArray(bankMap);
			bankTopMap = Utils.convertTiledArray(bankTopMap);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(bankMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(bankTopMap, 10), Assets.MAIN_SHEET, 32, 32);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(0-8, 5 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(13, 13));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal);
			
			// Disable collisions for floor tile
			for each(var tile:uint in Assets.MAIN_SHEET_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var talkerOne:Talker = new Talker(1, 1, ["Want to make a deposit? No we already have a diamond in that safe. Annything else?"], Talker.NAKED );
			talkerOne.setFacing(FlxObject.DOWN);
			var talkerTwo:Talker = new Talker(2, 1, ["My collegues swiched places today. Helps keep them exited about their jobs!"], Talker.NAKED);
			talkerTwo.setFacing(FlxObject.DOWN);
			var talkerThree:Talker = new Talker(3, 1, ["Want to make a withdrawl? No you can't withdrawl from this safe. It has a diamond in it you know."], Talker.GREEN_NAKED);
			talkerThree.setFacing(FlxObject.DOWN);
			
			var bartender:Bartender = new Bartender();
			bartender.x = bartender.y = 32;
			//mapObjects.add(bartender);
			mapObjects.add(talkerOne);
			mapObjects.add(talkerTwo);
			mapObjects.add(talkerThree);
				
			var guard:Trader = new Trader(3, 6, Trader.GREEN, Item.GROG, function():void {
				var state:PlayState = FlxG.state as PlayState;
				state.tileMap.setTile(4, 4, 44, true);
				state.tileMap.setTile(4, 5, 54, true);
				state.tileMap.setTile(5, 4, 41, true);
				state.tileMap.setTile(5, 5, 51, true);
				DayData.addFlag("vault");
				DayData.INVENTORY = null;
			}, "No one gets in here!", "Bloody coffee! I want some grog! But of course... you can't drink on the job can you? Can you get me some? The store keep across the road should have some. He doesn't like strangers but talks to annyone that has some money on them.", "ZZZZzzzz.....");
			mapObjects.add(guard);
			
			if (DayData.hasFlag("vault")) {
				tileMap.setTile(4, 4, 44, true);
				tileMap.setTile(4, 5, 54, true);
				tileMap.setTile(5, 4, 41, true);
				tileMap.setTile(5, 5, 51, true);
			}
			
			var safea:Safe = new Safe(true);
			safea.x = 6 * 32;
			safea.y = 2 * 32;
			var safeb:Safe = new Safe();
			safeb.x = 7 * 32;
			safeb.y = 2 * 32;
			var safec:Safe = new Safe();
			safec.x = 8 * 32;
			safec.y = 2 * 32;
			mapObjects.add(safea);
			mapObjects.add(safeb);
			mapObjects.add(safec);
		}
		
	}

}	
	