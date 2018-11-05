import Foundation
import UIKit

/**
 *  The image system that references all images to load.
 */
class SpgImage
{
    /** The image for the player. */
    static var PLAYER_PRISTINE :SpgImage = SpgImage( id: "truckPristine" )
    /** The image for the crashed player. */
    static var PLAYER_CRASHED  :SpgImage = SpgImage( id: "truckCrashed"  )

    /** The image for the bg. */
    static var BG              :SpgImage = SpgImage( id: "bg"            )
    /** The image for the road straight. */
    static var ROAD_STRAIGHT   :SpgImage = SpgImage( id: "roadStraight"  )
    /** The image for the road left. */
    static var ROAD_LEFT       :SpgImage = SpgImage( id: "roadLeft"      )
    /** The image for the road right. */
    static var ROAD_RIGHT      :SpgImage = SpgImage( id: "roadRight"     )
    /** The image for the bridge. */
    static var BRIDGE          :SpgImage = SpgImage( id: "bridge"        )
    /** The image for the finish line. */
    static var FINISH_LINE     :SpgImage = SpgImage( id: "finishLine"    )

    /** The image for the 1st car. */
    static var CAR_1           :SpgImage = SpgImage( id: "car1"          )
    /** The image for the 2nd car. */
    static var CAR_2           :SpgImage = SpgImage( id: "car2"          )
    /** The image for the 3rd car. */
    static var CAR_3           :SpgImage = SpgImage( id: "car3"          )
    /** The image for the 4th car. */
    static var CAR_4           :SpgImage = SpgImage( id: "car4"          )
    /** The image for the 1st truck. */
    static var TRUCK_1         :SpgImage = SpgImage( id: "truck1"        )
    /** The image for the 2nd truck. */
    static var TRUCK_2         :SpgImage = SpgImage( id: "truck2"        )
    /** The image for the 3rd truck. */
    static var TRUCK_3         :SpgImage = SpgImage( id: "truck3"        )
    /** The image for the 1st tree. */
    static var TREE_1          :SpgImage = SpgImage( id: "tree1"         )
    /** The image for the 2nd tree. */
    static var TREE_2          :SpgImage = SpgImage( id: "tree2"         )
    /** The image for the 3rd tree. */
    static var TREE_3          :SpgImage = SpgImage( id: "tree3"         )
    /** The image for the 4th tree. */
    static var TREE_4          :SpgImage = SpgImage( id: "tree4"         )
    /** The image for the 5th tree. */
    static var TREE_5          :SpgImage = SpgImage( id: "tree5"         )
    /** The image for the 6th tree. */
    static var TREE_6          :SpgImage = SpgImage( id: "tree6"         )
    /** The image for the 7th tree. */
    static var TREE_7          :SpgImage = SpgImage( id: "tree7"         )
    /** The image for the 8th tree. */
    static var TREE_8          :SpgImage = SpgImage( id: "tree8"         )
    /** The image for the 9th tree. */
    static var TREE_9          :SpgImage = SpgImage( id: "tree9"         )
    /** The image for the water. */
    static var WATER           :SpgImage = SpgImage( id: "water"         )

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
