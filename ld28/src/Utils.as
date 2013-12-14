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
		
	}

}