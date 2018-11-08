import Foundation
import QuartzCore

/**
 *  Manages all entities for the game engine.
 */
class SpgEngine
{
    /** The singleton instance of the view controller */
    private var viewController :SpgViewController
    /** Manages the touch logic. */
    private var touch          :SpgTouch
    /** The singleton instance of the extended UIView. */
    private var view           :SpgView
    /** The game instance. */
    private var game           :SpgGame

    /**
     *  Inits all game components from scratch.
     *
     *  @param vc The singleton view controller instance.
     */
    init( viewController vc :SpgViewController )
    {
        // reference view controller
        viewController = vc

        // create touch instance
        touch = SpgTouch()

        // create UIView and add to view controller
        view = SpgView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: vc.view.frame.size.width,
                height: vc.view.frame.size.height
            ),
            touch: touch
        )
        viewController.view.addSubview( view )

        // create game instance
        game = SpgGame( viewController: vc, view: view, touch: touch )

        // add game reference to view
        view.setGame(  game:  game  )
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
