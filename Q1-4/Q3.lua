-- My solution to Q3 of the test. The code has been indented to be more readable.

-- The function has been renamed based on the implementation.
-- It seemed to search in a player's party for a member and remove them from the party.
function removeMemberFromPlayerParty(playerId, membername)
    -- Cache the player and the member to be removed.
    local player = Player(playerId)
    local memberToRemove = Player(membername)

    local party = player:getParty()
    
    for k,v in pairs(party:getMembers()) do
        -- Remove the member from the list once found.
        if v == memberToRemove then
            party:removeMember(memberToRemove)

            -- Assuming that each member in the party has a unique name. We can break out of the loop once the member has been found
            -- However if multiple players can have the same name then this break statement can be removed.
            break
        end
    end
end