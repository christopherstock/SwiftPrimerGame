import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the player that can be controlled by the user.
 */
class SpgPlayer
{
    /** The rect that represents this player's bounds. */
    public var rect :SpgRect! = nil

    /**
     *  Inits this player.
     *
     *  @param startX Start position X.
     *  @param startY Start position Y.
     */
    public init( startX:Int, startY:Int )
    {
        self.rect = SpgRect(
            x:      startX,
            y:      startY,
            width:  50,
            height: 75
        )
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    public func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      ( self.rect!.x - camera.scrollX ),
            y:      ( self.rect!.y - camera.scrollY ),
            width:  self.rect!.width,
            height: self.rect!.height,
            col:    UIColor.red
        )
    }

    /**
     *  Moves the player left one tick.
     */
    public func moveLeft() -> Void
    {
        self.rect.x -= SpgSetting.PLAYER_SPEED_X
        if ( self.rect.x < 0 )
        {
            self.rect.x = 0
        }
    }

    /**
     *  Moves the player right one tick.
     *
     *  @param level The level the player is situated in.
     */
    public func moveRight( level:SpgLevel ) -> Void
    {
        let rightBound :Int = level.width - self.rect.width

        self.rect.x += SpgSetting.PLAYER_SPEED_X
        if ( self.rect.x > rightBound )
        {
            self.rect.x = rightBound
        }
    }

    /**
     *  Moves the player forward in the level.
     */
    public func moveForward() -> Void
    {
        self.rect.y += SpgSetting.PLAYER_SPEED_Y
    }
}
