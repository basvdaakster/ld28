package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
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
		
		public static function addSpecialCollisions(map:Array, w:int, group:FlxGroup):void {
			for (var i:int = 0; i < map.length; i++) {
				var mx:int = i % w;
				var my:int = Math.floor(i / w);
				var t:int = map[i];
				var c:Collider = null;
				
				if (t == 109 || t == 117) {
					c = new Collider(mx * 32 + 23, my * 32, 6, 32);
				}
				else if (t == 108 || t == 97) {
					c = new Collider(mx * 32 + 6, my * 32, 6, 32);
				}
				else if (t == 10) {
					c = new Collider(mx * 32 + 8, my * 32 + 8, 16, 24);
				}
				else if (t == 20) {
					c = new Collider(mx * 32 + 8, my * 32, 16, 24);
				}
				else if (t == 40) { 
					c = new Collider(mx * 32 + 8, my * 32, 16, 26);
				}
				
				if(c) group.add(c);
			}
		}
		
		public static function formatTime(sec:Number):String {
			var min:Number = Math.floor(sec / 60);
			var s:Number = Math.floor(sec % 60);
			return (min < 10 ? "0" + min : min) + ":" + (s < 10 ? "0" + s : s);
		}
		
	}

}