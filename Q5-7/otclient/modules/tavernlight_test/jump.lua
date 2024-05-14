Jumper = {}

window = nil
button = nil
marginLeft = 0

function init()
    window = g_ui.displayUI('jump.otui')
    button = window:getChildById('jump')

    -- Connecting the update function to onRender event which was added to graphicalapplication.cpp.
    connect(g_app, { onRender = update })

    -- Start from a random height.
    jumpToNewStartPoint()
end

function terminate()
    disconnect(g_app, { onRender = update })
    window:destroy()
    window = nil
    button = nil
end

-- Update function that takes in delta time for the frame and moves the button accordingly.
function update(delta)
    local speed = 100   -- Speed for the button to move (this amount of on screen distance is moved in 1 second).
    marginLeft = marginLeft - speed * delta -- Moving the button based on delta so the speed is consistent regardless of the framerate.

    -- Check if the button has reached the left edge
        -- if no then move the button normally.
        -- otherwise, jump to a new starting point.
    if marginLeft > 0 then
        button:setMarginLeft(marginLeft)
    else
        jumpToNewStartPoint()
    end
end

-- The name is self explanatory but calling this makes the button jump to a random vertical position
-- and moves it to the right.
function jumpToNewStartPoint()
    local random_pos = math.random()

    -- The max height used for spawning the button is adjusted so the button doesn't go outside the window
    local margin_top_max = window:getHeight() - 2 * button:getHeight() - 20
    button:setMarginTop(random_pos * margin_top_max)

    -- Similar reason for adjusting the width so the button doesn't start from outside the window
    marginLeft = window:getWidth() - button:getWidth() - 30
    button:setMarginLeft(marginLeft)
end