import UIKit
import Foundation
import QuartzCore

/**
 *  Manages the game with all game components.
 *
 *  TODO Add main thread.
 *  TODO Add UI controls via dragging.
 *  TODO Add example game logic.
 *  TODO Assign UIView dimensions only once in viewDidLoad etc.
 *  TODO Add documentation for all elements.
 *  TODO Structure all classes to packages.
 *  TODO Extract drawing methods to static methods in SpgDrawing.
 */
class SpgGame
{
    /** The singleton instance of the view controller */
    private     var     viewController      :SpgViewController!         = nil

    /** Th singleton instance of the extended UIView. */
    private     var     view                :SpgView!                   = nil

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
    func tick( displaylink: CADisplayLink ) -> Void
    {
        print( displaylink.timestamp )

        view.setNeedsDisplay()
    }
}
