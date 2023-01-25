freezeval=0;
percent=0;
shaking=false;

function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'bfChristmas-finalPhase');

if difficulty ~= 0 then
makeLuaSprite('sheercold', 'SheerColdBar', 640-(281/2), 142);
makeLuaSprite('freezewarning', 'freezewarning', 465, 116);
makeLuaSprite('totallyrealbar', nil, 503, 226);
makeGraphic('totallyrealbar', freezeval, 10, 'dafafc');
scaleObject('freezewarning', 1.1, 1.3);
addLuaSprite('freezewarning');
addLuaSprite('totallyrealbar', true);
setBlendMode('freezewarning', darken);
setObjectCamera('freezewarning', 'hud');
setObjectCamera('sheercold', 'hud');
setObjectCamera('totallyrealbar', 'hud');
addLuaSprite('sheercold');


makeLuaSprite('blackgradient', 'BlackGradient', -200, -250);
setObjectCamera('blackgradient', 'other');
setScrollFactor('blackgradient', 0, 0);
scaleObject('blackgradient', 1.4, 1.4)
setProperty('blackgradient.visible', false);
addLuaSprite('blackgradient', true);

makeLuaSprite('gradient', 'bluegradient', -70, -50);
setObjectCamera('gradient', 'other');
setScrollFactor('gradient', 0, 0);
scaleObject('gradient', 1.15, 1.15);
setProperty('gradient.angle', 180);
addLuaSprite('gradient', true);

if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
setProperty('gradient.angle', 360);
end


if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
   setProperty('sheercold.y', 470);
   setProperty('freezewarning.y', 444);
   setProperty('totallyrealbar.y', 554);
   end
end
end



function onBeatHit(id, direction, noteType, isSustainNote)
   if curBeat % 2 == 0 and difficulty ~= 0 then 
      percent = percent + 5;
      freezeval = percent * 2.61;
   end
   if curBeat >= 675 and difficulty ~= 0 then
      percent = 5;
      freezeval = 2.61;
      removeLuaSprite('gradient', true);
      cameraShake('camera', 0, 999);
      cameraShake('camHUD', 0, 999);
      removeLuaSprite('freezewarning', true);
   end

if percent > 100 and difficulty ~= 0 then
    percent = 100;
    local minushealth=0.0475;
    local health=getProperty('health');
    local minusfreezeval=0;
    if getProperty('health') > 0.2 then
    setProperty('health', health- 0.03);
elseif percent < 0 and difficulty ~= 0 then
    percent = 0;
   end
end

makeGraphic('totallyrealbar', freezeval, 10, 'dafafc');
setProperty('health', health - minushealth - minusfreezeval)
end

-- Note miss/hit
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Seelie Note' and difficulty ~= 0 then
         percent = percent - 5;
         freezeval = percent * 2.5;
    elseif noteType == 'Sheer Cold Note' and difficulty ~= 0 then
         percent = percent + 5;
         freezeval = percent * 2.5;
end

makeGraphic('totallyrealbar', freezeval, 10, 'dafafc');
setProperty('health', health - minushealth - minusfreezeval)
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