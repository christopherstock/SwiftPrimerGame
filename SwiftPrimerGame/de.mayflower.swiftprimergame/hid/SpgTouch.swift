import Foundation
import CoreGraphics

/**
 *  Manages the touch input.
 */
class SpgTouch
{
    /** Indicates swipe left. */
    public  var swipedLeft  :Bool = false
    /** Indicates swipe right. */
    public  var swipedRight :Bool = false

    /** Stores the last touch location point. */
    private var lastTouchLocation :CGPoint! = nil

    /**
     *  Being invoked when the touch is down.
     *
     *  @param point The point where the touch went down.
     */
    public func onTouchDown( point:CGPoint ) -> Void
    {
        //bprint( "onTouchDown [" + point.debugDescription + "]" )

        self.lastTouchLocation = point
        self.swipedLeft        = false
        self.swipedRight       = false
    }

    /**
     *  Being invoked when the touch is up.
     *
     *  @param point The point where the touch went up.
     */
    public func onTouchUp( point:CGPoint ) -> Void
    {
        // print( "onTouchUp [" + point.debugDescription + "]" )

        self.lastTouchLocation = nil
        self.swipedLeft        = false
        self.swipedRight       = false
    }

    /**
     *  Being invoked when the touch is moved.
     *
     *  @param point The point where the touch moved to.
     */
    public func onTouchMove( point:CGPoint ) -> Void
    {
        // print( "onTouchMove [" + point.debugDescription + "]" )

        self.swipedLeft  = false
        self.swipedRight = false

        if ( self.lastTouchLocation != nil )
        {
            if ( point.x < self.lastTouchLocation.x )
            {
                self.swipedLeft = true
            }
            else if ( point.x > self.lastTouchLocation.x )
            {
                self.swipedRight = true
            }
        }

        self.lastTouchLocation = point
    }
}
