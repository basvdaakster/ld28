package  
{
	import flash.events.TimerEvent;
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class TownState extends PlayState
	{
		
		private var bottomMapData:Array = [106, 106, 106, 30, 118, 30, 43, 7, 7, 20, 20, 20, 5, 5, 118, 106, 106, 106, 106, 106, 106, 106, 106, 30, 118, 30, 43, 7, 7, 20, 20, 20, 5, 5, 118, 106, 106, 106, 106, 106, 30, 30, 30, 30, 118, 30, 43, 7, 7, 20, 20, 20, 5, 5, 118, 106, 106, 106, 106, 106, 30, 106, 30, 30, 118, 30, 43, 7, 7, 20, 20, 20, 5, 5, 118, 106, 106, 106, 106, 106, 30, 30, 30, 30, 118, 30, 43, 7, 7, 20, 20, 20, 5, 5, 118, 106, 106, 106, 106, 106, 30, 30, 106, 30, 118, 30, 43, 7, 15, 3, 3, 3, 14, 5, 118, 106, 106, 106, 106, 106, 30, 30, 30, 30, 118, 30, 43, 15, 3, 3, 71, 3, 3, 14, 118, 106, 106, 106, 106, 106, 106, 106, 106, 30, 118, 30, 74, 75, 75, 84, 90, 85, 75, 65, 120, 9, 9, 9, 9, 9, 106, 106, 106, 30, 118, 30, 30, 30, 30, 48, 49, 50, 30, 64, 7, 20, 20, 20, 20, 20, 9, 9, 9, 9, 9, 9, 119, 40, 30, 48, 49, 50, 11, 43, 7, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 5, 50, 30, 48, 49, 50, 21, 43, 7, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 62, 50, 30, 48, 49, 50, 30, 43, 25, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 42, 19, 39, 18, 49, 19, 39, 44, 45, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 52, 49, 49, 49, 49, 49, 49, 54, 55, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 5, 29, 59, 28, 49, 29, 59, 53, 7, 20, 20, 20, 20, 20, 3, 3, 3, 3, 3, 3, 99, 50, 30, 48, 49, 50, 30, 43, 7, 20, 20, 20, 20, 20, 75, 75, 75, 75, 75, 108, 109, 60, 30, 48, 49, 50, 41, 43, 100, 3, 3, 3, 3, 3, 106, 106, 106, 106, 106, 97, 98, 30, 30, 48, 49, 50, 30, 74, 110, 75, 75, 75, 75, 75, 9, 9, 9, 9, 9, 9, 119, 40, 30, 48, 49, 50, 30, 38, 120, 9, 9, 9, 9, 9, 20, 20, 20, 20, 20, 20, 5, 50, 11, 48, 49, 50, 30, 64, 7, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 22, 23, 21, 48, 49, 50, 30, 43, 73, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 42, 19, 39, 18, 49, 19, 39, 44, 45, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 52, 49, 49, 49, 49, 49, 49, 54, 55, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 5, 29, 59, 28, 49, 29, 59, 53, 100, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 99, 50, 30, 48, 49, 50, 30, 74, 110, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 108, 109, 60, 30, 48, 49, 50, 30, 38, 120, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 119, 40, 30, 48, 49, 50, 41, 64, 7, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 32, 33, 30, 48, 49, 50, 30, 34, 35, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 42, 19, 39, 18, 49, 19, 39, 44, 45, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 52, 49, 49, 49, 49, 49, 49, 54, 55, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 5, 29, 59, 28, 49, 29, 59, 53, 7, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 5, 50, 30, 48, 49, 50, 30, 43, 7, 20, 20, 20, 20, 20, 3, 3, 3, 3, 3, 3, 99, 50, 41, 48, 49, 50, 30, 43, 100, 3, 3, 3, 3, 3, 75, 75, 75, 75, 75, 108, 109, 60, 30, 48, 49, 50, 30, 74, 110, 75, 75, 75, 75, 75, 106, 106, 106, 106, 106, 97, 98, 30, 30, 48, 49, 50, 30, 30, 118, 106, 106, 106, 106, 106, 106, 106, 106, 106, 106, 97, 98, 30, 30, 58, 59, 60, 30, 30, 118, 106, 106, 106, 106, 106, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 145, 106, 106, 106, 106, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 106, 106, 106, 106, 106, 106, 30, 30, 30, 30, 30, 106, 106, 30, 30, 30, 30, 30, 30, 30, 106, 106, 106, 106, 106, 106, 106, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 106, 106];
		private var topMapData:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 122, 0, 0, 0, 0, 0, 113, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 112, 0, 0, 0, 0, 0, 133, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 132, 0, 0, 0, 0, 0, 123, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		private var collMapData:Array = [0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 20, 20, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 20, 20, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 20, 20, 20, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		public function TownState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			this.spawnPoint = new FlxPoint(10, 34);
			super(spawnPoint ? spawnPoint : this.spawnPoint, facing);
			
			bottomMapData = Utils.convertTiledArray(bottomMapData);
			topMapData = Utils.convertTiledArray(topMapData);
			collMapData = Utils.convertTiledArray(collMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(bottomMapData, 20), Assets.MAIN_SHEET, 32, 32);
			
			tileMapTop = new FlxTilemap();
			tileMapTop.loadMap(FlxTilemap.arrayToCSV(topMapData, 20), Assets.MAIN_SHEET, 32, 32);
			
			tileMapAiCollision = new FlxTilemap();
			tileMapAiCollision.loadMap(FlxTilemap.arrayToCSV(collMapData, 20), Assets.MAIN_SHEET, 32, 32);
			
			// Add portals
			
			//Saloon portal
			var portalSaloon:Trigger = new Trigger(6 * 32, 21.75 * 32, function():void {
				var saloon:SaloonState = new SaloonState(new FlxPoint(8, 4), FlxObject.LEFT);
				FlxG.switchState(new TransitionState(saloon));
			});
			mapObjects.add(portalSaloon);
			
			//Casino portal
			var portalCasino:Trigger = new Trigger(6 * 32, 28.75 * 32, function():void {
				var casino:CasinoState = new CasinoState(new FlxPoint(8, 4), FlxObject.LEFT);
				FlxG.switchState(new TransitionState(casino));
			});
			mapObjects.add(portalCasino);
			
			//Shop portal
			var portalShop:Trigger = new Trigger(6 * 32, 12.75 * 32, function():void {
				var shop:ShopState = new ShopState(new FlxPoint(8, 5), FlxObject.LEFT);
				FlxG.switchState(new TransitionState(shop));
			});
			mapObjects.add(portalShop);
			
			//Brothel portal
			var portalBrothel:Trigger = new Trigger(14 * 32+8, 28.75 * 32, function():void {
				var brothel:BrothelState = new BrothelState(new FlxPoint(1, 5), FlxObject.RIGHT);
				FlxG.switchState(new TransitionState(brothel));
			});
			mapObjects.add(portalBrothel);
			
			//Church portal
			var portalChurch:Trigger = new Trigger(14 * 32 +8, 21.75 * 32, function():void {
				var church:ChurchState = new ChurchState(new FlxPoint(1, 5), FlxObject.RIGHT);
				FlxG.switchState(new TransitionState(church));
			});
			mapObjects.add(portalChurch); 
			
			//Bank portal
			var portalbank:Trigger = new Trigger(14 * 32 +8, 12.75 * 32, function():void {
				var bank:BankState = new BankState(new FlxPoint(1, 5), FlxObject.RIGHT);
				FlxG.switchState(new TransitionState(bank));
			});
			mapObjects.add(portalbank);
			
			//TownHall portal
			var portalHall:Trigger = new Trigger(10 * 32, 6 * 32, function():void {
				var hall:TownHallState = new TownHallState(new FlxPoint(5,8), FlxObject.UP);
				FlxG.switchState(new TransitionState(hall));
			});
			mapObjects.add(portalHall);
			
			//Grave portal
			var portalGrave:Trigger = new Trigger(6 * 32, 6 * 32, function():void {
				var grave:GraveYardState = new GraveYardState(new FlxPoint(8,11), FlxObject.UP);
				FlxG.switchState(new TransitionState(grave));
			});
			mapObjects.add(portalGrave);
			var portalGrave2:Trigger = new Trigger(5 * 32, 6 * 32, function():void {
				var grave:GraveYardState = new GraveYardState(new FlxPoint(8,11), FlxObject.UP);
				FlxG.switchState(new TransitionState(grave));
			});
			mapObjects.add(portalGrave2);
			
			var trough:Trough = new Trough(8, 19);
			mapObjects.add(trough);
			
			Utils.addSpecialCollisions(bottomMapData, 20, mapObjects);
			
			for each(var tile:uint in Assets.MAIN_SHEET_PASSABLES) {
				tileMap.setTileProperties(tile, FlxObject.NONE);
			}
			
			var intro:IntroductionDude = new IntroductionDude();
			intro.x = 10 * 32;
			intro.y = 29 * 32;
			mapObjects.add(intro);
		}
	}

}