import UIKit
import Foundation

class SpgView : UIView
{
    override func draw( _ rect : CGRect )
    {
        print( "SpgView.draw( rect ) being invoked" )


        self.drawExampleRectangle()
    }

    private func drawExampleRectangle()
    {
        let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
        let rectangleWidth:CGFloat = 100.0
        let rectangleHeight:CGFloat = 100.0

        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        //4
        ctx.addRect(CGRect(x: center.x - (0.5 * rectangleWidth), y: center.y - (0.5 * rectangleHeight), width: rectangleWidth, height: rectangleHeight))
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.gray.cgColor)
        ctx.strokePath()

        //5
        ctx.setFillColor(UIColor.green.cgColor)

        ctx.addRect(CGRect(x: center.x - (0.5 * rectangleWidth), y: center.y - (0.5 * rectangleHeight), width: rectangleWidth, height: rectangleHeight))

        ctx.fillPath()
    }
}
