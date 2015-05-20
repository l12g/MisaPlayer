package;

import flash.events.Event;

/**
 * ...
 * @author lerry
 */
class VEvent extends Event
{

	public static inline var READ_COMPLETE:String = "readcom";
	public static inline var DRAG_PROGRESS:String = "dragpro";
	
	public var data:Dynamic;
	public function new(type:String,data:Dynamic=null) 
	{
		super(type);
		this.data = data;
		
	}
	
}