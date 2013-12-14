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
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class TownState extends PlayState
	{
		
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
			
			//testMapData = Utils.convertTiledArray(testMapData);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(testMapData, 9), Assets.SHEET_TEST, 32, 32);
			// Add portal to next room
			var portal:FlxTile = new FlxTile(tileMap, 2, 32, 32, false, 0x1111);
			tileMap.setTileProperties(2, FlxObject.ANY, function():void {
				var saloon:SaloonState = new SaloonState(new FlxPoint(7, 11));
				FlxG.switchState(new TransitionState(saloon));
			}, Player);
			// Add to state
			add(tileMap);
			add(thePlayer);
			add(dbgText);
			
			var intro:IntroductionDude = new IntroductionDude();
			intro.x = 64;
			intro.y = 232;
			add(intro);
		}
		
		override public function create():void 
		{
			add(hud);
			
			FlxG.worldBounds = tileMap.getBounds();
			FlxG.camera.follow(thePlayer);
			
			var ptr:uint = 0;
			for each (var mem:Object in DayData.SER_OBJS_TOWN) {
				while (ptr < members.length && !(members[ptr] is ISerializable)) ptr++;
				if (ptr < members.length) {
					(members[ptr] as ISerializable).fromObject(mem);
				}
				else {
					break;
				}
			}
		}
		
		override public function update():void 
		{
			FlxG.collide(tileMap, thePlayer);
			
			super.update();
		}
		
		override public function destroy():void 
		{
			DayData.SER_OBJS_TOWN = [];
			for (var i:uint = 0; i < members.length; i++) {
				if (members[i] is ISerializable) {
					var imem:ISerializable = members[i] as ISerializable;
					DayData.SER_OBJS_TOWN.push(members[i].toObject());
				}
			}
			
			super.destroy();
		}
		
	}

}