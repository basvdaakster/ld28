package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class Trigger extends FlxSprite 
	{
		
		private var callback:Function = null;
		private var rat:Boolean;
		private var flag:Boolean;
		
		public function Trigger(x:Number, y:Number, callback:Function, removeAfterTrigger:Boolean = true) 
		{
			solid = false;
			rat = removeAfterTrigger;
			this.x = x;
			this.y = y;
			width = 32;
			height = 32;
			makeGraphic(width, height, 0);
			this.callback = callback;
		}
		
		override public function update():void 
		{
			var state:PlayState = FlxG.state is PlayState ? FlxG.state as PlayState : null;
			if (state) {
				if (this.overlaps(state.thePlayer)) {
					if (!flag) {
						callback();
					}
					flag = true;
					if(rat) {
						exists = false;
					}
				}
				else {
					flag = false;
				}
			}
			
			super.update();
		}
		
	}

}