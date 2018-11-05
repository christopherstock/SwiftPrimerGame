import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the level that surrounds the player .
 */
class SpgLevel
{
    /** The width of the accessable area. */
    var width  :Int
    /** The height of the accessable area. */
    var height :Int

    /**
     *  Creates a new level instance.
     *
     *  @param width  Desired level width.
     *  @param height Desired level height.
     */
    init( width w:Int, height h:Int )
    {
        width  = w
        height = h
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        let SEGMENT_WIDTH  :Int = 100
        let SEGMENT_HEIGHT :Int = 100

        var drawX          :Int  = 0
        var drawY          :Int  = 0

        var toggleColor    :Bool = false

        while ( drawY < height )
        {
            drawX = 0
            while ( drawX < width )
            {
                SpgDrawing.fillRect(
                    ctx:    ctx,
                    x:      drawX - camera.scrollX,
                    y:      drawY - camera.scrollY,
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
