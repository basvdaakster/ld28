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
			
			
			
			var talkerOne:Talker = new Talker(1, 7, ["Man this brothel is amazing! Best day of my life... sadly I only have one day to live.."], Talker.NAKED);
			talkerOne.setFacing(FlxObject.RIGHT);
			var talkerTwo:Talker = new Talker(3, 7, ["Another round for me and bring me your finest lady!"], Talker.GREEN);
			talkerTwo.setFacing(FlxObject.LEFT);
			var talkerThree:Talker = new Talker(1, 1, ["Wow there you stinking old weasle one day fly. Just because you got one day to live doesn't mean I'll let you in with one of my damsels for free!? That will be 3 coins. Oh you don't have three coins? Why don't you try your luck at the casino across the street! Now off with you!"], Talker.GREEN_WHITE);
			talkerThree.setFacing(FlxObject.DOWN);
			var talkerOneB:Talker = new Talker(8, 1, ["Im glad you only live one day. They should of asked you to pay double for that horible performance. Get out of my sight!"], Talker.NAKED);
			talkerOneB.setFacing(FlxObject.LEFT);
			var talkerTwoB:Talker = new Talker(8, 4, ["Well there sailor! You made my wings tingle!"], Talker.NAKED);
			talkerTwoB.setFacing(FlxObject.LEFT);
			//var talkerThreeB:Talker = new Talker(8, 7, [""], Talker.NAKED);
			var talkerThreeB:Trader = new Trader(8, 7, Trader.NAKED, Item.COIN3, function():void {
				DayData.addFlag("password");
				DayData.INVENTORY = null;
			}, "Oh the password for the mayors house? Well the guards are a locals here. The password is Venus. Don't tell them I told you so! Or I will kill you!.. Oh you will be dead by tomorow? Hmm... nevermind then.", "No money, no fun, I need about 3 coins", "Bye sweetheart!");
			talkerThreeB.setFacing(FlxObject.LEFT);
			
			var bartender:Bartender = new Bartender();
			bartender.x = bartender.y = 32;
			//mapObjects.add(bartender);
			mapObjects.add(talkerOne);
			mapObjects.add(talkerTwo);
			mapObjects.add(talkerThree);
			mapObjects.add(talkerOneB);
			mapObjects.add(talkerTwoB);
			mapObjects.add(talkerThreeB);
		}
		
	}

}	
	