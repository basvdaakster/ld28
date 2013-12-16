package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Pastor extends Clickable implements ISerializable
	{
		private var hasForgiven:Boolean = false;

		public function Pastor() 
		{
			makeGraphic(32, 32, 0);
			
			anim = new FlxSprite();
			anim.loadGraphic(Assets.CHARACTERS, true, false, 32, 32);
			anim.addAnimation("idle", [14]);
			anim.play("idle");
			
			immovable = true;
		}
		
		override public function onClick():void 
		{
			if (FlxU.getDistance((FlxG.state as PlayState).thePlayer.getMidpoint(), this.getMidpoint()) > Clickable.RANGE) {
				return;
			}
			
			if (hasForgiven) {
				onWrongAnswer();
				return;
			}

			FlxG.play(Assets.SPEAK,1,false,true);
			
			var buta:CustomButton = new CustomButton("I told my friends to look for the blue light\nNow they are gone.", function():void { 
				p.removeFromState();
				onWrongAnswer();
			} );
			
			var butb:CustomButton = new CustomButton("I cheated whilst gambling.", function():void { 
				p.removeFromState(); 
				onRightAnswer();
			} );
			
			var butc:CustomButton = new CustomButton("I once pulled the wings off a fly.", function():void { 
				p.removeFromState(); 
				onWrongAnswer();
			} );			
			
			var p:TextPopup = new TextPopup("So you want to confess son? What's on your mind?", [ buta, butb, butc ], true);
			(FlxG.state as PlayState).add(p);
			p.x = p.y = 2;
			
			super.onClick();
			
			FlxG.play(Assets.SPEAK);
		}
		
		private function onWrongAnswer():void {

			FlxG.play(Assets.SPEAK,1,false,true);
			var p:TextPopup = new TextPopup("Well all your sins are forgiven. Go my son and enjoy your life... although a bit short.", function():void {
				p.removeFromState();
			});
			(FlxG.state as PlayState).add(p);
			p.x = p.y = 2;
			hasForgiven = true;
		}
		
		private function onRightAnswer():void {

			FlxG.play(Assets.SPEAK,1,false,true);
			var p:TextPopup = new TextPopup("Ahh well you have to learn to be an honest gambler. Not the kind of “honest” my friend was. He won a bit to much for his liking and got lynched for it. We burried him in the graveyard next to the town hall. Don't let that happen to you.. Oh your dead by the morning...", function():void {
				p.removeFromState();
			});
			(FlxG.state as PlayState).add(p);
			p.x = p.y = 2;
			hasForgiven = true;
		}
		
		public function toObject():Object {
			var o:Object = {
				hasForgiven: hasForgiven
			};
			
			return o;
		}
		
		public function fromObject(o:Object):void {
			hasForgiven = o.hasForgiven;
		}
		
	}

}