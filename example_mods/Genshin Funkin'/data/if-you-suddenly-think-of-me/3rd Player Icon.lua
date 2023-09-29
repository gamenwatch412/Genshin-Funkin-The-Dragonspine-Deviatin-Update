iconPath = 'icons/icon-zhongli' -- Picture grid file name of icon.
iconName = 'charIcon' -- Sets icon name. Make sure to name it something you can remember!

isPlayer = true -- If false, it will flip X and go on opponent's side.
winningIcons = false -- If true, it will use an winning icon. (Your icon grid image file must have 3 icons!)

customizePos = false -- If true, you will be able to freely change the icon position.

doIconBop = true -- If false, stops icon bop. (Also stops it from returning to normal!)
bopMultiplier = 1.2 -- Sets how big the bop should be when on beat.
bopSpeed = 9 -- The higher the value, the faster the bop ends.

iconScale = {
    1, -- Scale X
    1 -- Scale Y
}

iconPos = {
    50, -- Offset X
    -15 -- Offset Y
}

local iconOffsets = {0, 0}
function onCreatePost()
    luaDebugMode = true

    makeLuaSprite('icon-' .. iconName, iconPath, 0, getProperty('healthBar.y') - 75 + iconPos[2])
    if not winningIcons then
        loadGraphic('icon-' .. iconName, iconPath, math.floor(getProperty('icon-' .. iconName .. '.width') / 2), math.floor(getProperty('icon-' .. iconName .. '.height')))
        iconOffsets[1] = (getProperty('icon-' .. iconName .. '.width') - 150) / 2 -- unnecessary.
        iconOffsets[2] = (getProperty('icon-' .. iconName .. '.width') - 150) / 2 -- unnecessary.
        addAnimation('icon-' .. iconName, iconName, {0, 1}, 0, false)
    else
        loadGraphic('icon-' .. iconName, iconPath, math.floor(getProperty('icon-' .. iconName .. '.width') / 3), math.floor(getProperty('icon-' .. iconName .. '.height')))
        iconOffsets[1] = (getProperty('icon-' .. iconName .. '.width') - 150) / 3 -- unnecessary.
        iconOffsets[2] = (getProperty('icon-' .. iconName .. '.width') - 150) / 3 -- unnecessary.
        addAnimation('icon-' .. iconName, iconName, {0, 1, 2}, 0, false)
    end
    scaleObject('icon-' .. iconName, iconScale[1], iconScale[2])
    updateHitbox('icon-' .. iconName)
    setObjectCamera('icon-' .. iconName, 'hud')
    setProperty('icon-' .. iconName .. '.flipX', isPlayer)
    playAnim('icon-' .. iconName, iconName, false)

    setProperty('icon-' .. iconName .. '.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
    if stringEndsWith(iconName, '-pixel') then
        setProperty('icon-' .. iconName .. '.antialiasing', false)
    end

    addLuaSprite('icon-' .. iconName, true)
end

function updateOffset(obj)
    setProperty(obj .. '.offset.x', iconOffsets[1])
    setProperty(obj .. '.offset.y', iconOffsets[2])
end

function onBeatHit()
    if doIconBop then
        scaleObject('icon-' .. iconName, bopMultiplier * iconScale[1], bopMultiplier * iconScale[2]) -- could this cause issues?
        updateHitbox('icon-' .. iconName)
        updateOffset('icon-' .. iconName)
    end
end

function onUpdatePost(elapsed)
    --what the fuck
    if isPlayer then
        if not winningIcons then
            iconOffsets[1] = -(getProperty('icon-' .. iconName .. '.width') - 150) / 2
        else
            iconOffsets[1] = -(getProperty('icon-' .. iconName .. '.width') - 150) / 3
        end
    else
        if not winningIcons then
            iconOffsets[1] = (getProperty('icon-' .. iconName .. '.width') - 150) / 2
        else
            iconOffsets[1] = (getProperty('icon-' .. iconName .. '.width') - 150) / 3
        end
    end
    iconOffsets[2] = 0 -- what???

    local iconMultiplier = lerp(iconScale[1], getProperty('icon-' .. iconName .. '.scale.x'), clamp(1 - (elapsed * bopSpeed * playbackRate), 0, 1))
    if doIconBop then
        scaleObject('icon-' .. iconName, iconMultiplier, iconMultiplier)
        updateHitbox('icon-' .. iconName)
        updateOffset('icon-' .. iconName)
    end

    if not customizePos then
        if isPlayer then
            setProperty('icon-' .. iconName .. '.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01) - (150 + getProperty('icon-' .. iconName .. '.scale.x') - 150) / 2 - 26 + iconPos[1]))
        else
            setProperty('icon-' .. iconName .. '.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01) - (150 - getProperty('icon-' .. iconName .. '.scale.x')) / 2 - 26 * 2 + iconPos[1]))
        end
    end

    --REDO CHECK?
    if getProperty('healthBar.percent') < 20 and isPlayer then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 1)
    elseif getProperty('healthBar.percent') > 20 and isPlayer then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 0)
    end

    if getProperty('healthBar.percent') < 20 and not isPlayer and winningIcons then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 2)
    elseif getProperty('healthBar.percent') > 20 and not isPlayer and winningIcons then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 0)
    end

    if getProperty('healthBar.percent') > 80 and not isPlayer then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 1)
    elseif getProperty('healthBar.percent') < 80 and not isPlayer then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 0)
    end

    if getProperty('healthBar.percent') > 80 and isPlayer and winningIcons then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 2)
    elseif getProperty('healthBar.percent') < 80 and isPlayer and winningIcons then
        setProperty('icon-' .. iconName .. '.animation.curAnim.curFrame', 0)
    end
end

function clamp(x,min,max) return math.max(min,math.min(x,max)) end
function lerp(from,to,i) return from+(to-from)*i end

function remapToRange(v, begin1, stop1, begin2, stop2) return begin2 + (v - begin1) * ((stop2 - begin2) / (stop1 - begin1)) end -- i definitely did not take this!111 (you technically dont need to remap but eh?)

--[[TODO:
1: Make icon name use character name and add as option?
--]]