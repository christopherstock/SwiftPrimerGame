import QuartzCore

/**
 *  Represents a rectangle in 2D space.
 */
class SpgRect
{
    /** The rectangle location X. */
    public var x      :Int = 0
    /** The rectangle location Y. */
    public var y      :Int = 0
    /** The rectangle width. */
    public var width  :Int = 0
    /** The rectangle height. */
    public var height :Int = 0

    /**
     *  Creates a new rectangle in 2D space.
     *
     *  @param x      The rectangle location x.
     *  @param y      The rectangle location y.
     *  @param width  The rectangle width.
     *  @param height The rectangle height.
     */
    public init( x: Int, y: Int, width: Int, height: Int )
    {
        self.x      = x
        self.y      = y
        self.width  = width
        self.height = height
    }
}
