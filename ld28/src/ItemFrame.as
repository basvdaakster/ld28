package  
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class ItemFrame extends FlxSprite 
	{
		
		private var _item:Item = null;
		private var itemSpr:FlxSprite;
		
		public function ItemFrame() 
		{
			loadGraphic(Assets.ITEMFRAME);
			centerOffsets(true);
			scrollFactor = new FlxPoint();
		}
		
		public function get item():Item 
		{
			return _item;
		}
		
		public function set item(value:Item):void 
		{
			_item = value;
			itemSpr = new FlxSprite();
			itemSpr.scrollFactor = new FlxPoint();
			itemSpr.loadGraphic(_item.img);
			itemSpr.centerOffsets(true);
			itemSpr.x = x;
			itemSpr.y = y;
		}
		
		override public function update():void 
		{
			if (item != DayData.INVENTORY) {
				item = DayData.INVENTORY;
			}
			
			super.update();
		}
		
		override public function draw():void 
		{
			if(itemSpr) {
				itemSpr.draw();
			}
			
			super.draw();
		}
		
	}

}