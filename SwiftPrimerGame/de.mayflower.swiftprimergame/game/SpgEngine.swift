import Foundation
import QuartzCore

/**
 *  Manages all entities for the game engine.
 */
class SpgEngine
{
    /** The width of the singleton view. */
    public  var VIEW_WIDTH     :Int
    /** The height of the singleton view. */
    public  var VIEW_HEIGHT    :Int

    /** The game instance. */
    public var  game           :SpgGame

    /** Manages the touch logic. */
    public  var touch          :SpgTouch
    /** The singleton instance of the view controller */
    private var viewController :SpgViewController
    /** The singleton instance of the extended UIView. */
    private var view           :SpgView

    /**
     *  Inits all game components from scratch.
     *
     *  @param vc The singleton view controller instance.
     */
    public init( viewController vc :SpgViewController )
    {
        // this is horrible!

        viewController = vc

        view           = viewController.view as! SpgView

        VIEW_WIDTH     = Int( view.frame.size.width  )
        VIEW_HEIGHT    = Int( view.frame.size.height )

        game           = SpgGame( viewWidth: VIEW_WIDTH, viewHeight: VIEW_HEIGHT )
        view.setGame( game: game )

        touch          = SpgTouch()

    }

    /**
     *  Starts the main loop that acts as the application's main thread.
     */
    public func startMainLoop() -> Void
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
