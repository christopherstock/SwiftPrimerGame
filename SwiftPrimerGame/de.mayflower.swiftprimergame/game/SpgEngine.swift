import Foundation
import QuartzCore

/**
 *  Manages all entities for the game engine.
 */
class SpgEngine
{
    /** The game instance. */
    private var game           :SpgGame
    /** Manages the touch logic. */
    private var touch          :SpgTouch
    /** The singleton instance of the view controller */
    private var viewController :SpgViewController
    /** The singleton instance of the extended UIView. */
    private var view           :SpgView

    /**
     *  Inits all game components from scratch.
     *
     *  @param vc The singleton view controller instance.
     */
    init( viewController vc :SpgViewController )
    {
        // this is horrible! TODO Try dynamic view and viewController creation!

        viewController = vc

        touch          = SpgTouch()

        view           = viewController.view as! SpgView
        view.assignDimensions()

        game           = SpgGame( view: view )

        view.setGame(  game:  game  )
        view.setTouch( touch: touch )
    }

    /**
     *  Starts the main loop that acts as the application's main thread.
     */
    func startMainLoop() -> Void
    {
        let displaylink = CADisplayLink(
            target:   self,
            selector: #selector( tick )
        )

        displaylink.preferredFramesPerSecond = SpgSetting.FRAMES_PER_SECOND
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
        game.handleTouchInput( touch: touch )
        game.render()

        repaintView()
    }

    /**
     *  Forces an immediate repaint of the view.
     */
    private func repaintView() -> Void
    {
        view.setNeedsDisplay()
    }
}
