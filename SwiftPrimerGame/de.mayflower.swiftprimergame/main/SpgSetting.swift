/**
 *  Contains all settings of the game as static values.
 */
class SpgSetting
{
    /** The global debug switch. */
    static let DEBUG_MODE                   :Bool   = true
    /** Specifies if debug rects shall be drawn for all game objects. */
    static let DEBUG_DRAW_GAME_OBJECT_RECTS :Bool   = ( true && DEBUG_MODE )
    /** Specifies if collisions shall be disabled. */
    static let DEBUG_DISABLE_COLLISIONS     :Bool   = ( false && DEBUG_MODE )

    /** The title of the game. */
    static let TITLE                        :String = "SwiftPrimerGame"
    /** The version of the game. */
    static let VERSION                      :String = "0.0.1"

    /** The desired frames per second for the UIView to redraw. */
    static let FRAMES_PER_SECOND            :Int    = 20

    /** The player's start position Y. */
    static let PLAYER_START_Y               :Int    = ( DEBUG_MODE ? 50 : 50 )

    /** The player's moving speed in horizontal direction. */
    static let PLAYER_SPEED_X               :Int    = 5
    /** The player's moving speed in vertical direction. */
    static let PLAYER_SPEED_Y               :Int    = 5

    /** The player's top offset to the screen border. */
    static let PLAYER_OFFSET_TOP            :Int    = 50
    /** The player's bottom offset to the screen border when reaching the finish line. */
    static let PLAYER_OFFSET_BOTTOM         :Int    = 150
}
