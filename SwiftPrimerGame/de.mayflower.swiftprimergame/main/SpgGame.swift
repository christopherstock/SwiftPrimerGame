import QuartzCore
/*
 import Foundation
*/

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
    /** Temporary animation value. */
    public  var y              :Int                = 0

    /** Manages the touch logic. */
    public  var touch          :SpgTouch!          = nil

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

        self.touch          = SpgTouch()
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

        displaylink.preferredFramesPerSecond = 20
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
        self.handleTouchInput()
        self.render()
        self.repaintView()
    }

    /**
     *  Renders one tick of the game logic.
     */
    private func handleTouchInput() -> Void
    {
        // animate rect .. Temporarily!
        if ( self.touch.swipedLeft  )
        {
            self.x -= 1

            print( "Move LEFT" )
        }
        else if ( self.touch.swipedRight )
        {
            self.x += 1

            print( "Move RIGHT" )
        }
        else
        {
            print( "No move" )
        }

        // render more ..

    }

    /**
     *  Renders one tick of the game logic.
     */
    private func render() -> Void
    {
        // animate rect .. Temporarily!
        self.y += 1

        // render more ..

    }

    /**
     *  Forces an immediate repaint of the view.
     */
    private func repaintView() -> Void
    {
        self.view.setNeedsDisplay()
    }
}
