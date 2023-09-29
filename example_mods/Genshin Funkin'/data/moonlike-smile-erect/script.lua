local allowCountdown = false
local xx = 520;
local yy = 1000;
local xx2 = 820;
local yy2 = 1100;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
	precacheImage('cinematic crop');
	makeLuaSprite('cinema', 'cinematic crop', -70, -185);
	setObjectCamera('cinema', 'other');
	setScrollFactor('cinema', 0, 0);
	scaleObject('cinema', 1.1, 1.5);
	addLuaSprite('cinema', true);
end


--[[function onBeatHit()
   	-- if curBeat == 36 then
      -- setProperty('defaultCamZoom', 1.0);
   end
	if curBeat == 48 then
      setProperty('defaultCamZoom', 0.73);
   end
	if curBeat == 432 then
      setProperty('defaultCamZoom', 1.0);
   end
	if curBeat == 448 then
      setProperty('defaultCamZoom', 0.73);
   end
end --]]

function onStepHit()
    if curStep == 1024 then
        setProperty('defaultCamZoom', 0.93);
      end
    if curStep == 1056 then
        setProperty('defaultCamZoom', 0.56);
    end
   	if curStep == 1312 then
      setProperty('defaultCamZoom', 1.0);
    end
    if curStep == 1567 then
        setProperty('defaultCamZoom', 0.73);
    end
    if curStep == 1696 then
        setProperty('defaultCamZoom', 0.63);
    end
    if curStep == 1736 then
        setProperty('defaultCamZoom', 0.56);
    end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy);
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs);
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
                triggerEvent('Camera Follow Pos',xx2,yy2);
            end
        end
    else
        triggerEvent('Camera Follow Pos','','');
    end
    
end
