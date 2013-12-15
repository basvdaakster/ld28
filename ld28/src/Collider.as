package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Collider extends FlxSprite 
	{
		
		public function Collider(x:int, y:int, w:int, h:int) 
		{
			this.x = x;
			this.y = y;
			makeGraphic(w, h, 0);
			immovable = true;
		}
		
	}

}