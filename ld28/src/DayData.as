package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public class DayData
	{
		public static var thePlayer;
		private static var _townState:TownState;
		private static var _saloonState:SaloonState;
		
		public static function get townState():TownState {
			if (!_townState) {
				_townState = new TownState();
			}
			return _townState;
		};
		
		public static function get saloonState:SaloonState {
			if (!_saloonState) {
				_saloonState = new TownState();
			}
			return _saloonState;
		}
		
		public static function reset():void {
			_townState = null;
			_saloonState = null;
		}
		
	}

}