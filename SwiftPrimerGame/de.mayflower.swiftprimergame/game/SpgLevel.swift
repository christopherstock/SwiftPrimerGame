import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the level that surrounds the player .
 */
class SpgLevel
{
    /** The width of the accessable area. */
    public var width  :Int = 0

    /** The height of the accessable area. */
    public var height :Int = 0

    /**
     *  Creates a new level instance.
     *
     *  @param width  Desired level width.
     *  @param height Desired level height.
     */
    public init( width:Int, height:Int )
    {
        self.width  = width
        self.height = height
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx The drawing context to draw onto.
     */
    public func draw( ctx:CGContext ) -> Void
    {
        let SEGMENT_WIDTH  :Int = 100
        let SEGMENT_HEIGHT :Int = 100

        var drawX          :Int  = 0
        var drawY          :Int  = 0

        var toggleColor    :Bool = false

        while ( drawY < self.height )
        {
            drawX = 0
            while ( drawX < self.width )
            {
                SpgDrawing.fillRect(
                    ctx:    ctx,
                    x:      drawX,
                    y:      drawY,
                    width:  SEGMENT_WIDTH,
                    height: SEGMENT_HEIGHT,
                    col:    ( toggleColor ? UIColor.green : UIColor.cyan )
                )
                drawX += SEGMENT_WIDTH

                toggleColor = !toggleColor
            }

            toggleColor = !toggleColor

            drawY += SEGMENT_HEIGHT
        }
    }
}
