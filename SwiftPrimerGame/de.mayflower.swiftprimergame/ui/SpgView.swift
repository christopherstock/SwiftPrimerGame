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

        // clear screen
        self.clearScreen( ctx: ctx )

        // draw player
        SpgViewController.game.drawGameScreen( ctx: ctx )
/*
        // draw moving rect
        SpgDrawing.drawRect(
            ctx:    ctx,
            x:      SpgViewController.game.x + 150,
            y:      0,
            width:  100,
            height: 900,
            col:    UIColor.blue
        )
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      SpgViewController.game.x + 10 + 150,
            y:      10,
            width:  100,
            height: 900,
            col:    UIColor.yellow
        )

        // draw moving rect
        SpgDrawing.drawRect(
            ctx:    ctx,
            x:      SpgViewController.game.x,
            y:      SpgViewController.game.y,
            width:  100,
            height: 200,
            col:    UIColor.red
        )
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      SpgViewController.game.x + 10,
            y:      SpgViewController.game.y + 10,
            width:  100,
            height: 200,
            col:    UIColor.gray
        )
*/
/*
        // flush all drawing operations
        ctx.flush()
        ctx.synchronize()
*/
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
