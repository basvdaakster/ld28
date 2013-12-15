package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Item 
	{
		public static var allItems:Vector.<Item> = new Vector.<Item>();
		
		public static var COIN:Item = new Item("coin", Assets.ITEM_COIN);
		public static var COIN3:Item = new Item("coin3", Assets.ITEM_COIN3);
		public static var CHIP:Item = new Item("chip", Assets.ITEM_CHIP);
		public static var CHIP3:Item = new Item("chip3", Assets.ITEM_CHIP3);
		public static var COIN_DIE:Item = new Item("coin_die", Assets.ITEM_COIN_DIE);
		public static var CHIP_DIE:Item = new Item("chip_die", Assets.ITEM_CHIP_DIE);
		public static var SHOVEL:Item = new Item("shovel", Assets.ITEM_SHOVEL);
		public static var GROG:Item = new Item("grog", Assets.ITEM_GROG);
		public static var DIAMOND:Item = new Item("diamond", Assets.ITEM_DIAMOND);
		
		public var name:String;
		public var img:Class;
		
		public function Item(name:String, img:Class) {
			this.name = name;
			this.img = img;
			
			allItems.push(this);
		}
	}

}