import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the player that can be controlled by the user.
 */
class SpgPlayer
{
    /** The player image. */
    private var image :SpgImage
    /** The rect that represents this player's bounds. */
    private var rect  :SpgRect

    /**
     *  Inits this player.
     *
     *  @param startX Start position X.
     *  @param startY Start position Y.
     */
    public init( startX:Int, startY:Int )
    {
        image = SpgImage.PLAYER
        rect  = SpgRect(
            x:      startX,
            y:      startY,
            width:  Int( image.getImage().size.width  ),
            height: Int( image.getImage().size.height )
        )
    }

    /**
     *  Returns the game object rectangle.
     *
     *  @return The rect that represents the bounds of this game object.
     */
    public func getRect() -> SpgRect
    {
        return rect
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    public func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        // get current player draw location
        let drawX :Int = ( rect.x - camera.scrollX )
        let drawY :Int = ( rect.y - camera.scrollY )

        // draw debug rect
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      drawX,
            y:      drawY,
            width:  rect.width,
            height: rect.height,
            col:    UIColor.red
        )

        // draw player image
        SpgDrawing.drawImage( ctx: ctx, img: image.getImage(), x: drawX, y: drawY )
    }

    /**
     *  Moves the player left one tick.
     */
    public func moveLeft() -> Void
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
    public func moveRight( level:SpgLevel ) -> Void
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
    public func moveForward() -> Void
    {
        rect.y += SpgSetting.PLAYER_SPEED_Y
    }
}
