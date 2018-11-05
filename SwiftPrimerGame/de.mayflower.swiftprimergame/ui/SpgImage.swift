import Foundation
import UIKit

/**
 *  The image system that references all images to load.
 */
class SpgImage
{
    /** The image for the player. */
    static var PLAYER        :SpgImage = SpgImage( id: "truck"        )
    /** The image for the road straight. */
    static var ROAD_STRAIGHT :SpgImage = SpgImage( id: "roadStraight" )
    /** The image for the road left. */
    static var ROAD_LEFT     :SpgImage = SpgImage( id: "roadLeft"     )
    /** The image for the road right. */
    static var ROAD_RIGHT    :SpgImage = SpgImage( id: "roadRight"    )
    /** The image for the bridge. */
    static var BRIDGE        :SpgImage = SpgImage( id: "bridge"       )
    /** The image for the finish line. */
    static var FINISH_LINE   :SpgImage = SpgImage( id: "finishLine"   )

    /** The internal asset ID of this image. */
    private var id    :String
    /** The native UIImage instance. */
    private var image :UIImage

    /**
     *  Creates a new image identifier.
     *
     *  @param id The internal asset ID of this image.
     */
    private init( id aId:String )
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
