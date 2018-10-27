import Foundation
import CoreGraphics

/**
 *  Manages the touch input.
 */
class SpgTouch
{
    private var swipedLeft  :Bool = false
    private var swipedRight :Bool = false

    /**
     *  Being invoked when the touch is down.
     *
     *  @param point The point where the touch went down.
     */
    public func onTouchDown( point:CGPoint ) -> Void
    {
        print( "onTouchDown [" + point.debugDescription + "]" )

        
    }

    /**
     *  Being invoked when the touch is up.
     *
     *  @param point The point where the touch went up.
     */
    public func onTouchUp( point:CGPoint ) -> Void
    {
        print( "onTouchUp [" + point.debugDescription + "]" )


    }

    /**
     *  Being invoked when the touch is moved.
     *
     *  @param point The point where the touch moved to.
     */
    public func onTouchMove( point:CGPoint ) -> Void
    {
        print( "onTouchMove [" + point.debugDescription + "]" )


    }
}
