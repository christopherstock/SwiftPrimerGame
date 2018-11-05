import Foundation
import QuartzCore

/**
 *  Contains all settings of the game as static values.
 */
class SpgSetting
{
    /** The global debug switch. */
    public static let DEBUG_MODE           :Bool   = true

    /** The title of the game. */
    public static let TITLE                :String = "SwiftPrimerGame"

    /** The version of the game. */
    public static let VERSION              :String = "0.0.1"

    /** The desired frames per second for the UIView to redraw. */
    public static let FRAMES_PER_SECOND    :Int    = 20

    /** The player's moving speed in horizontal direction. */
    public static let PLAYER_SPEED_X       :Int    = 5
    /** The player's moving speed in vertical direction. */
    public static let PLAYER_SPEED_Y       :Int    = 5

    /** The player's top offset to the screen border. */
    public static let PLAYER_OFFSET_TOP    :Int    = 50

    /** The player's bottom offset to the screen border when reaching the finish line. */
    public static let PLAYER_OFFSET_BOTTOM :Int    = 150
}
