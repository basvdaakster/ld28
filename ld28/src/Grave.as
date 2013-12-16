package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Grave extends Clickable
	{

		private var text:String;
		private var itemOnDig:Item;
		private var textOnDig:String;
		
		public function Grave(text:String, itemOnDig:Item = null, textOnDig:String = null) 
		{
			makeGraphic(32, 32, 0);
			this.text = text;
			this.itemOnDig = itemOnDig;
			this.textOnDig = textOnDig;
			
			anim = new FlxSprite();
			anim.loadGraphic(Assets.GRAVE, true, false, 32, 64);
			height = 64;
			//anim.addAnimation("idle", [1]);
			//anim.play("idle");
			
			immovable = true;
		}
		
		override public function onClick():void 
		{
			if (FlxU.getDistance((FlxG.state as PlayState).thePlayer.getMidpoint(), this.getMidpoint()) > Clickable.RANGE) {
				return;
			}
			
			var buta:CustomButton = new CustomButton("OK", function():void { 
				p.removeFromState();
			} );
			
			var butb:CustomButton = new CustomButton("Dig", function():void { 
				p.removeFromState();
				onDig();
			} );
			
			var buts:Array = [ buta ];
			if (!DayData.hasFlag("gravedug") && DayData.INVENTORY == Item.SHOVEL) {
				buts.push(butb);
			}
			
			var p:TextPopup = new TextPopup(text, buts, true);
			(FlxG.state as PlayState).add(p);
			p.x = p.y = 2;
			
			super.onClick();
		}
		
		private function onDig():void 
		{
			DayData.addFlag("gravedug");
			DayData.INVENTORY = null;
			if (itemOnDig) {
				DayData.INVENTORY = itemOnDig;
				if (textOnDig) {
					var p:TextPopup = new TextPopup(textOnDig, function():void { p.removeFromState() });
					(FlxG.state as PlayState).add(p);
					p.x = p.y = 2;
				}
			}
		}
		
	}

}