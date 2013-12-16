package  
{
 import org.flixel.FlxState;
 import flash.display.BitmapData;
  import org.flixel.FlxButton;
  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxObject;
  import org.flixel.FlxPoint;
  import org.flixel.FlxRect;
  import org.flixel.FlxSprite;
  import org.flixel.FlxState;
  import org.flixel.FlxText;
  import org.flixel.system.input.Mouse;
 /**
  * ...
  * @author Dan Drory
  */
 public class InformationMenuState extends FlxState
 {
  public var textString:String = "This game is all about information. You're a one day fly and well you guessed it, you've only got one day to live. Wich in our game is just one minute. It is your task to make that day count. Your ultimate goal is to get with the best girl in town. But who is that, where can you find her and most importantly how will you make her fall in love with you. And if you couldn't do that within one day don't worry! You can just start over with the information you already posses. Go get that girl!";
  public var infoTxt:FlxText = new FlxText(10, 20, 300, textString, true);
  public var backBtn:FlxButton;
  
  override public function create():void 
  {
   add(infoTxt);
   FlxG.mouse.show();
   backBtn = new FlxButton(320, 160, "Back", function():void {
    FlxG.switchState(new MenuState());
   });
   backBtn.x = 160 - backBtn.width / 2;
   add(backBtn);
  }
  
 }

}