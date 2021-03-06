package  
{
	import flash.media.Sound;
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	import org.flixel.FlxSound;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Assets 
	{
		
		[Embed(source="../assets/mainsheet.png")]
		public static var MAIN_SHEET:Class;
		public static var MAIN_SHEET_PASSABLES:Array = [90, 91, 76, 77, 69, 114, 124, 125, 106, 40, 80, 81, 83, 84, 10, 20, 108, 97, 109, 117, 39, 5, 17, 18, 27, 28, 29, 75, 37, 92, 38, 47, 89, 73, 74, 48, 49, 57, 58, 59, 22, 23, 32, 33, 42, 43, 52, 53, 62, 63, 64, 30, 60, 70, 51, 54, 65];
		
		[Embed(source="../assets/itemframe.png")]
		public static var ITEMFRAME:Class;		
		
		[Embed(source="../assets/coin.png")]
		public static var ITEM_COIN:Class;
		
		[Embed(source="../assets/3coins.png")]
		public static var ITEM_COIN3:Class;
		
		[Embed(source="../assets/1Chip.png")]
		public static var ITEM_CHIP:Class;
		
		[Embed(source="../assets/3Chips.png")]
		public static var ITEM_CHIP3:Class;
		
		[Embed(source="../assets/Coin+Die.png")]
		public static var ITEM_COIN_DIE:Class;
		
		[Embed(source="../assets/Chip+die.png")]
		public static var ITEM_CHIP_DIE:Class;
		
		[Embed(source="../assets/Shovel.png")]
		public static var ITEM_SHOVEL:Class;
		
		[Embed(source="../assets/Grog.png")]
		public static var ITEM_GROG:Class;
		
		[Embed(source="../assets/Diamond.png")]
		public static var ITEM_DIAMOND:Class;
		
		[Embed(source="../assets/cursor.png")]
		public static var CURSOR_POINTER:Class;
		
		[Embed(source="../assets/hand.png")]
		public static var CURSOR_HAND:Class;
		
		[Embed(source = "../assets/arrow.png")]
		public static var BOUNCING_ARROW:Class;	
		
		[Embed(source = "../assets/GraveFull.png")]
		public static var GRAVE:Class;		
		
		[Embed(source = "../assets/characters.png")]
		public static var CHARACTERS:Class;	
		
		[Embed(source = "../assets/sound/fly.mp3", mimeType="audio/mpeg")]
		public static var MUSIC:Class;
		
		[Embed(source = "../assets/sound/Select.mp3")]
		public static var SELECT:Class;
		
		[Embed(source="../assets/sound/buzz.mp3")]
		public static var SPEAK:Class;
		
		[Embed(source="../assets/sound/NoCancel.mp3")]
		public static var CANCEL:Class;
		
		[Embed(source = "../assets/sound/flydoor.mp3")]
		public static var DOOR:Class;
		
		[Embed(source="../assets/sound/Pickup_Coin3_01.mp3")]
		public static var PICKUP:Class;
	}

}
