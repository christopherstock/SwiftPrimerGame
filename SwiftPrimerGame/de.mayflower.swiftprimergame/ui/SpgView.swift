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
    override func draw( _ rect : CGRect )
    {
        // get drawing context
        let ctx :CGContext = UIGraphicsGetCurrentContext()!

        // clear screen
        SpgDrawing.fillRect(
            ctx: ctx,
            x: 0,
            y: 0,
            width:  SpgViewController.game.VIEW_WIDTH,
            height: SpgViewController.game.VIEW_HEIGHT,
            col: UIColor.black
        )

        // draw moving rect
        SpgDrawing.drawRect( ctx: ctx, x: SpgViewController.game.x,      y: 20, width: 100, height: 200, col: UIColor.red  )
        SpgDrawing.fillRect( ctx: ctx, x: SpgViewController.game.x + 20, y: 40, width: 100, height: 200, col: UIColor.gray )
    }
}
