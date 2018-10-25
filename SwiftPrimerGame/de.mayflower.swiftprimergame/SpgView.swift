import UIKit
import Foundation

class SpgView : UIView
{
    override func draw( _ rect : CGRect )
    {
        print( "SpgView.draw(rect) being invoked" )

        let WIDTH  :CGFloat = self.frame.size.width
        let HEIGHT :CGFloat = self.frame.size.height
        print( " View dimensions are [" + WIDTH.description + "]x[" + HEIGHT.description + "]" )

        guard let ctx :CGContext = UIGraphicsGetCurrentContext() else { return }

        SpgDrawing.drawRect( ctx: ctx, x: 10, y: 20, width: 100, height: 200, col: UIColor.red  )
        SpgDrawing.fillRect( ctx: ctx, x: 30, y: 40, width: 100, height: 200, col: UIColor.gray )
    }

    func test()
    {
        print( "SpgView.test() being invoked!" )




    }
}
