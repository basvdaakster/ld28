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
		
		private var casinoMap:Array = [2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 6, 6, 66, 6, 6, 66, 6, 6, 7, 86, 87, 88, 87, 88, 87, 88, 87, 87, 89, 5, 6, 6, 6, 6, 6, 6, 6, 6, 45, 5, 6, 6, 6, 6, 6, 6, 66, 6, 55, 5, 6, 36, 37, 6, 6, 36, 37, 6, 7, 5, 6, 46, 47, 6, 6, 46, 47, 6, 7, 5, 6, 56, 57, 6, 6, 56, 57, 6, 7, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10];		
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
			var talkerOne:Talker = new Talker(1, 5, ["Man that old pastor we had was a blast at this game. He always won crazy money in this casino with crabs! Wish I had his luck"]);
			talkerOne.setFacing(FlxObject.RIGHT);
			var talkerTwo:Talker = new Talker(5, 7, ["Man that old pastor we had was a blast at this game. He always won crazy money in this casino with crabs! Wish I had his luck"], Talker.GREEN);
			talkerTwo.setFacing(FlxObject.RIGHT);
			var talkerThree:Talker = new Talker(8, 7, ["Man that old pastor we had was a blast at this game. He always won crazy money in this casino with crabs! Wish I had his luck"], Talker.GREEN_NAKED);
			talkerThree.setFacing(FlxObject.LEFT);
			mapObjects.add(talkerOne);
			mapObjects.add(talkerTwo);
			mapObjects.add(talkerThree);
			
			var traderOne:Trader = new Trader(4, 1, Trader.WHITE, Item.COIN, Item.CHIP, "Any coins that you want to trade for chips?\n\n"+"Have fun gambling your life away.", "You don't have anny coins to trade for chips. We don't do charity!", "Have fun gambling your life away.");
			mapObjects.add(traderOne);
			var traderTwo:Trader = new Trader(6, 1, Trader.GREEN_WHITE, Item.CHIP3, Item.COIN3, "Any chips that you want to trade for coins?\n\n"+"Wow arn't you the lucky one geting all that cash.", "You don't have any chips to trade sir", "Wow arn't you the lucky one geting all that cash.");
			mapObjects.add(traderTwo);
			var traderThree:Trader = new Trader(2, 1, Trader.NORMAL , Item.COIN_DIE , Item.CHIP_DIE, "Any special trades you want to do?\n\n" + "Enjoy your \"Luck\" sir." , "You have nothing special to trade me", "Enjoy your \"Luck\" sir.");
			mapObjects.add(traderThree);
			
			var dealerOne:Trader = new Trader(2, 4, Trader.GREEN_NAKED , Item.CHIP_DIE, Item.CHIP3, "Welcome sir. Do you wish to play some craps? We only take special bets today.\n\n" + "You win the house! Congratulations!", "This is the craps table. We only take special bets today. You have nothing special to bet with.", "You win the house! Congratulations!");
			var dealerTwo:Trader = new Trader(6, 4, Trader.NAKED, Item.CHIP, null, "Welcome sir, Do you wish to play some Poker? Minimum buy in is one chip\n\n" + "Full house for the house sir. You lose", "This is the Poker table. The minimum buy in is one chip... wich you don't have you poor sod.", "Full house for the house sir. You lose");
			mapObjects.add(dealerOne);
			mapObjects.add(dealerTwo);
		}
		override public function create():void 
		{
			FlxG.play(Assets.DOOR);
			
			super.create();
		}
	}

}