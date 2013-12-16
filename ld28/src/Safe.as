package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Safe extends Clickable
	{

		private var text:String;
		private var itemOnDig:Item;
		private var textOnDig:String;
		
		private var hasDiamond:Boolean;
		
		public function Safe(hasDiamond:Boolean = false) 
		{
			this.hasDiamond = hasDiamond;
			
			makeGraphic(32, 32, 0);
			this.text = text;
			this.itemOnDig = itemOnDig;
			this.textOnDig = textOnDig;
			
			anim = new FlxSprite();
			anim.loadGraphic(Assets.MAIN_SHEET, true, false, 32, 32);
			anim.addAnimation("idle", [126]);
			anim.play("idle");
			
			immovable = true;
		}
		
		override public function onClick():void 
		{
			if (DayData.hasFlag("diamond") || DayData.hasFlag("ClickedSafe") || (FlxG.state as PlayState).hasPopup || FlxU.getDistance((FlxG.state as PlayState).thePlayer.getMidpoint(), this.getMidpoint()) > Clickable.RANGE) {
				var p:TextPopup = new TextPopup("You have already opened a safe", function():void { p.removeFromState() });
				(FlxG.state as PlayState).add(p);
				p.x = p.y = 2;
				return;
			}
			
			if (hasDiamond) {
				DayData.INVENTORY = Item.DIAMOND;
				DayData.addFlag("diamond");
				var p:TextPopup = new TextPopup("You found a diamond! Now go get that girl!", function():void { p.removeFromState() });
				(FlxG.state as PlayState).add(p);
				p.x = p.y = 2;
			}
			else {
				var p:TextPopup = new TextPopup("It's empty...", function():void { p.removeFromState() });
				(FlxG.state as PlayState).add(p);
				p.x = p.y = 2;
			}
			
			DayData.addFlag("ClickedSafe");
			
			super.onClick();
		}
		
	}

}