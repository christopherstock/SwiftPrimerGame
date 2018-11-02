import UIKit
import Foundation

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    /**
     *  Draws all the game items on the UIView for the current game tick.
     */
    override func draw( _ rect:CGRect )
    {
        // get drawing context
        let ctx :CGContext = UIGraphicsGetCurrentContext()!

        // clear screen
        self.clearScreen( ctx: ctx )

        // draw game screen
        SpgViewController.game.drawGameScreen( ctx: ctx )
    }

    /**
     *  Paints the entire screen with black color.
     *
     *  @param ctx The current drawing context.
     */
    private func clearScreen( ctx:CGContext ) -> Void
    {
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      0,
            y:      0,
            width:  SpgViewController.engine.VIEW_WIDTH,
            height: SpgViewController.engine.VIEW_HEIGHT,
            col:    UIColor.black
        )
    }

    /**
     *  Being invoked from the system when a touch operation has started.
     */
    override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.engine.touch.onTouchDown(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation has ended.
     */
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.engine.touch.onTouchMove(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation is moving.
     */
    override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.engine.touch.onTouchUp(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation is cancelled.
     */
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        SpgViewController.engine.touch.onTouchUp(
            point: event!.allTouches!.first!.location( in: self )
        )
    }
}
