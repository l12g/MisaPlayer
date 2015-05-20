package;

import control.ControlBar;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.ui.Mouse;
import flash.utils.Timer;
import video.VideoContent;
/**
 * ...
 * @author lerry
 */
class MPlayer extends Sprite
{
	
	public static var STAGE:Stage;
	var video:VideoContent;
	var option:ControlBar;
	var timer:Timer;
	public function new() 
	{
		super();
		
		video = new VideoContent();
		addChild(video);
		video.addEventListener(VEvent.READ_COMPLETE, onReadVideoComplete);
		addEventListener(Event.ADDED_TO_STAGE, added);
		
		addEventListener(MouseEvent.ROLL_OVER, function(e):Void { 
			option.show();
			timer.start();
			
		} );
		addEventListener(MouseEvent.ROLL_OUT, function(e):Void { 
			option.hide();
			timer.stop();
			timer.reset();
		} );
		addEventListener(MouseEvent.MOUSE_MOVE, function(e):Void { 
			Mouse.show();
			option.show();
			timer.reset();
			timer.start();
		} );
		
		timer = new Timer(1000);
		timer.addEventListener(TimerEvent.TIMER, onTimer);
	}
	
	private function onTimer(e:TimerEvent):Void 
	{
		trace(timer.currentCount);
		if (timer.currentCount == 5) 
		{
			option.hide();
			Mouse.hide();
		}
	}
	
	
	
	private function added(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		STAGE = stage;
		option = new ControlBar();
		addChild(option);
		option.blind(video);
		repos();
	}
	
	private function onDragProgress(e:VEvent):Void 
	{
		video.seek(video.getTotalTime()*e.data);
	}
	
	private function onReadVideoComplete(e:VEvent):Void 
	{
		repos();
	}
	
	public function play(url:String):Void 
	{
		video.play(url);
	}
	
	function repos():Void
	{
		option.resize(video.width-20, 5);
		option.y = video.height - option.height;
		option.x = video.width / 2 - option.width / 2;
	}
	
}