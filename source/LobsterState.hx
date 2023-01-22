#if VIDEOS_ALLOWED
import vlc.MP4Handler;
#end

class LobsterState extends MusicBeatState {
    override function create() {
        var video:MP4Handler = new MP4Handler();
		video.playVideo(Paths.video('All about scorpions'));
		video.finishCallback = function()
		{
			loop();
		}
    }

    function loop() {
        var video:MP4Handler = new MP4Handler();
		video.playVideo(Paths.video('All about scorpions'));
		video.finishCallback = function()
		{
			loop();
		}
    }
}