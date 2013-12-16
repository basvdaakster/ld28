package  
{
	import flash.geom.Point;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import org.flixel.plugin.DebugPathDisplay;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class IntroductionDude extends FlxSprite implements ISerializable
	{
		private var state:PlayState;
		private var myPath:FlxPath;
		
		private var following:Boolean = false;
		private var done:Boolean = false;
		private var walkToSaloon:Boolean = false;
		private var wander:Boolean = false;
		
		private var playerX:Number = 0;
		private var playerY:Number = 0;
		
		private var saloonTile:FlxPoint = new FlxPoint(8 * 32, 22 * 32);
		
		public function IntroductionDude() 
		{
			loadGraphic(Assets.CHARACTERS, true, false, 32, 32);
			
			width = 12;
			height = 12;
			offset.x = (32 - width) / 2;
			offset.y = (32 - height);
			
			var fps:Number = 8;
			addAnimation("idle_n", [ 11 ], fps);
			addAnimation("idle_e", [ 12 ], fps);
			addAnimation("idle_s", [ 10 ], fps);
			addAnimation("idle_w", [ 13 ], fps);
			addAnimation("walk_n", [ 21, 31 ], fps);
			addAnimation("walk_e", [ 22, 32 ], fps);
			addAnimation("walk_s", [ 20, 30 ], fps);
			addAnimation("walk_w", [ 23, 33 ], fps);
			facing = UP;
			
			play("idle_n");
			
			solid = true;
			immovable = true;
			Player.blockInput = true;
		}

		override public function update():void 
		{ 
			state = FlxG.state is PlayState ? FlxG.state as PlayState : null;
			if (state == null) return;
			
			if (!following && !done) {
				myPath = state.tileMap.findPath(getMidpoint(), state.thePlayer.getMidpoint());
				
				if (myPath) {
					followPath(myPath, 200);
					following = true;
				}
			}
			
			if (following && !done && FlxU.getDistance(getMidpoint(), state.thePlayer.getMidpoint()) < 32) {
				stopFollowingPath(true);
				velocity.x = velocity.y = 0;
				onEndReached();
				done = true;
				following = false;
			}
			
			if(!done) {
				if (state.thePlayer.x != playerX || state.thePlayer.y != playerY || (pathSpeed == 0 && FlxU.getDistance(getMidpoint(), state.thePlayer.getMidpoint()) >= 32)) {
					stopFollowingPath(true);
					
					myPath = state.tileMap.findPath(getMidpoint(), state.thePlayer.getMidpoint());
					
					if (myPath) {
						followPath(myPath);
						following = true;
					}
					else {
						trace("Unable to find path to player, running onEndReached");
						onEndReached();
					}
					
					playerX = state.thePlayer.x;
					playerY = state.thePlayer.y;
				}
			}
			else if (wander) {
				if (pathSpeed == 0 || FlxU.getDistance(getMidpoint(), state.thePlayer.getMidpoint()) < 24) {
					stopFollowingPath(true);
					myPath = null;
					velocity.make();
				}
				if (!myPath && Math.random() > .97 && FlxU.getDistance(getMidpoint(), state.thePlayer.getMidpoint()) >= 24) {
					var pt:FlxPoint = new FlxPoint(x, y);
					pt.x += Math.random() * 256 - 128;
					pt.y += Math.random() * 256 - 128;
					
					pt.x = Math.max(0, pt.x);
					pt.y = Math.max(0, pt.y);
					pt.x = Math.min(state.tileMap.width, pt.x);
					pt.y = Math.min(state.tileMap.height, pt.y);
					
					myPath = state.tileMapAiCollision.findPath(getMidpoint(), pt);
					if (myPath) followPath(myPath, 75);
				}
			}
			else if (walkToSaloon && pathSpeed == 0) {
				velocity.make();
			}
			
			if (Math.abs(velocity.x) > Math.abs(velocity.y)) {
				if (velocity.x > 0) {
					playAnim("walk_e");
					facing = RIGHT;
				}
				else if (velocity.x < 0) {
					playAnim("walk_w");
					facing = LEFT;
				}
			}
			else {
				if (velocity.y > 0) {
					playAnim("walk_s");
					facing = DOWN;
				}
				else if (velocity.y < 0) {
					playAnim("walk_n");
					facing = UP;
				}
			}
			
			if (velocity.x == 0 && velocity.y == 0) {
				switch(facing) {
					case DOWN:
						playAnim("idle_s");
						break;
					case LEFT:
						playAnim("idle_w");
						break;
					case RIGHT:
						playAnim("idle_e");
						break;
					default:
						playAnim("idle_n");
						break;
				}
			}
			
			super.update();
		}
		
		private function onEndReached():void 
		{
			stopFollowingPath(true);
			myPath = null;
			done = true;
			
			var but1:CustomButton = new CustomButton("Allright, I'll follow.", function():void {
				p.removeFromState();
				
				Player.blockInput = false;
				
				wander = false;
				walkToSaloon = true;
				
				stopFollowingPath(true);
				myPath = state.tileMapAiCollision.findPath(getMidpoint(), saloonTile);
				followPath(myPath);
			}, 100);
			
			var p:TextPopup = new TextPopup("Hey there fellah! You look new in town. If you want some information you best be off to the saloon! Let me guide you! and if you don't feel like living annymore. Just talk to me.", [but1], true);
			
			p.x = p.y = 2;
			state.hud.add(p);
			FlxG.play(Assets.SPEAK);
		}
		
		public function toObject():Object {
			var o:Object = {
				x: x,
				y: y,
				done: done,
				following: following,
				walkToSaloon: walkToSaloon,
				myPath: myPath
			};
			
			return o;
		}
		
		public function fromObject(o:Object):void {
			x = o.x;
			y = o.y;
			done = o.done;
			following = o.following;
			walkToSaloon = o.walkToSaloon;
			myPath = o.myPath;
			if(done) {
				Player.blockInput = false;
			}
		}
		
		private function playAnim(anim:String):void 
		{
			if (!_curAnim || _curAnim.name != anim) {
				play(anim, true);
			}
		}
		
	}

}