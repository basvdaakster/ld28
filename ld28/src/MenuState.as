package  

{
  import flash.display.BitmapData;
  import org.flixel.FlxButton;
  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxObject;
  import org.flixel.FlxPoint;
  import org.flixel.FlxRect;
  import org.flixel.FlxSound;
  import org.flixel.FlxSprite;
  import org.flixel.FlxState;
  import org.flixel.FlxText;
  import org.flixel.system.input.Mouse;
  
  /**
   * ...
   * @author Bas van den Aakster
   */
  
	public class MenuState extends FlxState
	{
		
		public var textString:String = "Life as a one day fly!";
		public var infoTxt:FlxText = new FlxText(30, 40, 300, textString, true);
	 
		public var startBtn:FlxButton;
		public var infoBtn:FlxButton;
		public var ludumBtn:FlxButton;
	  
		override public function create():void 
		{
			infoTxt.size = 20;
			add(infoTxt);
			FlxG.mouse.show();
			startBtn = new FlxButton(270, 120, "Start your day!", function():void {
				FlxG.playMusic(Assets.MUSIC, 0.2);
				FlxG.play(Assets.SELECT);
				FlxG.switchState(new TownState());
			});
				startBtn.x = 160 - startBtn.width / 2;
				add(startBtn);
				infoBtn = new FlxButton(270, 160, "Information", function():void {
				FlxG.play(Assets.SELECT);
				FlxG.switchState(new InformationMenuState());
			});
			infoBtn.x = 160 - infoBtn.width / 2;
			add(infoBtn); 
		}
	}
}