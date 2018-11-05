import Foundation
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
}
