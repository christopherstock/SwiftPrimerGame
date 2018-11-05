import QuartzCore

/**
 *  Manages the game with all game components.
 */
class SpgGame
{
    /** The singleton level instance. */
    private var level           :SpgLevel
    /** The singleton player instance. */
    private var player          :SpgPlayer
    /** The singleton camera instance. */
    private var camera          :SpgCamera
    /** Flags if the player reached the level end. */
    private var levelEndReached :Bool

    /**
     *  Inits all game components.
     *
     *  @param view A reference to the view.
     */
    init( view: SpgView )
    {
        level  = SpgLevel(  width:  1000,  height: 5000 )
        player = SpgPlayer( startX: 475,   startY: SpgSetting.PLAYER_OFFSET_TOP )
        camera = SpgCamera(
            subject:     player.getRect(),
            levelWidth:  level.width,
            levelHeight: level.height,
            viewWidth:   view.width,
            viewHeight:  view.height
        )

        levelEndReached = false
    }

    /**
     *  Paints the entire game screen.
     *
     *  @param ctx The current drawing context.
     */
    func drawGameScreen( ctx:CGContext ) -> Void
    {
        level.draw(  ctx: ctx, camera: camera )
        player.draw( ctx: ctx, camera: camera )
    }

    /**
     *  Considers the current touch input events.
     *
     *  @param touch The instance of the touch input.
     */
    func handleTouchInput( touch:SpgTouch ) -> Void
    {
        // only move if the level end is not reached
        if ( !levelEndReached )
        {
            // move player horizontally
            if ( touch.swipedLeft )
            {
                player.moveLeft()
            }
            else if ( touch.swipedRight )
            {
                player.moveRight( level: level )
            }
        }
    }

    /**
     *  Renders one tick of the game logic.
     */
    func render() -> Void
    {
        // check if the level end is reached
        if ( player.getRect().y >= level.height - player.getRect().height - SpgSetting.PLAYER_OFFSET_BOTTOM )
        {
            levelEndReached = true
        }

        // move player forward if the level end is not reached
        if ( !levelEndReached )
        {
            player.moveForward()
        }

        // update the camera scrolling offsets
        camera.update()
    }
}
