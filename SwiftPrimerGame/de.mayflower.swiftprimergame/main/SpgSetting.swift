import Foundation
import QuartzCore

/**
 *  Contains all settings of the game as static values.
 */
class SpgSetting
{
    /** The global debug switch. */
    public static let DEBUG_MODE     :Bool   = true

    /** The title of the game. */
    public static let TITLE          :String = "SwiftPrimerGame"

    /** The version of the game. */
    public static let VERSION        :String = "0.0.1"

    /** The player's moving speed in horizontal direction. */
    public static let PLAYER_SPEED_X :Int    = 5
    /** The player's moving speed in vertical direction. */
    public static let PLAYER_SPEED_Y :Int    = 5
}
