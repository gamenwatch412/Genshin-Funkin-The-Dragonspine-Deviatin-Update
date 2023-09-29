freezeval=26.1;
percent=10;
shaking=false;
minushealth=0.0475;
minusfreezeval=0;

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bfChristmas-finalPhase');
    makeLuaSprite('sheercold', 'SheerColdBar', 640 - (281 / 2), 142)
    makeLuaSprite('freezewarning', 'freezewarning', 465, 116)
    makeLuaSprite('totallyrealbar', nil, 503, 226)
    makeGraphic('totallyrealbar', freezeval, 10, 'dafafc')
    scaleObject('freezewarning', 1.1, 1.3)
    addLuaSprite('freezewarning')
    addLuaSprite('totallyrealbar', true)
    setBlendMode('freezewarning', darken)
    setObjectCamera('freezewarning', 'hud')
    setObjectCamera('sheercold', 'hud')
    setObjectCamera('totallyrealbar', 'hud')
    addLuaSprite('sheercold')

    makeLuaSprite('blackgradient', 'BlackGradient', -200, -250)
    setObjectCamera('blackgradient', 'other')
    setScrollFactor('blackgradient', 0, 0)
    scaleObject('blackgradient', 1.4, 1.4)
    setProperty('blackgradient.visible', false)
    addLuaSprite('blackgradient', true)

    makeLuaSprite('gradient', 'bluegradient', -70, -50)
    setObjectCamera('gradient', 'other')
    setScrollFactor('gradient', 0, 0)
    scaleObject('gradient', 1.15, 1.15)
    setProperty('gradient.angle', 180)
    addLuaSprite('gradient', true)

    if getProperty('ClientPrefs.downScroll') then
      setProperty('gradient.angle', 360)
    end

    if not getProperty('ClientPrefs.downScroll') then
      setProperty('sheercold.y', 470)
      setProperty('freezewarning.y', 444)
      setProperty('totallyrealbar.y', 554)
    end
end

function onBeatHit(id, direction, noteType, isSustainNote)
    if curBeat % 2 == 0 then 
        percent = percent + 5;
        freezeval = percent * 2.61;
    end
    if percent > 100 then
        percent = 100;
        local health=getProperty('health');
        if getProperty('health') > 0.2 then
            setProperty('health', health - minushealth);
        end
    elseif percent < 0 then
        percent = 0;
   end
   makeGraphic('totallyrealbar', freezeval, 10, 'dafafc');
   setProperty('health', health - minushealth - minusfreezeval);
end

-- Note miss/hit
function goodNoteHit(id, direction, noteType, isSustainNote)
    --local health = getProperty('health');
    if noteType == 'Seelie Note' or noteType == 'Seelie Note with Anim' then
        percent = percent - 5;
        freezeval = percent * 2.5;
    elseif noteType == 'Sheer Cold Note' then
        percent = percent + 5;
        freezeval = percent * 2.5;
    end

    makeGraphic('totallyrealbar', freezeval, 10, 'dafafc');
    setProperty('health', health - minushealth - minusfreezeval);
end

function onUpdate(elapsed)
       if percent == 0 then
          setProperty('gradient.alpha', 0.0);
          setProperty('freezewarning.alpha', 0.0);
          cameraShake('camera', 0, 999);
          cameraShake('camHUD', 0, 999);
       end
       if percent == 10 then
          setProperty('gradient.alpha', 0.1);
          setProperty('freezewarning.alpha', 0.1);
         cameraShake('camera', 0.0001, 999);
         cameraShake('camHUD', 0.0001, 999);
       end
       if percent == 20 then
          setProperty('gradient.alpha', 0.2);
          setProperty('freezewarning.alpha', 0.2);
          cameraShake('camera', 0.0002, 999);
          cameraShake('camHUD', 0.0002, 999);
       end
       if percent == 30 then
          setProperty('gradient.alpha', 0.3);
          setProperty('freezewarning.alpha', 0.3);
          cameraShake('camera', 0.0003, 999);
          cameraShake('camHUD', 0.0003, 999);
       end
       if percent == 40 then
          setProperty('gradient.alpha', 0.4);
          setProperty('freezewarning.alpha', 0.4);
          cameraShake('camera', 0.0004, 999);
          cameraShake('camHUD', 0.0004, 999);
       end
       if percent == 50 then
          setProperty('gradient.alpha', 0.5);
          setProperty('freezewarning.alpha', 0.5);
          cameraShake('camera', 0.0005, 999);
          cameraShake('camHUD', 0.0005, 999);
       end
       if percent == 60 then
          setProperty('gradient.alpha', 0.6);
          setProperty('freezewarning.alpha', 0.6);
          cameraShake('camera', 0.0006, 999);
          cameraShake('camHUD', 0.0006, 999);
       end
       if percent == 70 then
          setProperty('gradient.alpha', 0.7);
          setProperty('freezewarning.alpha', 0.7);
          cameraShake('camera', 0.0007, 999);
          cameraShake('camHUD', 0.0007, 999);
       end
       if percent == 80 then
          setProperty('gradient.alpha', 0.8);
          setProperty('freezewarning.alpha', 0.8);
          cameraShake('camera', 0.0008, 999);
          cameraShake('camHUD', 0.0008, 999);
       end
       if percent == 90 then
          setProperty('gradient.alpha', 0.9);
          setProperty('freezewarning.alpha', 0.9);
          cameraShake('camera', 0.0009, 999);
          cameraShake('camHUD', 0.0009, 999);
       end
       if percent == 100 then
          setProperty('gradient.alpha', 1.0);
          setProperty('freezewarning.alpha', 1.0);
          cameraShake('camera', 0.0010, 999);
          cameraShake('camHUD', 0.0010, 999);
       end
end