import UIKit
import Foundation

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    var x : Int = 10

    /**
     *  Draws all game items on the UIView for the current game tick.
     */
    override func draw( _ rect : CGRect )
    {
        // get drawing context
        guard let ctx :CGContext = UIGraphicsGetCurrentContext() else { return }

        // clear screen
        SpgDrawing.drawRect(
            ctx: ctx,
            x: 0,
            y: 0,
            width:  SpgViewController.game.VIEW_WIDTH  / 2,
            height: SpgViewController.game.VIEW_HEIGHT / 2,
            col: UIColor.black
        )

        // draw moving rect
        SpgDrawing.drawRect( ctx: ctx, x: self.x,      y: 20, width: 100, height: 200, col: UIColor.red  )
        SpgDrawing.fillRect( ctx: ctx, x: self.x + 20, y: 40, width: 100, height: 200, col: UIColor.gray )

        // animate rect .. Temporarily!
        self.x += 1
    }
}
