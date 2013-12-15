package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxParticle;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class PlayState extends FlxState 
	{
		
		public var hud:FlxGroup;
		public var thePlayer:Player;
		
		public var tileMap:FlxTilemap;
		public var tileMapTop:FlxTilemap;
		public var tileMapAiCollision:FlxTilemap;
		
		protected var dbgText:FlxText;
		private var timeText:FlxText;
		private var itemFrame:ItemFrame;
		
		public var mapObjects:FlxGroup;
		public var colliders:FlxGroup;
		
		protected var spawnPoint:FlxPoint = null;
		
		
		public function PlayState(spawnPoint:FlxPoint, facing:uint) {
			thePlayer = new Player(spawnPoint.x, spawnPoint.y);
			thePlayer.setFacing(facing);
			
			this.spawnPoint = new FlxPoint(spawnPoint.x, spawnPoint.y);
			thePlayer.x = spawnPoint.x * 32 + (32 - thePlayer.width) / 2;
			thePlayer.y = spawnPoint.y * 32 + (32 - thePlayer.height) / 2;
			
			hud = new FlxGroup();
			mapObjects = new FlxGroup();
			colliders = new FlxGroup();
			
			// dbg
			dbgText = new FlxText(10, 10, FlxG.width - 10, "");
			dbgText.scrollFactor = new FlxPoint();
			
			timeText = new FlxText(0, 0, FlxG.width, "");
			timeText.scrollFactor = new FlxPoint();
			timeText.size = 16;
			timeText.shadow = 0xee000000;
			timeText.alignment = "center";
			
			itemFrame = new ItemFrame();
				
			itemFrame.y = FlxG.height - itemFrame.height - 4;
			itemFrame.x = 4;
			
			hud.add(dbgText);
			hud.add(timeText);
			hud.add(itemFrame);
		}
		
		override public function create():void 
		{
			add(tileMap);
			
			add(mapObjects);
			add(colliders);
			mapObjects.add(thePlayer);
			//add(thePlayer);
			
			add(tileMapTop);
			add(hud);
			
			DayData.loadSerializedObjects(this);
			
			FlxG.worldBounds = tileMap.getBounds();
			
			FlxG.camera.bounds = FlxG.worldBounds;
			FlxG.camera.follow(thePlayer);
			
			super.create();
		}
		
		var cheatIndex:int = 0;
		override public function update():void 
		{
			dbgText.text = "Player Pos: (" + Math.round(thePlayer.x / 1) + ", " + Math.round(thePlayer.y / 1) + ")\n";
			timeText.text = Utils.formatTime(DayData.CURRENT_DAY_TIME);
			
			DayData.updateDay();
			
			FlxG.collide(tileMap, thePlayer);
			FlxG.collide(mapObjects, thePlayer);
			FlxG.collide(colliders, thePlayer);
			
			mapObjects.sort("y", ASCENDING);
			
			thePlayer.x = Math.max(0, thePlayer.x);
			thePlayer.x = Math.min(tileMap.width, thePlayer.x);
			
			thePlayer.y = Math.max(0, thePlayer.y);
			thePlayer.y = Math.min(tileMap.height, thePlayer.y);
			
			if (FlxG.keys.justPressed("ONE")) {
				DayData.INVENTORY = Item.allItems[cheatIndex];
				cheatIndex++;
				if (cheatIndex >= Item.allItems.length) {
					cheatIndex = 0;
				}
			}
			
			super.update();
		}
		
		override public function destroy():void 
		{
			DayData.saveSerializedObjects(this);
			
			super.destroy();
		}
		
	}

}