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
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class IntroductionDude extends FlxSprite
	{
		private var state:PlayState;
		private var myPath:FlxPath;
		
		private var following:Boolean = false;
		private var done:Boolean = false;
		
		private var playerX:Number = 0;
		private var playerY:Number = 0;
		
		public function IntroductionDude() 
		{
			this.state = FlxG.state as PlayState;
			
			makeGraphic(24, 24, 0xFFCFDF0B);
		}

		override public function update():void 
		{ 
			if (!following && !done) {
				myPath = state.tileMap.findPath(getMidpoint(), state.thePlayer.getMidpoint());
				
				if (myPath) {
					followPath(myPath, 100);
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
			
			var but1:FlxButton = new FlxButton(0, 0, "G WAT JIJ", function():void {
				p.removeFromState();
				
				var arrow:BouncingArrow = new BouncingArrow(32, 11 * 32, 270);
				FlxG.state.add(arrow);
			});
			
			var p:TextPopup = new TextPopup("Go to the saloon you fucking noob", [but1]);
			p.x = p.y = 10;
			state.hud.add(p);
		}
		
	}

}