package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class GraveYardState extends PlayState 
	{
		
		private var bottomMapData:Array = [106, 106, 106, 106, 118, 30, 7, 20, 20, 20, 20, 5, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 7, 20, 20, 20, 20, 5, 118, 106, 106, 106, 106, 106, 106, 31, 106, 106, 118, 30, 7, 2, 3, 3, 4, 5, 118, 106, 106, 106, 31, 106, 106, 41, 106, 106, 118, 30, 7, 5, 6, 6, 7, 5, 118, 31, 106, 106, 41, 106, 106, 106, 106, 106, 118, 31, 7, 5, 6, 6, 7, 5, 118, 41, 106, 106, 106, 106, 106, 106, 106, 106, 118, 41, 15, 3, 71, 3, 3, 14, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 115, 116, 115, 116, 115, 116, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 125, 126, 125, 126, 125, 126, 118, 106, 106, 31, 106, 106, 106, 31, 106, 106, 118, 30, 115, 116, 115, 116, 115, 116, 118, 106, 106, 41, 106, 106, 106, 41, 106, 106, 118, 30, 125, 126, 125, 126, 125, 126, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 106, 106, 106, 106, 106, 31, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 31, 106, 106, 106, 106, 41, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 41, 106, 106, 106, 106, 106, 118, 30, 30, 30, 30, 30, 30, 30, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 30, 30, 106, 106, 106, 106, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 118, 30, 30, 30, 106, 106, 106, 106, 118, 106, 106, 106, 106, 106];
		private var topMapData:Array = [0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 0, 0, 146, 0, 0, 0, 1, 1, 0, 141, 0, 0, 0, 0, 136, 0, 0, 146, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 146, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 144, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 136, 0, 0, 0, 136, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 146, 0, 0, 0, 146, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 136, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 146, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0];
		
		
		public function GraveYardState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			super(spawnPoint ? spawnPoint : new FlxPoint(8, 11), facing);
			
			bottomMapData = Utils.convertTiledArray(bottomMapData);
			topMapData = Utils.convertTiledArray(topMapData);
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(topMapData, 18), Assets.MAIN_SHEET, 32, 32);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(bottomMapData, 18), Assets.MAIN_SHEET, 32, 32);
			
			Utils.addSpecialCollisions(bottomMapData, 18, colliders);
			
			// Add portal to next room
			var portal:Trigger = new Trigger(5*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal);
			var portal2:Trigger = new Trigger(6*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal2);
			
			var portal3:Trigger = new Trigger(7*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal3);
			
			var portal4:Trigger = new Trigger(8*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal4);
			
			var portal5:Trigger = new Trigger(9*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal5);
			
			var portal6:Trigger = new Trigger(10*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal6);
			var portal7:Trigger = new Trigger(11*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal7);
			var portal8:Trigger = new Trigger(12*32, 13 * 32, function():void {
				var town:TownState = new TownState(new FlxPoint(7, 8));
				FlxG.switchState(new TransitionState(town));
			});
			mapObjects.add(portal8);
			
			// GRAVES			
			var dungpile:Grave = new Grave("Here lies Dr. Dungpile. Loved by all. 1988 to 2003", null, "You find nothing...");
			dungpile.x = 7 * 32;
			dungpile.y = 7 * 32;
			mapObjects.add(dungpile);
			
			var johnny:Grave = new Grave("Here lies Johnny Bigwings, no one really knew him. 13-4-2002 to 14-4-2002", null, "You find nothing...");
			johnny.x = 9 * 32;
			johnny.y = 7 * 32;
			mapObjects.add(johnny);
			
			var licky:Grave = new Grave("Here lies Licky Lullaby, one hell of a bedtime story teller. He died because of the monsters under his bed. 2004 to 2008", null, "You find nothing...");
			licky.x = 11 * 32;
			licky.y = 7 * 32;
			mapObjects.add(licky);
			
			var crease:Grave = new Grave("Here lies Crease Fold. His riches got the best of him in the end. 2009 to 2013", Item.COIN_DIE, "You find a coin and a die!");
			crease.x = 7 * 32;
			crease.y = 9 * 32;
			mapObjects.add(crease);
			
			var your:Grave = new Grave("Your grave", null, "You find nothing...");
			your.x = 9 * 32;
			your.y = 9 * 32;
			mapObjects.add(your);
			
			var rent:Grave = new Grave("Room for rent", null, "You find nothing...");
			rent.x = 11 * 32;
			rent.y = 9 * 32;
			mapObjects.add(rent);
			
			var shovel:Trigger = new Trigger(9 * 32, 3 * 32, function():void {
				DayData.INVENTORY = Item.SHOVEL;
				shovel.exists = false;
			});
			shovel.loadGraphic(Assets.ITEM_SHOVEL);
			mapObjects.add(shovel);
			
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
	