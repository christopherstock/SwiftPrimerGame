import Foundation
import QuartzCore

/**
 *  Manages all entities for the game engine.
 */
class SpgEngine
{
    /** The width of the singleton view. */
    public  var VIEW_WIDTH     :Int                = 0
    /** The height of the singleton view. */
    public  var VIEW_HEIGHT    :Int                = 0

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
        self.viewController = viewController
        self.view           = viewController.view as? SpgView

        self.VIEW_WIDTH     = Int( self.view.frame.size.width  )
        self.VIEW_HEIGHT    = Int( self.view.frame.size.height )

        self.touch          = SpgTouch()
    }

    /**
     *  Starts the main loop that acts as the application's main thread.
     */
    public func startMainLoop() -> Void
    {
        let displaylink = CADisplayLink(
            target:   self,
            selector: #selector( self.tick )
        )

        displaylink.preferredFramesPerSecond = 20
        displaylink.add(
            to:      .current,
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
        SpgViewController.game.handleTouchInput( touch: self.touch )
        SpgViewController.game.render()

        self.repaintView()
    }

    /**
     *  Forces an immediate repaint of the view.
     */
    private func repaintView() -> Void
    {
        self.view.setNeedsDisplay()
    }
}
