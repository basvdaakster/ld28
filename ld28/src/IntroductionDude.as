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
		
		private var playerX:Number = 0;
		private var playerY:Number = 0;
		
		public function IntroductionDude() 
		{
			makeGraphic(24, 24, 0xFFCFDF0B);
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
			
			super.update();
		}
		
		private function onEndReached():void 
		{
			done = true;
			
			var but1:CustomButton = new CustomButton("G WAT PRAAT JIJ G", function():void {
				p.removeFromState();
				
				var arrow:BouncingArrow = new BouncingArrow(3 * 32, 23 * 32, 270);
				(FlxG.state as PlayState).mapObjects.add(arrow);
				
				Player.blockInput = false;
			}, 100);
			
			var p:TextPopup = new TextPopup("Go to the saloon you fucking noob", [but1], true);
			p.x = p.y = 2;
			state.hud.add(p);
		}
		
		public function toObject():Object {
			var o:Object = {
				x: x,
				y: y,
				done: done
			};
			
			return o;
		}
		
		public function fromObject(o:Object):void {
			x = o.x;
			y = o.y;
			done = o.done;
			if(done) {
				Player.blockInput = false;
			}
		}
		
	}

}