import UIKit
import Foundation

/**
 *  The camera calculates the scroll offsets X and Y.
 */
class SpgCamera
{
    /** The current scroll offset X. */
    public  var scrollX :Int        = 0
    /** The current scroll offset Y. */
    public  var scrollY :Int        = 0

    /** The level instance. */
    private var level   :SpgLevel!  = nil
    /** The player instance. */
    private var player  :SpgPlayer! = nil

    /** Minimum scroll bound X */
    private var minX    :Int        = 0
    /** Maximum scroll bound X */
    private var maxX    :Int        = 0
    /** Minimum scroll bound Y */
    private var minY    :Int        = 0
    /** Maximum scroll bound Y */
    private var maxY    :Int        = 0

    /**
     *  Creates a new camera instance.
     *
     *  @param level  The level  instance.
     *  @param player The player instance.
     */
    public init( level:SpgLevel, player:SpgPlayer )
    {
        self.level  = level
        self.player = player

        self.minX   = 0
        self.maxX   = ( self.level.width - SpgViewController.engine.VIEW_WIDTH )

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
        self.scrollX = Int( self.player.rect.origin.x ) - ( ( SpgViewController.engine.VIEW_WIDTH - Int( self.player.rect.size.width ) ) / 2 )
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
        self.scrollY = Int( self.player.rect.origin.y )
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
