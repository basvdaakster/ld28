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
			
			var talkerOne:Talker = new Talker(1, 5, ["I heard Lucky Puke was in town! That fly is one of the richest flies I know. Money was flying of him when he rode into town. He tied his catterpillar Jolly thumper on that trough outside."]);
			talkerOne.setFacing(FlxObject.RIGHT);
			var talkerTwo:Talker = new Talker(3, 5, ["This bar stinks. They don't even have a decent dung snack next to your ale! I wish I was born near another town. Guess I just have to make the best of it! I hate my short life."], Talker.GREEN);
			talkerTwo.setFacing(FlxObject.LEFT);
			var talkerThree:Talker = new Talker(8, 7, ["...Hickup!... Ish thish tomorow? I dontsh ...Hickup!.. know annymore.."], Talker.GREEN_NAKED);
			talkerThree.setFacing(FlxObject.LEFT);
			
			var bartender:Trader = new Trader(1, 1, Trader.NORMAL, Item.COIN, null, "There we go! you finaly gotten some sense in yah head!\nOh so you are after the pretty miss fly, the mayors daughter! Well let me tell you you aint getting in there without a password! Best talk to one of the broads in the brothel down the street. Maby they know a thing or two. And thats all you get from me!", "I aint talking for nuffink! Get me some coin and well see how lose my lips can get.", "Oh so you are after the pretty miss fly, the mayors daughter! Well let me tell you you aint getting in there without a password! Best talk to one of the broads in the brothel down the street. Maby they know a think or two. And thats all you get from me!");
			mapObjects.add(bartender);
			mapObjects.add(talkerOne);
			mapObjects.add(talkerTwo);
			mapObjects.add(talkerThree);
			FlxG.play(Assets.DOOR);
		}
		
	}

}