
local xx = 520;
local yy = 530;
local xx2 = 820;
local yy2 = 530;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('23c18a'));
	makeAnimatedLuaSprite('crowd', 'teyvat/sumeru/FrontCrowd', -600, 400);
	makeAnimatedLuaSprite('tree', 'teyvat/sumeru/background tree', 1000, 0);
	if not lowQuality then
		makeAnimatedLuaSprite('confetti','teyvat/sumeru/confetti', -500, -200);
		setLuaSpriteScrollFactor('confetti', 0.8, 0.9);
		scaleObject('confetti', 1.9, 1.9);
	end
	addLuaSprite('crowd', true);
	scaleObject('crowd', 0.8, 0.8);
	setLuaSpriteScrollFactor('crowd', 0.7, 0.8);
	addLuaSprite('tree', false);
	scaleObject('tree', 0.7, 0.7);
	addLuaSprite('confetti', true);
	addAnimationByPrefix('confetti', 'confetti fall', 'confetti fall', 24, true);
	addAnimationByPrefix('crowd', 'crowd_bump', 'FrontCrowd_Cheer', 24, false);
	addAnimationByPrefix('tree', 'tree_bump', 'arama :(', 24, false);
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
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('crowd', 'crowd_bump', true);
	objectPlayAnimation('tree', 'tree_bump', true);
end
	if curBeat == 636 then
	cameraFlash("hud", 'FFFFFF', 1,false);
end
end