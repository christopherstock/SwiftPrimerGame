import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the player that can be controlled by the user.
 */
class SpgPlayer
{
    /** The rect that represents this player's bounds. */
    public  var rect  :SpgRect! = nil

    /** The player image. */
    private var image :UIImage! = nil

    /**
     *  Inits this player.
     *
     *  @param startX Start position X.
     *  @param startY Start position Y.
     */
    public init( startX:Int, startY:Int )
    {
        self.image = UIImage( named: SpgImage.PLAYER.getId() )

        self.rect = SpgRect(
            x:      startX,
            y:      startY,
            width:  Int( self.image.size.width  ),
            height: Int( self.image.size.height )
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
        // get player image
        let myImage :UIImage! = UIImage( named: SpgImage.PLAYER.getId() )

        // get current player draw location
        let drawX :Int = ( self.rect!.x - camera.scrollX )
        let drawY :Int = ( self.rect!.y - camera.scrollY )

        // draw debug rect
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      drawX,
            y:      drawY,
            width:  self.rect.width,
            height: self.rect.height,
            col:    UIColor.red
        )

        // draw player image
        let imagePoint :CGPoint  = CGPoint( x: drawX, y: drawY )
        myImage?.draw( at: imagePoint )
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
