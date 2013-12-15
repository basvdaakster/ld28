package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Utils 
	{
		
		public static function convertTiledArray(arr:Array):Array {
			var dat:Array = arr;
			
			// Tiled fix
			for (var i:uint = 0; i < dat.length; i++) {
				dat[i]--;
				if (dat[i] < 0) {
					dat[i] = 0;
				}
			}
			
			return dat;
		}
		
		public static function formatTime(sec:Number):String {
			var min:Number = Math.floor(sec / 60);
			var s:Number = Math.floor(sec % 60);
			return (min < 10 ? "0" + min : min) + ":" + (s < 10 ? "0" + s : s);
		}
		
	}

}