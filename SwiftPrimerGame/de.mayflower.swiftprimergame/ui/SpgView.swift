import UIKit
import Foundation

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    /**
     *  Draws all game items on the UIView for the current game tick.
     */
    override func draw( _ rect:CGRect )
    {
        // get drawing context
        let ctx :CGContext = UIGraphicsGetCurrentContext()!

        // clear safe area
        self.clearScreen( ctx: ctx )

        // draw moving rect
        SpgDrawing.drawRect( ctx: ctx, x: SpgViewController.game.x,      y: 20, width: 100, height: 200, col: UIColor.red  )
        SpgDrawing.fillRect( ctx: ctx, x: SpgViewController.game.x + 20, y: 40, width: 100, height: 200, col: UIColor.gray )
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
            width:  SpgViewController.game.VIEW_WIDTH,
            height: SpgViewController.game.VIEW_HEIGHT,
            col:    UIColor.black
        )
    }

    /**
     *  Being invoked from the system when a touch operation has started.
     */
    override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.game.touch.onTouchDown(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation has ended.
     */
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.game.touch.onTouchMove(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation is moving.
     */
    override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        SpgViewController.game.touch.onTouchUp(
            point: event!.allTouches!.first!.location( in: self )
        )
    }

    /**
     *  Being invoked from the system when a touch operation is cancelled.
     */
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        SpgViewController.game.touch.onTouchUp(
            point: event!.allTouches!.first!.location( in: self )
        )
    }
}
