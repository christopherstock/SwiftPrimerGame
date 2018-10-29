import QuartzCore

/**
 *  Manages the game with all game components.
 */
class SpgGame
{
    /** The singleton level instance. */
    private var level  :SpgLevel!  = nil
    /** The singleton player instance. */
    private var player :SpgPlayer! = nil

    /**
     *  Inits all game components from scratch.
     */
    public init()
    {
        self.level  = SpgLevel( width: 1000, height: 5000 )
        self.player = SpgPlayer()
    }

    /**
     *  Paints the entire game screen.
     *
     *  @param ctx The current drawing context.
     */
    public func drawGameScreen( ctx:CGContext ) -> Void
    {
        self.level.draw(  ctx: ctx )
        self.player.draw( ctx: ctx )
    }

    /**
     *  Considers the current touch input events.
     *
     *  @param touch The instance of the touch input.
     */
    public func handleTouchInput( touch:SpgTouch ) -> Void
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

    /**
     *  Renders one tick of the game logic.
     */
    public func render() -> Void
    {
        self.player.moveForward()
    }
}
