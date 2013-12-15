package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Assets 
	{
		
		[Embed(source="../assets/mainsheet.png")]
		public static var MAIN_SHEET:Class;
		public static var MAIN_SHEET_PASSABLES:Array = [40, 83, 84, 10, 20, 108, 97, 109, 117, 39, 5, 17, 18, 27, 28, 29, 75, 37, 38, 47, 73, 74, 48, 49, 57, 58, 59, 22, 23, 32, 33, 42, 43, 52, 53, 62, 63, 64, 30, 50, 60, 70, 54, 65, 51];
		
		[Embed(source="../assets/itemframe.png")]
		public static var ITEMFRAME:Class;		
		
		[Embed(source="../assets/coin.png")]
		public static var ITEM_COIN:Class;
		
		[Embed(source="../assets/cursor.png")]
		public static var CURSOR_POINTER:Class;
		
		[Embed(source="../assets/hand.png")]
		public static var CURSOR_HAND:Class;
		
		[Embed(source = "../assets/arrow.png")]
		public static var BOUNCING_ARROW:Class;		
		
		[Embed(source = "../assets/characters.png")]
		public static var CHARACTERS:Class;		
	}

}
