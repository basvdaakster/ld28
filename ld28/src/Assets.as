package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Assets 
	{
		
		[Embed(source="../assets/mainsheet.png")]
		public static var SHEET_TEST:Class;
		public static var SHEET_TEST_PASSABLES:Array = [17, 18, 27, 28, 29, 37, 38, 47, 48, 49, 57, 58, 59, 22, 23, 32, 33, 42, 43, 52, 53, 62, 63, 30, 50, 60, 70, 51, 41];
		
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
