import CoreGraphics
import UIKit

/**
 *  Represents a game object.
 */
class SpgGameObject
{
    /** The image that represents this game object. */
    var image :SpgImage
    /** The rect that represents this game object's collision bounds. */
    var rect  :SpgRect

    /**
     *  Inits this game object.
     *
     *  @param image  The image to represent this game object.
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
     *  Returns the bounding rectangle.
     *
     *  @return The rect that represents the bounds of this game object.
     */
    func getRect() -> SpgRect
    {
        return rect
    }

    /**
     *  Draws this game object onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        // get current obstacle draw location
        let drawX :Int = ( rect.x - camera.scrollX )
        let drawY :Int = ( rect.y - camera.scrollY )

        // draw debug rect
        if ( SpgSetting.DEBUG_DRAW_GAME_OBJECT_RECTS )
        {
            SpgDrawing.drawRect(
                ctx:    ctx,
                x:      drawX,
                y:      drawY,
                width:  rect.width,
                height: rect.height,
                col:    UIColor.red
            )
        }

        // draw image
        SpgDrawing.drawImage( ctx: ctx, img: image.getImage(), x: drawX, y: drawY )
    }
}
