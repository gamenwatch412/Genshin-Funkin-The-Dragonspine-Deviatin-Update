// stole this from bbpanzu's Pinkie mod, thanks man even though you'll never acknowledge me lmao
package;
import flixel.*;

/**
 * ...
 * @author 
 */
class CutsceneState extends MusicBeatState
{
	var vido:String = "mods/introMod/_append/Twi End Cutscene.mp4";
	var next:Void->Void;
	public function new(vido:String = "mods/introMod/_append/Twi End Cutscene.mp4",next:Void->Void) 
	{
		super();
		this.vido = vido;
		this.next = next;
	}
	
	override function create() 
	{
		super.create();
		FlxG.sound.music.stop();
		
		var vid = new FlxVideo(vido);
		vid.finishCallback = next;
		add(vid);
		FlxG.camera.flash(0xff000000, 0.2);
	}
	
	public static function end(){
		Conductor.changeBPM(100);
		FlxG.switchState(new StoryMenuState());
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);
	}
	
}