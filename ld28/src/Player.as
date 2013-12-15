package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Player extends FlxSprite
	{
		public static var blockInput:Boolean = false;
		private var walkSpeed:Number = 150;
		
		public function Player() {
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
		}
		
		override public function update():void 
		{
			super.update();
			
			// slow down
			velocity.x *= .8;
			velocity.y *= .8;
			if (Math.abs(velocity.x) < .1) {
				velocity.x = 0;
			}
			if (Math.abs(velocity.y) < .1) {
				velocity.y = 0;
			}
			
			// keys
			if (!blockInput) { 
				if (FlxG.keys.A || FlxG.keys.LEFT) {
					velocity.x = -walkSpeed;
					playAnim("walk_w");
					facing = LEFT;
				}
				else if (FlxG.keys.D || FlxG.keys.RIGHT) {
					velocity.x = walkSpeed;
					playAnim("walk_e");
					facing = RIGHT;
				}
				else if (FlxG.keys.W || FlxG.keys.UP) {
					velocity.y = -walkSpeed;
					playAnim("walk_n");
					facing = UP;
				}
				else if (FlxG.keys.S || FlxG.keys.DOWN) {
					velocity.y = walkSpeed;
					playAnim("walk_s");
					facing = DOWN;
				}
				else {
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
			}
		}
		
		public function setFacing(facing:uint):void 
		{
			this.facing = facing;
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
		
		private function playAnim(anim:String):void 
		{
			if (!_curAnim || _curAnim.name != anim) {
				play(anim, true);
			}
		}
		
	}

}