package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			["Genshin Funkin'"],
			['Gamenwatch412',		'gamenwatch412',		"Main programmer, charter, animator, and musician",																'https://www.youtube.com/channel/UCC0sf7IBgsVKVM9cEpwdfLQ', 		'0xFF660066'],
			['Doodle',				'doodle', 				'Artist for various sprites, notes, week logos, dev credit icons and Inazuma background (Google Draw)', 		'https://discordapp.com/users/772212603857403904/', 				'0xFFE6A0A0'],
			['Minja',				'minja',				'Beta Tester',																									'https://www.youtube.com/channel/UC1bs54iU3nxb1i-MH9H6MSQ', 		'0xFF17968E'],
			['Rainbow1225',			'rainbow1225', 			'Moral and mental support, additional background artist',														'https://www.youtube.com/channel/UCPk5BmcnOj-zPJlz14_Inog', 		'0xFF751911'],
			['RedFlaim',			'blank',				'Creator of Hu-Tao, Chongyun, Xingqiu sprites and Liyue background',											'https://gamebanana.com/members/1873543', 							'0xFF4494E6'],
			['Kurxmi',	 			'blank', 				'Artist for Keqing and Kaeya sprites',																			'https://gamebanana.com/members/1837776',							'0xFFE01F32'],
			['Fenveon',				'blank',				'Artist for Venti sprite', 																						'https://gamebanana.com/members/1775140', 							'0xFFFF9300'],
			['Ghost1971029',		'blank',				'Script developer for note camera movement',																	'https://gamebanana.com/members/1971029',							'0xFF03FCBA'],
			['fnfgf20',				'blank',				"Script developer for rain",																					'https://gamebanana.com/members/1987843',							'0xFFF0D432'],
			['Zera.osz',			'blank',				'Boyfriend with no mic sprite creator',																			'https://gamebanana.com/members/1794140',							'0xFFFF6F00'],
			['Zero',				'blank',				'Reanimated Boyfriend sprite',																					'https://gamebanana.com/tools/9336',								'0xFF317A8A'],
			['eeveeone',			'blank',				'Sumeru Title Screen Background',																				'https://www.deviantart.com/eeveeone',								'0xFFEAA901'],
			['PicMix',				'blank',				'Confetti GIF',																									'https://en.picmix.com/stamp/confetti-1742582',						'0xFFEE3174'],
			['Maginage Matches',	'blank',				'Front crowd sprite asset',																						'https://gamebanana.com/mods/309419',								'0xFFFAD92A'],
			['Retrospecter',		'retro',				'Snowstorm sprite asset',																						'https://gamebanana.com/mods/317366',								'0xFF17D8E4'],
			['Divi T',				'blank',				'Scrolling BG script',																							'https://gamebanana.com/mods/392543',								'0xFF510803'],
			[''],
			['Song Credits'],
			['A Sweet Smile Groove Remix', 			'blank', 		'Originally Remixed by Miloh Productions, FNF instruments implemented by Gamenwatch412',	   'https://www.youtube.com/watch?v=UXTBxeWyuU8&t=0s', 												'0xFFFFFFFF'],
			['Hu Tao (English Version)',		 	'blank',		'Performed by PeachyFranny and Raayo',														   'https://www.youtube.com/watch?v=8za2EYuDcjE',													'0xFFe3b342'],
			['Hu Tao (Alternate Version)',		 	'blank',		'Performed by Brianna Knickerbocker and Raayo',												   'https://www.youtube.com/watch?v=CYczGDXbLNc',													'0xFFe3b342'],
			['Let the Wind Tell You', 				'blank',		'Performed by花园花玲, 喵☆酱, 宴宁ccccc, and kinsen',											'https://www.youtube.com/watch?v=KrNUrgaOsCc',													 '0xFFe3b342'],
			['Hikaru Nara', 						'blank', 		'Performed by 多多, kinsen, 花玲, 喵酱, 小N, 宴宁, 鹿喑, and 萧翟',								 'https://www.youtube.com/watch?v=eF6preXfMHw',			  										  '0xFFe3b342'],
			['Renai Circulation', 					'blank', 		'Performed by kinsen & 鹿喑kana', 																'https://www.youtube.com/watch?v=1YrI0y1yG_0', 													'0xFFa757cb'],
			['Saikai',								'blank',		'Performed by kinsen & 鹿喑kana',																'https://www.youtube.com/watch?v=hHoBogOuxhw',													'0xFFa757cb'],
			['Vigilant Yaksha',						'blank',		'Performed by kinsen',																			'https://www.youtube.com/watch?v=Q7x746k_lM0',											       '0xFFa757cb'],
			['Bloom of the Wind',					'blank',		'Performed by 喵☆酱, 花园花玲, 诺亚rococonorya, and 小敢',										  'https://youtu.be/9fGmirjxliA', 																'0xFF72e2c3'],
			["Heaven's Map", 						'blank', 		'Performed by 多多poi and 宴宁ccccc',															 'https://www.youtube.com/watch?v=uHW9NMedm8A', 												'0xFF72e2c3'],
			['Soldier, Poet, King', 				'blank', 		'Performed by Joe Zieja and Erika Harlacher',													'https://www.youtube.com/watch?v=VTiqVG1qs7M',													'0xFF72e2c3'],
			['To You On The Other Side',			'blank',		'Performed by 多多poi and 宴宁ccccc',															'https://youtu.be/ZpsRKhCQTR8',																	'0xFF23c18a'],
			['Secret Base',							'blank',		'Performed by 多多poi, 宴宁ccccc and 花玲',														 'https://youtu.be/nyRw958XJII',																'0xFF23c18a'],
			['Raise You Up',						'blank',		'Performed by Brianna Knickerbocker, Kayli Mills, Jennifer Losi, and Jackie Lastra',			'https://www.youtube.com/watch?v=DdU8xMfsTuc',													'0xFF23c18a'],
			['If You Suddenly Think of Me',			'blank',		'Performed by 喵☆酱, 笨笨芄_彭博, 爆裂菊是也 and 花园花玲',										   'https://www.youtube.com/watch?v=11R3H8kackA',												  '0xFF394546'],
			['Celestial Destiny',					'blank',		'Song video source by MaxLevel',																'https://www.youtube.com/watch?v=Bnl8OzZ5UvM',													'0xFF42DDF5'],
			['SunnyMusic #1',						'blank',		'MIDI Provider for acoustic Celestial Destiny',													'https://soundcloud.com/sunnymusic-piano_covers/website-bgm-genshin-impact-midi-download',		'0xFFDE7073'],
			['MarStarBro', 							'mar', 			'Original Composer for Both Endless Versions (Sonic.exe)',										'https://twitter.com/MarstarMain', 																'0xFFf1772d'],
			['NoahWantsDie',						'blank',		'MIDI Provider for new Endless Remix',															'https://github.com/NoahWantsDie/fnf-shits',													'0xFF9ba3bf'],
			['Vzer',								'vzer',			'Original Composer for Crimson (Selever)',														'https://www.youtube.com/c/Vzerafael',															'0xFFFC8006'],
			['Rozebud',								'blank',		'Original Composer for Madness (Tricky)',														'https://www.youtube.com/c/Rozebud',															'0xFF191699'],
			['miditechx',							'blank',		"Helped Transcribe Fury Unleashed into MIDI",													'https://www.fiverr.com/share/75aEzy',															'0xFF88c27c'],
			[''],
			['Original Voice Actors'],
			['Brianna Knickerbocker',		'blank',		'Voice source for Hu Tao',				'https://twitter.com/briannanoellek',	'0xFF684043'],
			['Kayli Mills',					'blank',		'Voice Source for Keqing',				'https://twitter.com/KayliMills',		'0xFFc7badd'],
			['Zach Aguilar',				'blank',		'Voice Source for Aether',				'https://twitter.com/airzach',			'0xFFfbf0ab'],
			['Erika Harlacher',				'blank',		'Voice Source for Venti',				'https://twitter.com/ErikaHarlacher',	'0xFF53c19f'],
			['Khoi Dao',					'blank',		'Voice Source for Albedo',				'https://twitter.com/khoidaooo',		'0xFFfcf4c3'],
			['Anne Yatco',					'blank',		'Voice Source for Raiden Shogun',		'https://twitter.com/annejyatco',		'0xFF301a71'],
			['Keith Silverstein',			'blank',		'Voice Source for Zhongli',				'https://twitter.com/SilverTalkie',		'0xFF210e05'],
			['Griffin Burns',				'blank',		'Voice Source for Tartaglia / Childe',	'https://twitter.com/TheGriffinBurns',	'0xFF980000'],
			['Kimberley Anne Campbell',		'blank',		'Voice Source for Nahida',				'https://twitter.com/kixee',			'0xFF5e7f3b'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',							'https://twitter.com/Shadow_Mario_',	'444444'],
			['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',						'https://twitter.com/RiverOaken',		'C30085'],
			['shubs',				'shubs',			'Additional Programmer of Psych Engine',					'https://twitter.com/yoshubs',			'279ADC'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb-panzu',			'Ex-Programmer of Psych Engine, borrowed snow asset from Holiday mod, composer of Manifest (Sky)',							'https://twitter.com/bbsub3',			'389A58'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'iflicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	'https://twitter.com/flicky_i',			'AA32FE'],
			['SqirraRNG',			'gedehari',			'Chart Editor\'s Sound Waveform base',						'https://twitter.com/gedehari',			'FF9300'],
			['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',								'https://twitter.com/polybiusproxy',	'FFEAA6'],
			['Keoiki',				'keoiki',			'Note Splash Animations',									'https://twitter.com/Keoiki_',			'FFFFFF'],
			['Smokey',				'smokey',			'Spritemap Texture Support',								'https://twitter.com/Smokey_5_',		'4D5DBD'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",						'https://twitter.com/ninja_muffin99',	'F73838'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",							'https://twitter.com/PhantomArcade3K',	'FFBB1B'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",							'https://twitter.com/evilsk8r',			'53E52C'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",							'https://twitter.com/kawaisprite',		'6475F3']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("zh-cn.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-1 * shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(1 * shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.isBold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
					item.forceX = item.x;
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
					item.forceX = item.x;
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}