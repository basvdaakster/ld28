package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class DayData
	{
		
		public static var LIFE_TIME:Number = 2 * 60;
		public static var CURRENT_DAY_TIME:Number = 0;
		public static var SERIALIZED_OBJECTS:Object = { };
		public static var INVENTORY:Item = null;
		
		public static function saveSerializedObjects(state:PlayState):void {
			for (var i:uint = 0; i < state.mapObjects.members.length; i++) {
				if (state.mapObjects.members[i] is ISerializable) {
					addSerializedObject(state, state.mapObjects.members[i]);
				}
			}
		}
		
		public static function loadSerializedObjects(state:PlayState):void {
			var objs:Array = getStatesSerObjs(state);
			if (!objs) {
				return;
			}
			
			var ptr:uint = 0;
			for each (var mem:Object in objs) {
				while (ptr < state.mapObjects.members.length && !(state.mapObjects.members[ptr] is ISerializable)) ptr++;
				if (ptr < state.mapObjects.members.length) {
					(state.mapObjects.members[ptr] as ISerializable).fromObject(mem);
				}
				else {
					break;
				}
			}
		}
		
		private static function getStatesSerObjs(state:PlayState):Array {
			var c:String = flash.utils.getQualifiedClassName(state);
			if (SERIALIZED_OBJECTS[c]) {
				return SERIALIZED_OBJECTS[c];
			}
			return null;
		}
		
		private static function addSerializedObject(state:FlxState, o:Object):void {
			var c:String = flash.utils.getQualifiedClassName(state);
			if (!SERIALIZED_OBJECTS[c]) {
				SERIALIZED_OBJECTS[c] = [];
			}
			(SERIALIZED_OBJECTS[c] as Array).push(o.toObject());
		}
		
		public static function reset():void {
			SERIALIZED_OBJECTS = { };
			CURRENT_DAY_TIME = LIFE_TIME;
		}
		
		public static function updateDay():void {
			CURRENT_DAY_TIME -= FlxG.elapsed;
			if (CURRENT_DAY_TIME <= 0) {
				CURRENT_DAY_TIME = 0;
				FlxG.switchState(new TransitionState(new DayEndState()));
			}
		}
	}

}