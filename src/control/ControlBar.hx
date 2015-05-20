package control;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.media.VideoCodec;
import flash.utils.Timer;
import video.VideoContent;

/**
 * ...
 * @author lerry
 */
class ControlBar extends Sprite
{
	var bg:Bar;
	var video:VideoContent;
	var progress:DragBar;
	var timer:Timer;
	public function new() 
	{
		super();
		bg = new Bar();
		addChild(bg);
		progress = new DragBar();
		addChild(progress);
		progress.addEventListener(DragBar.DRAG_START, onDrag);
		progress.addEventListener(DragBar.DRAG_STOP, onDrag);
		
		timer = new Timer(100);
		timer.addEventListener(TimerEvent.TIMER, onTimer);
		
		
		
	}
	
	private function onTimer(e:TimerEvent):Void 
	{
		progress.value = video.getCurrentTime() / video.getTotalTime();
		alpha += (th - alpha) / 2;
	}
	
	public function blind(v:VideoContent):Void
	{
		video = v;
		timer.start();
	}
	
	private function onDrag(e:Event):Void 
	{
		if (video == null) return;
		
		if (e.type == DragBar.DRAG_STOP)
		{
			video.seek(video.getTotalTime() * progress.value);
			timer.start();
		}
		
		if (e.type == DragBar.DRAG_START)
		{
			timer.stop();
		}
	}
	
	public function resize(w:Float, h:Float):Void
	{
		progress.resize(w, h);
		bg.drawRect(w, 30, 0x302d26);
	}	
	
	private var th:Float;
	public function show():Void
	{
		th = 1;
	}
	
	public function hide():Void
	{
		th = 0;
	}
}