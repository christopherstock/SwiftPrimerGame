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
    public init( level aLevel:SpgLevel, player aPlayer:SpgPlayer )
    {
        scrollX = 0
        scrollY = 0

        level  = aLevel
        player = aPlayer

        minX   = 0
        maxX   = ( level.width - SpgViewController.engine.VIEW_WIDTH   )
        minY   = 0
        maxY   = ( level.height - SpgViewController.engine.VIEW_HEIGHT )
    }

    /**
     *  Updates the current scroll offsets.
     */
    public func update() -> Void
    {
        updateOffsetX()
        updateOffsetY()
    }

    /**
     *  Updates the current scroll offset X.
     */
    private func updateOffsetX() -> Void
    {
        scrollX = (
            player.rect.x - ( ( SpgViewController.engine.VIEW_WIDTH - player.rect.width ) / 2 )
        )
        if ( scrollX < minX )
        {
            scrollX = minX
        }
        else if ( scrollX > maxX )
        {
            scrollX = maxX
        }
    }

    /**
     *  Updates the current scroll offset Y.
     */
    private func updateOffsetY() -> Void
    {
        scrollY = ( player.rect.y - SpgSetting.PLAYER_OFFSET_TOP )
        if ( scrollY < minY )
        {
            scrollY = minY
        }
        else if ( scrollY > maxY )
        {
            scrollY = maxY
        }
    }
}
