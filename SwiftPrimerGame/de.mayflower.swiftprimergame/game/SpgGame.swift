import QuartzCore

/**
 *  Manages the game with all game components.
 */
class SpgGame
{
    /** The singleton level instance. */
    private var level  :SpgLevel
    /** The singleton camera instance. */
    private var camera :SpgCamera

    /**
     *  Inits all game components.
     *
     *  @param view A reference to the view.
     */
    init( view: SpgView )
    {
        level  = SpgLevel( width:  1000,  height: 5800 )
        camera = SpgCamera(
            subject:     level.getPlayer().getRect(),
            levelWidth:  level.width,
            levelHeight: level.height,
            viewWidth:   view.width,
            viewHeight:  view.height
        )
    }

    /**
     *  Paints the entire game screen.
     *
     *  @param ctx The current drawing context.
     */
    func drawGameScreen( ctx:CGContext ) -> Void
    {
        level.draw(  ctx: ctx, camera: camera )
    }

    /**
     *  Considers the current touch input events.
     *
     *  @param touch The instance of the touch input.
     */
    func handleTouchInput( touch:SpgTouch ) -> Void
    {
        // propagate to level
        level.handleTouchInput( touch: touch )
    }

    /**
     *  Renders one tick of the game logic.
     */
    func render() -> Void
    {
        // render level
        level.render()

        // update the camera scrolling offsets
        camera.update()
    }
}
