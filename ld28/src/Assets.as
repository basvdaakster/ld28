package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Assets 
	{
		
		[Embed(source="../assets/testsheet.png")]
		public static var SHEET_TEST:Class;
		
		[Embed(source="../assets/cursor.png")]
		public static var CURSOR_POINTER:Class;
		
		[Embed(source="../assets/hand.png")]
		public static var CURSOR_HAND:Class;
		
		[Embed(source = "../assets/arrow.png")]
		public static var BOUNCING_ARROW:Class;		
	}

}