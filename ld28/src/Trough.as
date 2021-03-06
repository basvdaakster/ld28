package  
{
	
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Trough extends Clickable implements ISerializable
	{
		
		private var hasCoin:Boolean = true;
		
		public function Trough(x:int, y:int) 
		{
			immovable = true;
			
			this.x = x * 32 + 8;
			this.y = y * 32 + 7;
			makeGraphic(15, 48, 0);
		}
		
		override public function onClick():void 
		{
			if (hasCoin) {
				hasCoin = false;
				DayData.giveItem(Item.COIN);
				FlxG.play(Assets.PICKUP);
			}
			
			super.onClick();
		}
		
		public function toObject():Object {
			var o:Object = {
				hasCoin: hasCoin
			};
			
			return o;
		}
		
		public function fromObject(o:Object):void {
			hasCoin = o.hasCoin;
		}
		
	}

}