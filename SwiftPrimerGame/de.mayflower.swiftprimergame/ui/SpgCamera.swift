import UIKit
import Foundation

/**
 *  The camera calculates the scroll offsets X and Y.
 */
class SpgCamera
{
    /** The current scroll offset X. */
    public var scrollX :Int = 0
    /** The current scroll offset Y. */
    public var scrollY :Int = 0

    /**
     *  Creates a new camera instance.
     */
    public init(  )
    {

    }

    /**
     *  Updates the current scroll offsets.
     *
     *  @param level  The level.
     *  @param player The player.
     */
    public func update( level:SpgLevel, player:SpgPlayer ) -> Void
    {
        self.updateOffsetX( level: level, player: player )
        self.updateOffsetY( level: level, player: player )
    }

    /**
     *  Updates the current scroll offset X.
     *
     *  @param level  The level.
     *  @param player The player.
     */
    private func updateOffsetX( level:SpgLevel, player:SpgPlayer ) -> Void
    {
        let SCROLL_X_MIN :Int = 0
        let SCROLL_X_MAX :Int = ( level.width - SpgViewController.engine.VIEW_WIDTH )

        self.scrollX = Int( player.rect.origin.x ) - ( ( SpgViewController.engine.VIEW_WIDTH - Int( player.rect.size.width ) ) / 2 )
        if ( self.scrollX < SCROLL_X_MIN )
        {
            self.scrollX = SCROLL_X_MIN
        }
        else if ( self.scrollX > SCROLL_X_MAX )
        {
            self.scrollX = SCROLL_X_MAX
        }
    }

    /**
     *  Updates the current scroll offset Y.
     *
     *  @param level  The level.
     *  @param player The player.
     */
    private func updateOffsetY( level:SpgLevel, player:SpgPlayer ) -> Void
    {
        let SCROLL_Y_MIN :Int = 0
        let SCROLL_Y_MAX :Int = ( level.height - SpgViewController.engine.VIEW_HEIGHT )

        self.scrollY = Int( player.rect.origin.y )
        if ( self.scrollY < SCROLL_Y_MIN )
        {
            self.scrollY = SCROLL_Y_MIN
        }
        else if ( self.scrollY > SCROLL_Y_MAX )
        {
            self.scrollY = SCROLL_Y_MAX
        }
    }
}
