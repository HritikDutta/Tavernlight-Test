-- My solution to Q2 of the test. The code has been indented to be more readable.

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local result = db.storeQuery(string.format(selectGuildQuery, memberCount))

    -- The result might not be valid or their might not be any guilds with the required member count
    -- So it makes sense to check if the result was valid or not before proceeding.
    if not result then
        print(string.format("Error: No guilds with member count lower than %d", memberCount))
        return
    end

    -- Assuming that the results are probably in an array or linked list so we should be able to
    -- loop over all of them and print the names.
    for _, row in result do
        print(row.name);
    end
end