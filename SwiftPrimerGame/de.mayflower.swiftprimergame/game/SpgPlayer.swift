import Foundation
import CoreGraphics
import UIKit

/**
 *  Represtns the player that can be controlled by the user.
 */
class SpgPlayer
{
    /** The rect that represents this player's bounds. */
    private var rect :CGRect! = nil

    /**
     *  Inits this player.
     */
    public init()
    {
        self.rect = CGRect( x: 0, y: 0, width: 50, height: 75 )
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx The drawing context to draw onto.
     */
    public func draw( ctx:CGContext ) -> Void
    {
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      Int( self.rect!.origin.x    ),
            y:      Int( self.rect!.origin.y    ),
            width:  Int( self.rect!.size.width  ),
            height: Int( self.rect!.size.height ),
            col:    UIColor.red
        )
    }

    /**
     *  Moves the player left one tick.
     */
    public func moveLeft() -> Void
    {
        self.rect.origin.x -= CGFloat( SpgSetting.PLAYER_SPEED_X )
        if ( self.rect.origin.x < 0 )
        {
            self.rect.origin.x = 0
        }
    }

    /**
     *  Moves the player right one tick.
     *
     *  @param level The level the player is situated in.
     */
    public func moveRight( level:SpgLevel ) -> Void
    {
        let rightBound :CGFloat = CGFloat( level.width ) - self.rect.origin.x

        self.rect.origin.x += CGFloat( SpgSetting.PLAYER_SPEED_X )
        if ( self.rect.origin.x > rightBound )
        {
            self.rect.origin.x = rightBound
        }
    }
}
