import UIKit
import Foundation

/**
 *  The camera calculates the scroll offsets X and Y.
 */
class SpgCamera
{
    /** The current scroll offset X. */
    public  var scrollX    :Int
    /** The current scroll offset Y. */
    public  var scrollY    :Int

    /** The level instance. */
    private var level      :SpgLevel
    /** The player instance. */
    private var player     :SpgPlayer

    /** Minimum scroll bound X */
    private var minX       :Int
    /** Maximum scroll bound X */
    private var maxX       :Int
    /** Minimum scroll bound Y */
    private var minY       :Int
    /** Maximum scroll bound Y */
    private var maxY       :Int

    /** The width of the view */
    private var viewWidth  :Int
    /** The height of the view */
    private var viewHeight :Int

    /**
     *  Creates a new camera instance.
     *
     *  @param level      The level  instance.
     *  @param player     The player instance.
     *  @param viewWidth  The width  of the view.
     *  @param viewHeight The height of the view.
     */
    public init( level aLevel:SpgLevel, player aPlayer:SpgPlayer, viewWidth aViewWidth :Int, viewHeight aViewHeight :Int )
    {
        level      = aLevel
        player     = aPlayer

        viewWidth  = aViewWidth
        viewHeight = aViewHeight

        scrollX    = 0
        scrollY    = 0

        minX       = 0
        maxX       = ( level.width  - viewWidth  )
        minY       = 0
        maxY       = ( level.height - viewHeight )
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
        scrollX = ( player.rect.x - ( ( viewWidth - player.rect.width ) / 2 ) )
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
