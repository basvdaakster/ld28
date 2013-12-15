package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class BouncingArrow extends FlxSprite
	{
		
		private var time:Number = 0;
		private var baseX:Number;
		private var baseY:Number;
		private var dX:Number;
		private var dY:Number;
		private var freq:Number = 1;
		private var amp:Number = 8;
		
		public function BouncingArrow(x:Number, y:Number, rotation:Number = 0) 
		{
			solid = false;
			
			baseX = x;
			baseY = y;
			
			/*
			 * cos(rot) = dx / amp
			 * dx = cos(rot) * amp
			 * 
			 * tan(rot) = dy / dx
			 * dy = dx * tan(rot)
			 * */
			dX = Math.cos(rotation / 180 * Math.PI + Math.PI / 2) * amp;
			dY = dX * Math.tan(rotation / 180 * Math.PI + Math.PI / 2);
			
			this.x = x;
			this.y = y;
			this.angle = rotation;
			loadGraphic(Assets.BOUNCING_ARROW);
		}
		
		override public function update():void 
		{
			time += FlxG.elapsed;
			
			this.x = baseX + Math.sin(Math.PI * 2 * time / freq) * dX;
			this.y = baseY + Math.sin(Math.PI * 2 * time / freq) * dY;
			
			super.update();
		}
		
	}

}