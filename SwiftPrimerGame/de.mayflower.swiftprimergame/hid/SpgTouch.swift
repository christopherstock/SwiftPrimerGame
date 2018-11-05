import Foundation
import CoreGraphics

/**
 *  The touch system that manages the touch input.
 */
class SpgTouch
{
    /** Indicates swipe left. */
    public  var swipedLeft        :Bool
    /** Indicates swipe right. */
    public  var swipedRight       :Bool

    /** Stores the last touch location point. */
    private var lastTouchLocation :CGPoint?

    /**
     *  Creates a new instance of the touch system.
     */
    public init()
    {
        swipedLeft  = false
        swipedRight = false
    }

    /**
     *  Being invoked when the touch is down.
     *
     *  @param point The point where the touch went down.
     */
    public func onTouchDown( point:CGPoint ) -> Void
    {
        lastTouchLocation = point
        swipedLeft        = false
        swipedRight       = false
    }

    /**
     *  Being invoked when the touch is up.
     *
     *  @param point The point where the touch went up.
     */
    public func onTouchUp( point:CGPoint ) -> Void
    {
        lastTouchLocation = nil
        swipedLeft        = false
        swipedRight       = false
    }

    /**
     *  Being invoked when the touch is moved.
     *
     *  @param point The point where the touch moved to.
     */
    public func onTouchMove( point:CGPoint ) -> Void
    {
        swipedLeft  = false
        swipedRight = false

        if let location = lastTouchLocation
        {
            if ( point.x < location.x )
            {
                swipedLeft = true
            }
            else if ( point.x > location.x )
            {
                swipedRight = true
            }
        }

        lastTouchLocation = point
    }
}
