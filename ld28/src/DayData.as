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
		
		public static var LIFE_TIME:Number = .2 * 60;
		public static var CURRENT_DAY_TIME:Number = 0;
		public static var SERIALIZED_OBJECTS:Object = { };
		public static var INVENTORY:Item = null;
		
		private static var FLAGS:Array = [];
		
		public static function saveSerializedObjects(state:PlayState):void {
			SERIALIZED_OBJECTS[flash.utils.getQualifiedClassName(state)] = [];
			for (var i:uint = 0; i < state.mapObjects.members.length; i++) {
				if (state.mapObjects.members[i] is ISerializable) {
					var mem:ISerializable = state.mapObjects.members[i];
					addSerializedObject(state, mem);
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
					ptr++;
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
			INVENTORY = null;
			FLAGS = [];
		}
		
		public static function updateDay():void {
			CURRENT_DAY_TIME -= FlxG.elapsed;
			if (CURRENT_DAY_TIME <= 0) {
				CURRENT_DAY_TIME = 0;
				FlxG.switchState(new TransitionState(new DayEndState()));
			}
		}
		
		public static function hasFlag(str:String):Boolean { 
			return FLAGS.indexOf(str) > -1;
		}
		
		public static function addFlag(str:String):void {
			FLAGS.push(str);
		}
		
		public static function removeFlag(str:String):void {
			var i:int = -1;
			while ((i = FLAGS.indexOf(str)) > -1) {
				FLAGS.splice(i, 1);
			}
		}
		
		public static function giveItem(it:Item):void {
			if (!INVENTORY) {
				INVENTORY = it;
			}
			else {
				trace("INVENTORY FULL!!!!!!!!!");
			}
		}
	}

}