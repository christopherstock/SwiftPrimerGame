import QuartzCore

/**
 *  Manages the game with all game components.
 */
class SpgGame
{
    /** The singleton level instance. */
    private var level  :SpgLevel
    /** The singleton player instance. */
    private var player :SpgPlayer
    /** The singleton camera instance. */
    private var camera :SpgCamera

    /** Flags if the player reached the level end. */
    private var levelEndReached :Bool

    /**
     *  Inits all game components from scratch.
     */
    init( x: Int )
    {
        level  = SpgLevel(  width: 1000, height: 5000 )
        player = SpgPlayer( startX: x, startY: 0 )
        camera = SpgCamera( level: self.level, player: self.player )

        levelEndReached = false
    }

    convenience init()
    {
        self.init( x: 475 )
    }

    /**
     *  Paints the entire game screen.
     *
     *  @param ctx The current drawing context.
     */
    public func drawGameScreen( ctx:CGContext ) -> Void
    {
        self.level.draw(  ctx: ctx, camera: camera )
        self.player.draw( ctx: ctx, camera: camera )
    }

    /**
     *  Considers the current touch input events.
     *
     *  @param touch The instance of the touch input.
     */
    public func handleTouchInput( touch:SpgTouch ) -> Void
    {
        // only move if the level end is not reached
        if ( !self.levelEndReached )
        {
            // move player horizontally
            if ( touch.swipedLeft )
            {
                self.player.moveLeft()
            }
            else if ( touch.swipedRight )
            {
                self.player.moveRight( level: self.level )
            }
        }
    }

    /**
     *  Renders one tick of the game logic.
     */
    public func render() -> Void
    {
        // check if the level end is reached
        if ( self.player.rect.y >= self.level.height - self.player.rect.height )
        {
            self.levelEndReached = true
        }

        // move player forward if the level end is not reached
        if ( !self.levelEndReached )
        {
            self.player.moveForward()
        }

        // update the camera scrolling offsets
        self.camera.update()
    }
}
