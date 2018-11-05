import UIKit
import Foundation

/**
 *  The camera calculates the scroll offsets X and Y.
 */
class SpgCamera
{
    /** The current scroll offset X. */
    public  var scrollX :Int
    /** The current scroll offset Y. */
    public  var scrollY :Int

    /** The level instance. */
    private var level   :SpgLevel
    /** The player instance. */
    private var player  :SpgPlayer

    /** Minimum scroll bound X */
    private var minX    :Int
    /** Maximum scroll bound X */
    private var maxX    :Int
    /** Minimum scroll bound Y */
    private var minY    :Int
    /** Maximum scroll bound Y */
    private var maxY    :Int

    /**
     *  Creates a new camera instance.
     *
     *  @param level  The level  instance.
     *  @param player The player instance.
     */
    public init( level:SpgLevel, player:SpgPlayer )
    {
        self.scrollX = 0
        self.scrollY = 0

        self.level  = level
        self.player = player

        self.minX   = 0
        self.maxX   = ( self.level.width - SpgViewController.engine.VIEW_WIDTH   )
        self.minY   = 0
        self.maxY   = ( self.level.height - SpgViewController.engine.VIEW_HEIGHT )
    }

    /**
     *  Updates the current scroll offsets.
     */
    public func update() -> Void
    {
        self.updateOffsetX()
        self.updateOffsetY()
    }

    /**
     *  Updates the current scroll offset X.
     */
    private func updateOffsetX() -> Void
    {
        self.scrollX = (
            self.player.rect.x - ( ( SpgViewController.engine.VIEW_WIDTH - self.player.rect.width ) / 2 )
        )
        if ( self.scrollX < self.minX )
        {
            self.scrollX = self.minX
        }
        else if ( self.scrollX > self.maxX )
        {
            self.scrollX = self.maxX
        }
    }

    /**
     *  Updates the current scroll offset Y.
     */
    private func updateOffsetY() -> Void
    {
        self.scrollY = ( self.player.rect.y - SpgSetting.PLAYER_OFFSET_TOP )
        if ( self.scrollY < self.minY )
        {
            self.scrollY = self.minY
        }
        else if ( self.scrollY > self.maxY )
        {
            self.scrollY = self.maxY
        }
    }
}
