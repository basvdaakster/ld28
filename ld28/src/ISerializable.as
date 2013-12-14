package  
{
	/**
	 * ...
	 * @author Bas van den Aakster
	 */
	public interface ISerializable 
	{
		function toObject():Object;
		function fromObject(o:Object):void;
	}

}