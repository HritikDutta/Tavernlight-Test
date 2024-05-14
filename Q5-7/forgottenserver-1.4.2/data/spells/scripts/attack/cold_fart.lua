-- List of areas with delays to spawn tornados in a seemingly random pattern but withing a diamond.
local areas = {
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 1, 0, 0, 2, 0, 0, 1 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 } },
        delay = 0
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0, 1, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 1, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 1, 2, 1, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 1, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 1, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 250
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 } },
        delay = 500
    },
    {
        arr = {
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 1, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 1, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 500
    },
    {
        arr = {
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 0, 0, 0 },
            { 0, 0, 0, 2, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0 } },
        delay = 500
    },
}

-- Make a list of combat objects storing a corresponding object for each area
local combats = {}
for i = 1, #areas do
    combats[i] = Combat()

    -- Set appropriate parameters
    combats[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
    combats[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
    combats[i]:setArea(createCombatArea(areas[i].arr))

    -- The function in Eternal Winter by the same name was used as reference for this
    -- Since it is created in a loop, the formula values can change for each area
    function onGetFormulaValues(player, level, magicLevel)
        local min = (level / 5) + (magicLevel * 8) + 50
        local max = (level / 5) + (magicLevel * 12) + 75
        return -min, -max
    end

    combats[i]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
end

-- Function to cast a spell using the selected index from the combats array
local function castSpell(creatureId, variant, combatIndex)
    local creature = Creature(creatureId)

    if creature then
        combats[combatIndex]:execute(creature, variant)
    end
end

function onCastSpell(creature, variant)
    delay = 0

    -- Loop over the combat objects and trigger them at a delay (apart from the first object)
    -- This is done so the result can be returned in case the caller uses the result in any way.
    for i = 2, #combats do
        delay = delay + areas[i].delay
        addEvent(castSpell, delay, creature:getId(), variant, i)
    end

    -- First spell is cast instantly and the result is returned
    return combats[1]:execute(creature, variant)
end
