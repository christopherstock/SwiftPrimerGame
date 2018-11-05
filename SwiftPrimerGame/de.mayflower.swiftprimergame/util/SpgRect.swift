import QuartzCore

/**
 *  Represents a rectangle in 2D space.
 */
class SpgRect
{
    /** The rectangle location X. */
    var x      :Int
    /** The rectangle location Y. */
    var y      :Int
    /** The rectangle width. */
    var width  :Int
    /** The rectangle height. */
    var height :Int

    /**
     *  Creates a new rectangle in 2D space.
     *
     *  @param x      The rectangle location x.
     *  @param y      The rectangle location y.
     *  @param width  The rectangle width.
     *  @param height The rectangle height.
     */
    init( x aX: Int, y aY: Int, width aWidth: Int, height aHeight: Int )
    {
        x      = aX
        y      = aY
        width  = aWidth
        height = aHeight
    }
}
