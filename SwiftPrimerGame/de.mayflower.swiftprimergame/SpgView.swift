import UIKit
import Foundation

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    var x : Int = 10

    override func draw( _ rect : CGRect )
    {
        print( "SpgView.draw(rect) being invoked" )

        let WIDTH  :CGFloat = self.frame.size.width
        let HEIGHT :CGFloat = self.frame.size.height
        print( " View dimensions are [" + WIDTH.description + "]x[" + HEIGHT.description + "]" )

        guard let ctx :CGContext = UIGraphicsGetCurrentContext() else { return }

        SpgDrawing.drawRect( ctx: ctx, x: self.x,      y: 20, width: 100, height: 200, col: UIColor.red  )
        SpgDrawing.fillRect( ctx: ctx, x: self.x + 20, y: 40, width: 100, height: 200, col: UIColor.gray )

        self.x += 1

    }

    func test()
    {
        print( "SpgView.test() being invoked!" )




    }
}
