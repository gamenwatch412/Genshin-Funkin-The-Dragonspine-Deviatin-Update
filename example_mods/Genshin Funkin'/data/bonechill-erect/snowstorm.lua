-- credits to Divi T on Gamebanana for the code, and Retrospecter for the snowstorm assets from his mod.

sprite = 'teyvat/dragonspine/snowstorm/storm2'
size = 3408
startX = -1000
startY = -500
duration = 2

function onCreate()
    if not lowQuality then
makeLuaSprite(sprite .. '1', sprite, startX, startY)
addLuaSprite(sprite .. '1', true)
makeLuaSprite(sprite .. '2', sprite, startX + size, startY)
addLuaSprite(sprite .. '2', true)

makeLuaSprite(sprite .. '1speed', sprite, startX, startY)
addLuaSprite(sprite .. '1speed', false)
makeLuaSprite(sprite .. '2speed', sprite, startX + size, startY)
addLuaSprite(sprite .. '2speed', false)
    end
scaleObject(sprite .. '1', 1, 2)
scaleObject(sprite .. '2', 1, 2)

precacheImage(sprite)

setProperty('teyvat/dragonspine/snowstorm/storm21.alpha', 0)
setProperty('teyvat/dragonspine/snowstorm/storm22.alpha', 0)

setObjectOrder('gfGroup',1)
setObjectOrder('dadGroup',2)
setObjectOrder('boyfriendGroup',3)
setObjectOrder('albedoDEAD',4)
setObjectOrder(sprite .. '1', 7)
setObjectOrder(sprite .. '2', 8)

setProperty('teyvat/dragonspine/snowstorm/storm21speed.alpha', 0)
setProperty('teyvat/dragonspine/snowstorm/storm22speed.alpha', 0)
scrollA()
scrollA2()
end

function scrollA()
doTweenX(sprite .. '1move',sprite .. '1', startX - size, duration)
doTweenX(sprite .. '2move',sprite .. '2', startX, duration)
end

function scrollA2()
doTweenX(sprite .. '1moveSpeed',sprite .. '1speed', startX - size, 2)
doTweenX(sprite .. '2moveSpeed',sprite .. '2speed', startX, 2)
end

function onTweenCompleted(tag)
if tag == (sprite .. '2move') then
scrollB()
end
if tag == (sprite .. '2move2') then
scrollA()
end

if tag == (sprite .. '2moveSpeed') then
scrollB2()
end
if tag == (sprite .. '2move2Speed') then
scrollA2()
end

end

function scrollB()
doTweenX(sprite .. '1move2',sprite .. '1', startX, 0.001)
doTweenX(sprite .. '2move2',sprite .. '2', startX + size, 0.001)
end

function scrollB2()
doTweenX(sprite .. '1move2Speed',sprite .. '1speed', startX, 0.001)
doTweenX(sprite .. '2move2Speed',sprite .. '2speed', startX + size, 0.001)
end

function onStepHit()
	if curStep == 1136 then
        setProperty('teyvat/dragonspine/snowstorm/storm21.alpha', 1)
        setProperty('teyvat/dragonspine/snowstorm/storm22.alpha', 1)
   end
	if curStep == 1151 then
      doTweenAlpha('blacktransition_out', 'BlackSquare', 0, 0.001, 'linear');
   end
	
end