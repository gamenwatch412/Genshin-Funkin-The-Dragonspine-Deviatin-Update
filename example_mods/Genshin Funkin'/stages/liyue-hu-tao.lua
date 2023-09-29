function onCreate()
	
	setProperty('timeBar.color', getColorFromHex('e3b342'));
	makeLuaSprite('liyue', 'teyvat/liyue/liyue', -610,-230);
	makeAnimatedLuaSprite('zhongli', 'characters/zhongli', -710, -340);
	makeAnimatedLuaSprite('xingqiu', 'characters/xingqiu', 1200, 0);
	makeAnimatedLuaSprite('chongyun', 'characters/chongyun_assets', 860, 100);
	addAnimationByPrefix('zhongli', 'idle', 'zhongli idle', 24, false);
	addAnimationByPrefix('xingqiu', 'idle', 'xingqiu idle dance', 24, false);
	addAnimationByPrefix('chongyun', 'idle', 'chongyun Dancing Beat00', 24, true);
	addAnimationByIndices('chongyun', 'danceRight', 'chongyun Dancing Beat00', '15, 16,	17, 18, 19,	20, 21, 22, 23, 24, 25, 26, 27, 28, 29', 24);
	addAnimationByIndices('chongyun', 'danceLeft', 'chongyun Dancing Beat00', '30, 0, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14', 24);
	scaleObject('zhongli', 0.9, 0.9);
	setProperty('xingqiu.flipX', true);
	addLuaSprite('liyue', false);
	addLuaSprite('zhongli', false);
	addLuaSprite('chongyun', false);
	addLuaSprite('xingqiu', false);

end

function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('zhongli', 'idle', true);
	objectPlayAnimation('xingqiu', 'idle', true);
end
	luaSpritePlayAnimation('chongyun', 'danceRight');
	if curBeat % 2 == 0 then
	luaSpritePlayAnimation('chongyun','danceLeft');
	end
end