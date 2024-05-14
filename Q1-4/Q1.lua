-- My solution to Q1 of the test. The code has been indented to be more readable.

-- This table stores which players have been queued up for logging out.
-- Using a table here means searching would be more efficient.
local playerLogoutQueueTable = {}

local function releaseStorage(player)
  player:setStorageValue(1000, -1)

  -- Remove this player from the logout queue.
  table.remove(playerLogoutQueueTable, player)
end

function onLogout(player)
  -- Since releaseStorage is called at a delay, it makes sense to keep track of which players
  -- have already been marked for logging out.

  -- Two checks are being performed here
    -- First check if the player has already been marked for logging out. Only proceed if the player hasn't been marked for logout yet.
    -- Then if the player's storage value is not -1, then proceeed. If the player's storage value is already -1 then they can be skipped.
  if not playerLogoutQueueTable[player] and player:getStorageValue(1000) ~= -1 then
    -- Add the player to the logout queue so releaseStorage is not called for them multiple times.
    table.insert(playerLogoutQueueTable, player, true)

    addEvent(releaseStorage, 1000, player)
  end
  
  return true
end