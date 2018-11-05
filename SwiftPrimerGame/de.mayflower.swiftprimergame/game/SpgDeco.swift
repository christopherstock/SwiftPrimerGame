import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents a non-colliding decoration object.
 */
class SpgDeco
{
    /** The deco image. */
    private var image :SpgImage
    /** The rect that represents this deco's bounds. */
    private var rect  :SpgRect

    /**
     *  Inits this deco.
     *
     *  @param startX Start position X.
     *  @param startY Start position Y.
     */
    init( image img:SpgImage, startX:Int, startY:Int )
    {
        image = img
        rect  = SpgRect(
            x:      startX,
            y:      startY,
            width:  Int( image.getImage().size.width  ),
            height: Int( image.getImage().size.height )
        )
    }

    /**
     *  Returns the game object rectangle.
     *
     *  @return The rect that represents the bounds of this game object.
     */
    func getRect() -> SpgRect
    {
        return rect
    }

    /**
     *  Draws the deco onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        // get current deco draw location
        let drawX :Int = ( rect.x - camera.scrollX )
        let drawY :Int = ( rect.y - camera.scrollY )

        // draw debug rect
        if ( SpgSetting.DEBUG_DRAW_GAME_OBJECT_RECTS )
        {
            SpgDrawing.fillRect(
                ctx:    ctx,
                x:      drawX,
                y:      drawY,
                width:  rect.width,
                height: rect.height,
                col:    UIColor.red
            )
        }

        // draw deco image
        SpgDrawing.drawImage( ctx: ctx, img: image.getImage(), x: drawX, y: drawY )
    }
}
