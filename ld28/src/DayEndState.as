package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class DayEndState extends FlxState
	{
		
		private var text:FlxText;
		
		public function DayEndState() 
		{
			text = new FlxText(0, FlxG.height / 2, FlxG.width, "You ran out of time!");
			text.alignment = "center";
			text.size = 16;
			
			var but:CustomButton = new CustomButton("Restart", function():void {
				DayData.reset();
				FlxG.switchState(new TransitionState(new TownState()));
			});
			but.text.size = 16;
			but.height = but.text.height;
			but.y = text.y + text.height + 2;
			but.x = FlxG.width / 2 - but.width / 2;
			but.redraw();
			
			add(text);
			add(but);
		}
		
	}

}