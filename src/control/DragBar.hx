package control;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * ...
 * @author lerry
 */
class DragBar extends Sprite
{
	public static inline var DRAG_START:String = "dragStart";
	public static inline var DRAG_STOP:String = "dragSop";
	public static inline var CHANGE:String = "change";
	
	
	var bg0:Bar;
	var bg1:Bar;
	var drag:Bar;
	var w:Float;
	var h:Float;
	var val:Float;
	var isDrag:Bool;
	public function new() 
	{
		super();
		bg0 = new Bar();
		bg1 = new Bar();
		addChild(bg0);
		addChild(bg1);
		drag = new Bar();
		addChild(drag);
		buttonMode = true;
		
		addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		MPlayer.STAGE.addEventListener(MouseEvent.MOUSE_UP, onUp);
		drag.addEventListener(MouseEvent.ROLL_OVER, onDragOver);
		drag.addEventListener(MouseEvent.ROLL_OUT, onDragOut);
	}
	
	private function onDragOut(e:MouseEvent):Void 
	{
		drag.drawCircle(h, 0xcccccc);
		drag.y = h / 2;
	}
	
	private function onDragOver(e:MouseEvent):Void 
	{
		drag.graphics.beginFill(0x666666);
		drag.graphics.drawCircle(0, 0, drag.width / 4);
		drag.graphics.endFill();
		drag.y = h / 2;
	}
	
	private function onDown(e:MouseEvent):Void 
	{
		MPlayer.STAGE.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
		onMove(null);
		isDrag = true;
		dispatchEvent(new Event(DRAG_START));
	}
	
	
	function onUp(e:MouseEvent):Void 
	{
		MPlayer.STAGE.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
		
		if (isDrag) {
			isDrag = false;
			dispatchEvent(new Event(DRAG_STOP));
		}
	}
	
	private function onMove(e:MouseEvent):Void 
	{
		value = mouseX / w;
	}
	
	public function resize(w:Float, h:Float):Void
	{
		this.w = w;
		this.h = h;
		bg0.drawRect(w, h, 0x555555);
		drag.drawCircle(h, 0xcccccc);
		drag.y = h / 2;
	}
	
	
	public var value(get, set):Float;
	
	function get_value():Float 
	{
		return val;
	}
	function set_value(v:Float):Float {
		val = v;
		if (val >= 1) val = 1;
		if (val <= 0) val = 0;
		var t:Float = w * val;
		bg1.drawRect(t, h, 0xff0000);
		drag.x = t;
		dispatchEvent(new Event(CHANGE));
		return val;
	}
	
}