local xx = 320;
local yy = 100;
local xx2 = 820;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
	removeLuaSprite('snowfall', true);
	makeLuaSprite('albedoDEAD', 'teyvat/dragonspine/frozen-albedo', 1300, 0);

	makeLuaSprite('BlackSquare', nil, -700, -700);
	makeGraphic('BlackSquare', 6900, 6900, '000000');
	addLuaSprite('BlackSquare', true);
	doTweenAlpha('transparency', 'BlackSquare', 0, 0.1, 'linear');

	if not lowQuality then
		makeAnimatedLuaSprite('snowfall_first_half','teyvat/dragonspine/snowfall', -1500, -6900);
		setLuaSpriteScrollFactor('snowfall_first_half', 0.8, 0.9);
		scaleObject('snowfall_first_half', 2.5, 2.5);
	end
		addLuaSprite('snowfall_first_half', true);
		addAnimationByPrefix('snowfall_first_half', 'fall', 'fall', 60, true);
		addLuaSprite('albedoDEAD', false);
		setObjectOrder('albedoDEAD',4)
		setObjectOrder('gfGroup',1)
		setObjectOrder('dadGroup',2)
		setObjectOrder('boyfriendGroup',3)
		setObjectOrder('BlackSquare',9)
		setObjectOrder('snowfall_first_half',5)
		precacheImage('teyvat/dragonspine/snowfall')
		precacheImage('teyvat/dragonspine/frozen-albedo')
end

function onStepHit()
	if curStep == 1088 then
      doTweenAlpha('blacktransition_in', 'BlackSquare', 1, 0.001, 'linear');
   end
	if curStep == 1136 then
      setProperty('cameraSpeed', 1.8);
      triggerEvent('Set Cam Zoom', 0.78, 0.01);
      xx = 120;
   end
	if curStep == 1151 then
      doTweenAlpha('blacktransition_out', 'BlackSquare', 0, 0.001, 'linear');
   end
	if curStep == 2256 then
	setProperty('cameraSpeed', 1.2);
   end
	if curStep == 2383 then
      doTweenColor('susbedo_fadeout', 'dad', '000000', 2.5, 'circInOut');
   end
	if curStep == 2469 then
      doTweenAlpha('blacktransition_in_end', 'BlackSquare', 1, 0.001, 'linear');
      removeLuaSprite('gradient', true);
   end
end

function onTweenCompleted(tag)
if tag == ('susbedo_fadeout') then
     doTweenAlpha('susbedo_disappear', 'dad', 0, 2.5, 'linear');
     triggerEvent('Play Animation', 'scream', 'susbedo final phase');
   end
end

function onUpdate(elapsed)
--setProperty('snowfall.y',getProperty('snowfall.y') + 1);

	--if getProperty('snowfall.y') >= 0 then
		--setProperty('snowfall.y', -297);

	--end

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', -100-110*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs);
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
