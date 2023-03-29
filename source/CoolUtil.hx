package;

import lime.utils.Assets;

using StringTools;

class CoolUtil {
	public static var difficultyArray:Array<String> = ['Easy', "Normal", "Hard"];

	public static function difficultyString():String {
		return difficultyArray[PlayState.storyDifficulty];
	}

	public static function coolTextFile(path:String):Array<String> {
		return [for (i in Assets.getText(path).trim().split('\n')) i.trim()];
	}

	public static function coolStringFile(path:String):Array<String> {
		return [for (i in path.trim().split('\n')) i.trim()];
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int> {
		return [for (i in min...max) i];
	}
}
