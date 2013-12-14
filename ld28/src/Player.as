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
		private var walkSpeed:Number = 150;
		
		public function Player() {
			makeGraphic(32, 32);
		}
		
		override public function update():void 
		{
			super.update();
			
			// slow down
			velocity.x *= .9;
			velocity.y *= .9;
			if (Math.abs(velocity.x) < .1) {
				velocity.x = 0;
			}
			if (Math.abs(velocity.y) < .1) {
				velocity.y = 0;
			}
			
			// keys
			if (FlxG.keys.A || FlxG.keys.LEFT) {
				velocity.x = -walkSpeed;
			}
			else if (FlxG.keys.D || FlxG.keys.RIGHT) {
				velocity.x = walkSpeed;
			}
			
			if (FlxG.keys.W || FlxG.keys.UP) {
				velocity.y = -walkSpeed;
			}
			else if (FlxG.keys.S || FlxG.keys.DOWN) {
				velocity.y = walkSpeed;
			}
		}
		
	}

}