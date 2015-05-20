package video;

import flash.events.NetStatusEvent;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.net.ObjectEncoding;

/**
 * ...
 * @author lerry
 */
class VideoContent extends Video
{

	var nc:NetConnection;
	var ns:NetStream;
	var url:String;
	var info:VideoInfo;
	var autoPlay:Bool;
	var state:VideoState;
	public function new(width:Int=320, height:Int=240,autoPlay:Bool=true) 
	{
		super(width, height);
		this.autoPlay = autoPlay;
		
		nc = new NetConnection();
		nc.connect(null);
		ns = new NetStream(nc);
		
		ns.client = {};
		ns.client.onMetaData = onMedata;
		ns.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
		ns.bufferTime = 1;
		ns.bufferTimeMax = 2;
		
		info = new VideoInfo();
	}
	
	private function onNetStatus(e:NetStatusEvent):Void 
	{
		var info:Dynamic = e.info;
		//trace(info.code);
	}
	
	function onMedata(e:Dynamic):Void
	{
		info.data = e;
		var fs:Array<String> = Reflect.fields(e);
		dispatchEvent(new VEvent(VEvent.READ_COMPLETE));
	}
	
	public function play(url:String):Void 
	{
		this.url = url;
		ns.play(url);
		attachNetStream(ns);
		state = VideoState.PLAYING;
	}
	
	
	public function pause():Void 
	{
		ns.pause();
		state = VideoState.PAUSED;
	}
	
	public function resume():Void
	{
		ns.resume();
		state = VideoState.PLAYING;
	}
	
	public function stop():Void
	{
		ns.close();
		state = VideoState.STOP;
	}
	
	public function seek(offset:Float):Void
	{
		ns.seek(offset);
	}
	
	public function getCurrentTime():Float 
	{
		return ns.time;
	}
	
	public function getTotalTime():Float 
	{
		return info.duration;
	}
	
}