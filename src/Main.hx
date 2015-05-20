package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;

/**
 * ...
 * @author lerry
 */

class Main 
{
	
	static function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		var v:MPlayer = new MPlayer();
		v.play("v.FLV");
		
		stage.addChild(v);
		
		stage.addEventListener(Event.ENTER_FRAME, function(e:Event):Void{
			//trace(v.getCurrentTime());
		});
	}
	
}