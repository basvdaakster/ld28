package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Talker extends Clickable 
	{
		
		public static const NORMAL:int = 0;
		public static const WHITE:int = 4;
		public static const GREEN:int = 30;
		public static const GREEN_WHITE:int = 34;
		public static const NAKED:int = 60;
		public static const GREEN_NAKED:int = 90;
		
		private var text:Array = [];
		private var index:int = 0;
		private var popup:TextPopup = null;
		private var but:CustomButton = null;
		private var talking:Boolean = false;
		
		public function Talker(x:int, y:int, text:Array, type:int = WHITE) 
		{			
			super();
			
			makeGraphic(32, 32, 0);
			
			this.x = x * 32;
			this.y = y * 32;
			width = 32;
			height = 32;
			
			anim = new FlxSprite();
			anim.loadGraphic(Assets.CHARACTERS, true, false, 32, 32);
			
			var ishift:int = type;
			
			var fps:Number = 8; 
			anim.addAnimation("idle_n", [ 11 + ishift ], fps);
			anim.addAnimation("idle_e", [ 12 + ishift ], fps);
			anim.addAnimation("idle_s", [ 10 + ishift ], fps);
			anim.addAnimation("idle_w", [ 13 + ishift ], fps);
			anim.addAnimation("walk_n", [ 21 + ishift, 31 + ishift ], fps);
			anim.addAnimation("walk_e", [ 22 + ishift, 32 + ishift ], fps);
			anim.addAnimation("walk_s", [ 20 + ishift, 30 + ishift ], fps);
			anim.addAnimation("walk_w", [ 23 + ishift, 33 + ishift ], fps);
			facing = UP;
			
			immovable = true;
			
			playAnim("idle_s");
			this.text = text;
		}
		
		override public function onClick():void 
		{
			var state:PlayState = (FlxG.state as PlayState);
			if (state.hasPopup || talking || FlxU.getDistance(state.thePlayer.getMidpoint(), this.getMidpoint()) > Clickable.RANGE) {
				return;
			}

			talking = true;
			
			talk();
			
			if (Math.abs(getMidpoint().x - state.thePlayer.getMidpoint().x) > Math.abs(getMidpoint().y - state.thePlayer.getMidpoint().y)) {
				if (state.thePlayer.getMidpoint().x > getMidpoint().x) {
					setFacing(FlxObject.RIGHT);
				}
				else {
					setFacing(FlxObject.LEFT);
				}
			}
			else {
				if (state.thePlayer.getMidpoint().y > getMidpoint().y) {
					setFacing(FlxObject.DOWN);
				}
				else {
					setFacing(FlxObject.UP);
				}
			}
			
			super.onClick();
		}
		
		private function talk():void {
			var but:CustomButton = new CustomButton("OK", function():void {
				popup.removeFromState();
				if(index < text.length) {
					talk();
				}
				else {
					index = 0;
					talking = false;
				}
			}, 100);
			
			popup = new TextPopup(text[index], [but], true);
			popup.x = popup.y = 2;
			(FlxG.state as PlayState).hud.add(popup);
			
			if (index < text.length) {
				index++;
			}
		}
		
		public function setFacing(facing:uint):void 
		{
			this.facing = facing;
			switch(facing) {
				case DOWN:
					playAnim("idle_s");
					break;
				case LEFT:
					playAnim("idle_w");
					break;
				case RIGHT:
					playAnim("idle_e");
					break;
				default:
					playAnim("idle_n");
					break;
			}
		}
		
		private function playAnim(a:String):void 
		{
			if (!_curAnim || _curAnim.name != a) {
				anim.play(a, true);
			}
		}
		
	}

}