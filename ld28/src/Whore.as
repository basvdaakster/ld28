package  
{
	
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Dan Drory
	 */
	public class Whore extends Trader 
	{
		
		public function Whore(x:int, y:int, type:int, inItem:Item, outItemOrCallback:*, tradeText:String, noInItemText:String, afterTradeText:String) 
		{
			super(x, y, type, inItem, outItemOrCallback, tradeText, noInItemText, afterTradeText);
		}
		
		override public function talk():void {
			
			var but:CustomButton = new CustomButton("OK", function():void {
				popup.removeFromState();
				if(index < text.length) {
					talk();
				}
				else {
					index = 0;
					talking = false;
				}
			}, 100);
			
			var txt:String = "";
			
			if (hasTraded) {
				
				txt = afterTradeText;
			}
			else if (DayData.INVENTORY != inItem ||!DayData.hasFlag("WhoreTalked")) {
				txt = noInItemText;
			}
			else {
				if(outItem is Item) {
					DayData.INVENTORY = outItem;
				}
				else if(outItem is Function) {
					outItem();
				}
				else if (outItem == null) {
					DayData.INVENTORY = null;
				}
				DayData.addFlag("WhoreTalked");
				hasTraded = true;
				txt = tradeText;
				FlxG.play(Assets.PICKUP);
			}
			
			popup = new TextPopup(txt, [but], true);
			popup.x = popup.y = 2;
			(FlxG.state as PlayState).hud.add(popup);
			
			if (index < text.length) {
				index++;
			}
		}
		
	}

}