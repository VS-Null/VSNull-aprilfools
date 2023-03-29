package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;

using StringTools;

class TitleState extends MusicBeatState {
	override public function create():Void {
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		Init.Initialize();
		@:privateAccess
		trace("Loaded " + openfl.Assets.getLibrary("default").assetsLoaded + " assets (DEFAULT)");

		super.create();

		new FlxTimer().start(1, function(tmr:FlxTimer) {
			startIntro();
		});
	}

	function startIntro() {
		persistentUpdate = false;
		PlayState.SONG = Song.loadFromJson('two-trucks', 'two-trucks');
		PlayState.isStoryMode = false;
		PlayState.storyDifficulty = 1;
		FlxG.switchState(new PlayState());
	}
}