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

    /** The subject this camera shall focus. */
    private var subject    :SpgRect
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
     *  @param subject     The subject this camera system shall focus.
     *  @param levelWidth  The width  of the level.
     *  @param levelHeight The height of the level.
     *  @param viewWidth   The width  of the view.
     *  @param viewHeight  The height of the view.
     */
    public init(
        subject    aSubject    :SpgRect,
        levelWidth             :Int,
        levelHeight            :Int,
        viewWidth  aViewWidth  :Int,
        viewHeight aViewHeight :Int
    ) {
        subject    = aSubject
        viewWidth  = aViewWidth
        viewHeight = aViewHeight
        minX       = 0
        maxX       = ( levelWidth  - viewWidth  )
        minY       = 0
        maxY       = ( levelHeight - viewHeight )

        scrollX    = 0
        scrollY    = 0
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
        scrollX = ( subject.x - ( ( viewWidth - subject.width ) / 2 ) )
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
        scrollY = ( subject.y - SpgSetting.PLAYER_OFFSET_TOP )
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
