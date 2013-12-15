package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class TransitionState extends FlxState
	{
		
		private var oldBmp:BitmapData;
		private var to:FlxState;
		private var delay:Number = .2;
		private var time:Number = 0;
		
		public function TransitionState(to:FlxState) 
		{
			this.to = to;
			
			oldBmp = FlxG.camera.buffer.clone();
		}
		
		override public function update():void 
		{
			time += FlxG.elapsed;
			
			FlxG.camera.alpha = 1 - time / delay;
			
			if (time >= delay) {
				FlxG.switchState(to);
			}
			
			super.update();
		}
		
		override public function draw():void 
		{
			super.draw();
			
			FlxG.camera.buffer.draw(oldBmp);
		}
		
	}

}