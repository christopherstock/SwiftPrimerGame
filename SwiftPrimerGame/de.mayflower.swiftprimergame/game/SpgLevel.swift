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
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      0,
            y:      0,
            width:  self.width,
            height: self.height,
            col:    UIColor.green
        )
    }
}
