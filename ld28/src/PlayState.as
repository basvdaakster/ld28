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
		
		protected var spawnPoint:FlxPoint = null;
		
		
		public function PlayState(spawnPoint:FlxPoint = null, facing:uint = FlxObject.UP) {
			this.spawnPoint = spawnPoint;
			
			thePlayer = new Player();
			thePlayer.setFacing(facing);
			
			if (spawnPoint) {
				thePlayer.x = spawnPoint.x * 32 + 4;
				thePlayer.y = spawnPoint.y * 32 + 4;
			}
			
			hud = new FlxGroup();
			mapObjects = new FlxGroup();
			
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
			add(thePlayer);
			
			add(tileMapTop);
			add(hud);
			
			DayData.loadSerializedObjects(this);
			
			FlxG.worldBounds = tileMap.getBounds();
			
			FlxG.camera.bounds = FlxG.worldBounds;
			FlxG.camera.follow(thePlayer);
			
			super.create();
		}
		
		override public function update():void 
		{
			dbgText.text = "Player Pos: (" + Math.round(thePlayer.x) + ", " + Math.round(thePlayer.y) + ")\n";
			timeText.text = Utils.formatTime(DayData.CURRENT_DAY_TIME);
			
			DayData.updateDay();
			
			FlxG.collide(tileMap, thePlayer);
			FlxG.collide(mapObjects, thePlayer);
			
			thePlayer.x = Math.max(0, thePlayer.x);
			thePlayer.x = Math.min(tileMap.width, thePlayer.x);
			
			thePlayer.y = Math.max(0, thePlayer.y);
			thePlayer.y = Math.min(tileMap.height, thePlayer.y);
			
			super.update();
		}
		
		override public function destroy():void 
		{
			DayData.saveSerializedObjects(this);
			
			super.destroy();
		}
		
	}

}