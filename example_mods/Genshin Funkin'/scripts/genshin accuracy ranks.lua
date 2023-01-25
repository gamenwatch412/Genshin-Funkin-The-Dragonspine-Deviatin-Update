function onUpdate()
local ratePercent = getProperty('ratingPercent')
if ratingName == 'Perfect!!' then
    setRatingName('Canorus')
elseif ratingName == 'Sick!' then
    setRatingName('Discantus')
elseif ratingName == 'Great' then
    setRatingName('Dulcem:')
elseif ratingName == 'Good' then
    setRatingName('Euphonia')
elseif ratePercent == 0 then
    setRatingName('Unranked')
end
end