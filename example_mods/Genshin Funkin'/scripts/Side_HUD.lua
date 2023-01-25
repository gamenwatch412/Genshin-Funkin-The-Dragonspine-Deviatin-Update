--script by cmallrt on Github, altered by Gamenwatch412

local mCombo = 0

function onCreate()
	makeLuaText('highcombo', 'Highest Combo: 0', -1, 30, 289);  
	setObjectCamera('highcombo', 'hud');
	setTextSize('highcombo', 20);
	addLuaText('highcombo');
	setTextFont('highcombo', 'vcr.ttf')
	setTextAlignment('highcombo', 'left')
	
	makeLuaText('combo', 'Combo: 0', -1, getProperty('highcombo.x'), getProperty('highcombo.y') + getProperty('highcombo.height'));  
	setObjectCamera('combo', 'hud');
	setTextSize('combo', 20);
	addLuaText('combo');
	setTextFont('combo', 'vcr.ttf')
	setTextAlignment('combo', 'left')
	
	makeLuaText('sick', 'Sicks: 0', -1, getProperty('highcombo.x'), getProperty('combo.y') + getProperty('highcombo.height'));  
	setObjectCamera('sick', 'hud');
	setTextSize('sick', 20);
	setTextColor('sick', '00FFFF');
	addLuaText('sick');
	setTextFont('sick', 'vcr.ttf')
	setTextAlignment('sick', 'left')

	makeLuaText('good', 'Goods: 0', -1, getProperty('highcombo.x'), getProperty('sick.y') + getProperty('sick.height'));    
	setObjectCamera('good', 'hud');
	setTextSize('good', 20);
	addLuaText('good');
	setTextFont('good', 'vcr.ttf')
	setTextAlignment('good', 'left')

	makeLuaText('bad', 'Bads: 0', -1, getProperty('highcombo.x'), getProperty('good.y') + getProperty('good.height'));    
	setObjectCamera('bad', 'hud');
	setTextSize('bad', 20);
	addLuaText('bad');
	setTextFont('bad', 'vcr.ttf')
	setTextAlignment('bad', 'left')

	makeLuaText('shit', 'Shits: 0', -1, getProperty('highcombo.x'), getProperty('bad.y') + getProperty('bad.height'));    
	setObjectCamera('shit', 'hud');
	setTextSize('shit', 20);
	setTextColor('shit', '808080');
	addLuaText('shit');
	setTextFont('shit', 'vcr.ttf')
	setTextAlignment('shit', 'left')
	
	makeLuaText('miss', 'Misses: 0', -1, getProperty('highcombo.x'), getProperty('shit.y') + getProperty('shit.height'));    
	setObjectCamera('miss', 'hud');
	setTextSize('miss', 20);
	setTextColor('miss', 'ff0000');
	addLuaText('miss');
	setTextFont('miss', 'vcr.ttf')
	setTextAlignment('miss', 'left')
end

function onUpdate(elapsed)
	local highcombo = getProperty('mcombo')
	local combo = getProperty('combo')
	local sicks = getProperty('sicks')
	local goods = getProperty('goods')
	local bads = getProperty('bads')
	local shits = getProperty('shits')
	local misses = getProperty('songMisses')
	
	if combo > mCombo then
		mCombo = combo
	end
	
	setTextString('highcombo', 'Highest Combo: '.. mCombo)
	setTextString('combo', 'Combo: '.. combo)
	setTextString('sick', 'Sicks: '.. sicks)
	setTextString('good', 'Goods: '.. goods)
	setTextString('bad', 'Bads: '.. bads)
	setTextString('shit', 'Shits: '.. shits)
	setTextString('miss', 'Misses: '.. misses)
end