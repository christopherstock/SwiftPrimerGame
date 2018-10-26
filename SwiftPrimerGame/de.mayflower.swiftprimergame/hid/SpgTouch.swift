import Foundation

/**
 *  Manages the touch input.
 */
class SpgTouch
{
    /**
     *  Being invoked when the touch is down.
     */
    public func onTouchDown() -> Void
    {
        print( "onTouchDown" )

    }

    /**
     *  Being invoked when the touch is up.
     */
    public func onTouchUp() -> Void
    {
        print( "onTouchUp" )

    }

    /**
     *  Being invoked when the touch is moved.
     */
    public func onTouchMove() -> Void
    {
        print( "onTouchMove" )

    }
}
