import Foundation
import QuartzCore

/**
 *  Manages the game with all game components.
 *
 *  TODO Add UI controls for dragging.
 *  TODO Add example game logic.
 *  TODO Svg => Spg
 *
 *  TODO MINOR Improve static access to SpgGame instance? Enable static access to ViewController or AppDelegate?
 *  TODO MINOR Limit draw area to inner bounds? (without navbar and statusbar)
 */
class SpgGame
{
    /** The width of the singleton view. */
    public  var VIEW_WIDTH     :Int                = 0
    /** The height of the singleton view. */
    public  var VIEW_HEIGHT    :Int                = 0

    /** Temporary animation value. */
    public  var x              :Int                = 10

    /** Manages the touch logic. */
    public  var touch          :SvgTouch!          = nil

    /** The singleton instance of the view controller */
    private var viewController :SpgViewController! = nil
    /** The singleton instance of the extended UIView. */
    private var view           :SpgView!           = nil

    /**
     *  Inits all game components from scratch.
     *
     *  @param viewController The singleton view controller instance.
     */
    public init( viewController :SpgViewController )
    {
        print( "SpgGame.init() being invoked" )

        self.viewController = viewController
        self.view           = viewController.view as? SpgView

        self.VIEW_WIDTH     = Int( self.view.frame.size.width  )
        self.VIEW_HEIGHT    = Int( self.view.frame.size.height )

        self.touch          = SvgTouch()
    }

    /**
     *  Starts the game loop that acts as the application's main thread.
     */
    public func startGameLoop() -> Void
    {
        let displaylink = CADisplayLink(
            target: self,
            selector: #selector( self.tick )
        )

        displaylink.preferredFramesPerSecond = 25
        displaylink.add(
            to: .current,
            forMode: RunLoop.Mode.default
        )
    }

    /**
     *  The game loop method that is being invoked each game tick.
     *
     *  @param displayLink The linked display object containing additional information.
     */
    @objc
    private func tick( displaylink: CADisplayLink ) -> Void
    {
        // render this game tick
        self.render()

        // check pointer input


        // repaint the view
        view.setNeedsDisplay()
    }

    /**
     *  Renders one tick of the game logic.
     */
    private func render() -> Void
    {
        // animate rect .. Temporarily!
        self.x += 1

        // render more ..

    }
}
