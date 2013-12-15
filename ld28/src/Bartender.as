package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Bartender extends Clickable
	{
		private var anim:FlxSprite;
		
		public function Bartender() 
		{
			makeGraphic(32, 32, 0);
			
			anim = new FlxSprite();
			anim.loadGraphic(Assets.CHARACTERS, true, false, 32, 32);
			anim.addAnimation("idle", [1]);
			anim.play("idle");
			
			immovable = true;
		}
		
		override public function onClick():void 
		{
			if (FlxU.getDistance((FlxG.state as PlayState).thePlayer.getMidpoint(), this.getMidpoint()) > Clickable.RANGE) {
				return;
			}
			
			var but:CustomButton = new CustomButton("OK", function():void { 
				p.removeFromState(); 
				DayData.addFlag("trough_coin");
			} );
			var p:TextPopup = new TextPopup("I need a coin", [ but ]);
			(FlxG.state as PlayState).add(p);
			p.x = p.y = 2;
			
			super.onClick();
		}
		
		override public function draw():void 
		{
			anim.x = x;
			anim.y = y;
			anim.draw();
		}
		
	}

}