package control;

import flash.display.Sprite;
import flash.globalization.NumberFormatter;

/**
 * ...
 * @author lerry
 */
class Bar extends Sprite
{

	public function new() 
	{
		super();	
	}
	
	public function drawRect(w:Float,h:Float,color:UInt):Void
	{
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRect(0, 0, w, h);
		graphics.endFill();
	}
	
	public function drawCircle(r:Float, color:UInt):Void
	{
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawCircle(0, 0, r);
		graphics.endFill();
		
	}
	
	public function clear():Void
	{
		graphics.clear();
	}
	
}