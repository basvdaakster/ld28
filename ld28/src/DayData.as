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
		
		public static var DAY_TIME:Number = 0;
		public static var SERIALIZED_OBJECTS:Object = { };
		
		public static function saveSerializedObjects(state:FlxState):void {
			for (var i:uint = 0; i < state.members.length; i++) {
				if (state.members[i] is ISerializable) {
					addSerializedObject(state, state.members[i]);
				}
			}
		}
		
		public static function loadSerializedObjects(state:FlxState):void {
			var objs:Array = getStatesSerObjs(state);
			if (!objs) {
				return;
			}
			
			var ptr:uint = 0;
			for each (var mem:Object in objs) {
				while (ptr < state.members.length && !(state.members[ptr] is ISerializable)) ptr++;
				if (ptr < state.members.length) {
					(state.members[ptr] as ISerializable).fromObject(mem);
				}
				else {
					break;
				}
			}
		}
		
		private static function getStatesSerObjs(state:FlxState):Array {
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
			DAY_TIME = 0;
		}
	}

}