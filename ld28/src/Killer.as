package  
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Killer extends Talker
	{
		
		public function Killer(x:int, y:int, txt:String, type:int = WHITE) 
		{
			super(x, y, [txt], type);
		}
		
		override public function talk():void 
		{
			var but:CustomButton = new CustomButton("OK", function():void
				{
					DayData.CURRENT_DAY_TIME = 0;
					DayData.addFlag("lifeended");
					popup.removeFromState();
					talking = false;
				}, 100);
			var butb:CustomButton = new CustomButton("No", function():void
				{
					popup.removeFromState();
					talking = false;
				}, 100);
			
			popup = new TextPopup(text[0], [but, butb], true);
			popup.x = popup.y = 2;
			(FlxG.state as PlayState).hud.add(popup);
		}
		
	}

}