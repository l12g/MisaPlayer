package video;

/**
 * ...
 * @author lerry
 */
class VideoInfo
{
	public function new()
	{
		
	}

	public var data(null, set):Dynamic;
	
	function set_data(v:Dynamic):Dynamic 
	{
		data = v;
		duration = data.duration;
		return data;
	}
	
	public var fileSize:String;//视频大小
	public var audioDataRate:String;
	public var videoCodecid:String;
	public var encoder:String;//视频编码器
	public var frameRate:String;//帧率
	public var audioCodecid:String;
	public var duration:Float;//视频长度
	public var width:Float;//视频宽度
	public var height:Float;//视频高度
	public var audioSampleSize:Float;//音频
	public var stereo:Bool;//立体声
	public var audioSampleRate:String;
	
	
}