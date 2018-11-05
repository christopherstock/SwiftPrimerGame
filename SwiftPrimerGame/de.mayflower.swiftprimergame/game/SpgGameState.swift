/**
 *  Specifies all possible game states.
 */
enum SpgGameState
{
    /** The game and the player is running. */
    case RUNNING
    /** Game over though player crashed. */
    case PLAYER_CRASHED
    /** Game over though player reached the finish line. */
    case FINISH_REACHED
}
