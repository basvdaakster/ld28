package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Item 
	{
		public static var COIN:Item = new Item("coin", Assets.ITEM_COIN);
		
		public var name:String;
		public var img:Class;
		
		public function Item(name:String, img:Class) {
			this.name = name;
			this.img = img;
		}
	}

}