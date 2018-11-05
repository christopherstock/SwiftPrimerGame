import Foundation
import UIKit

/**
 *  The image system that references all images to load.
 */
class SpgImage
{
    /** The image for the player. */
    static var PLAYER :SpgImage = SpgImage( id: "truck" )

    /** The internal asset ID of this image. */
    private var id    :String
    /** The native UIImage instance. */
    private var image :UIImage

    /**
     *  Creates a new image identifier.
     *
     *  @param id The internal asset ID of this image.
     */
    init( id aId:String )
    {
        id    = aId
        image = UIImage()

        if let newImage:UIImage = UIImage( named: id )
        {
            image = newImage
        }
    }

    /**
     *  Returns the internal UIImage instance.
     *
     *  @return The internal UIImage.
     */
    func getImage() -> UIImage
    {
        return image
    }
}
