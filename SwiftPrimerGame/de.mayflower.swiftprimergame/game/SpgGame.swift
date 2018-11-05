import QuartzCore

/**
 *  Manages the game with all game components.
 */
class SpgGame
{
    /** A reference to the view controller. */
    private var viewController  :SpgViewController
    /** The singleton level instance. */
    private var level           :SpgLevel
    /** The singleton camera instance. */
    private var camera          :SpgCamera
    /** The touch system. */
    private var touch           :SpgTouch
    /** Specifies the current game state. */
    private var state           :SpgGameState

    /**
     *  Inits all game components.
     *
     *  @param viewController A reference to the view controller.
     *  @param view           A reference to the view.
     *  @param touch          A reference to the touch system.
     */
    init( viewController vc: SpgViewController, view: SpgView, touch aTouch :SpgTouch )
    {
        viewController = vc
        level          = SpgLevel( width:  1000,  height: 5800 )
        camera         = SpgCamera(
            subject:     level.getPlayer().getRect(),
            levelWidth:  level.width,
            levelHeight: level.height,
            viewWidth:   view.width,
            viewHeight:  view.height
        )
        touch          = aTouch
        state          = SpgGameState.RUNNING
    }

    /**
     *  Paints the entire game screen.
     *
     *  @param ctx The current drawing context.
     */
    func drawGameScreen( ctx:CGContext ) -> Void
    {
        level.draw( ctx: ctx, camera: camera )
    }

    /**
     *  Renders one tick of the game logic.
     */
    func render() -> Void
    {
        // only render if the level end is not reached yet and if the player didn't crash
        if ( state == .RUNNING )
        {
            // handle touch input
            level.handleTouchInput( touch: touch )

            // render level
            state = level.render()

            // update the camera scrolling offsets
            camera.update()
        }
    }
}
