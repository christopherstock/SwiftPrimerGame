/**
 *  Represents the player that can be controlled by the user.
 */
class SpgPlayer : SpgGameObject
{
    /**
     *  Sets the specified image as the new player image.
     *
     *  @param newImage The new player image to set.
     */
    func setImage( newImage:SpgImage ) -> Void
    {
        image = newImage
    }

    /**
     *  Moves the player left one tick.
     */
    func moveLeft() -> Void
    {
        rect.x -= SpgSetting.PLAYER_SPEED_X
        if ( rect.x < 0 )
        {
            rect.x = 0
        }
    }

    /**
     *  Moves the player right one tick.
     *
     *  @param level The level the player is situated in.
     */
    func moveRight( level:SpgLevel ) -> Void
    {
        let rightBound :Int = level.width - rect.width

        rect.x += SpgSetting.PLAYER_SPEED_X
        if ( rect.x > rightBound )
        {
            rect.x = rightBound
        }
    }

    /**
     *  Moves the player forward in the level.
     */
    func moveDown() -> Void
    {
        rect.y += SpgSetting.PLAYER_SPEED_Y
    }
}
