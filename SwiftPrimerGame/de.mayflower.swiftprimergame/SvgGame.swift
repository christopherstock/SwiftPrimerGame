import UIKit
import Foundation
import QuartzCore

/**
 *  Manages the game with all game components.
 *
 *  TODO Add documentation for all elements.
 *  TODO Structure all classes to packages.
 *  TODO Limit draw area to inner bounds?
 *  TODO Add example game logic.
 *  TODO Add UI controls via dragging.
 */
class SpgGame
{
    /** The width of the singleton view. */
    public      var     VIEW_WIDTH          :Int                        = 0
    /** The height of the singleton view. */
    public      var     VIEW_HEIGHT         :Int                        = 0

    /** The singleton instance of the view controller */
    private     var     viewController      :SpgViewController!         = nil

    /** The singleton instance of the extended UIView. */
    private     var     view                :SpgView!                   = nil

    public      var     x                   :Int                        = 10

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


    }
}
