// My solution to Q4 of the test. The code has been indented to be more readable.

void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    // Assuming that getPlayerByName returns a pointer to a player that is owned by g_game.
    // This means that this function should not delete the pointer.
    Player *player = g_game.getPlayerByName(recipient);

    // This variable tracks whether the player reference was taken from the game or created in the function.
    bool playerNeedsDeleting = false;

    if (!player)
    {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            // If loading failed then delete the newly allocated player.
            delete player;
            return;
        }

        // The player reference was not taken from the game and instead it was allocated
        // to add the item to their inventory. Hence this pointer needs to be freed.
        playerNeedsDeleting = true;
    }

    Item *item = Item::CreateItem(itemId);
    if (!item)
    {
        // Item creation failed. Delete player if it was allocated in this function.
        if (playerNeedsDeleting)
        {
            delete player;
        }

        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    // I'm guessing that isOffline() tells whether the player pointer is owned by the game or this function
    // but I'm not 100% sure that the game doesn't have references to offline players for some reason.
    // Hence, I used a boolean to keep track of it. But the same logic can be written using isOffline() as well.
    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }

    // Assuming the destructor for Item cleans up any additional allocations and
    // there is no seperate function for freeing the item.
    delete item;

    // Delete the player allocation if it was allocated in this function block.
    // This ensures that the player is not deleted if the player address is owned by g_game.
    if (playerNeedsDeleting)
    {
        delete player;
    }
}