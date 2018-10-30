import Foundation
import UIKit

/**
 *  The image system that references all images to load.
 */
class SpgImage
{
    /** The image for the player. */
    public static var PLAYER :SpgImage = SpgImage( "example" )

    /** The internal asset ID of this image. */
    private       var id     :String!  = nil

    /**
     *  Creates a new image identifier.
     *
     *  @param id The internal asset ID of this image.
     */
    private init( _ id:String )
    {
        self.id = id
    }

    /**
     *  Returns the internal asset ID of this image.
     *
     *  @return The internal asset ID.
     */
    public func getId() -> String
    {
        return self.id
    }
}
