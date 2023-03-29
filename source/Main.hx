package;

import openfl.display.BlendMode;
import openfl.text.TextFormat;
import openfl.display.Application;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite {
	var gameWidth:Int = 1280;
	var gameHeight:Int = 720;
	var initialState:Class<FlxState> = TitleState;
	var zoom:Float = -1;
	var framerate:Int = 60;
	var skipSplash:Bool = true;
	var startFullscreen:Bool = false;

	var fpsCounter:Overlay;

	public static function main():Void {
		Lib.current.addChild(new Main());
	}

	public function new() {
		super();

		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1) {
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}

		addChild(new FlxGame(gameWidth, gameHeight, initialState, #if (flixel < "5.0.0") zoom, #end framerate, framerate, skipSplash, startFullscreen));

		fpsCounter = new Overlay(10, 3, gameWidth, gameHeight);
		addChild(fpsCounter);
		if (fpsCounter != null)
			fpsCounter.visible = FlxG.save.data.fps;
	}

	inline public function toggleFPS(fpsEnabled:Bool):Void {
		fpsCounter.visible = fpsEnabled;
	}

	inline public function setFPSCap(cap:Float) {
		openfl.Lib.current.stage.frameRate = cap;
	}

	inline public function getFPSCap():Float {
		return openfl.Lib.current.stage.frameRate;
	}

	inline public function getFPS():Float {
		return fpsCounter.currentFrames;
	}
}