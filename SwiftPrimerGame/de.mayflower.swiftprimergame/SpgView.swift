import UIKit
import Foundation

class SpgView : UIView
{
/*
    override init( frame : CGRect )
    {
        super.init( frame: frame )
    }
*/
/*
    required init( coder : NSCoder )
    {
        super.init( coder: coder )
    }
*/
    override func draw( _ rect : CGRect )
    {
        print( "SpgView.draw( rect ) being invoked" )

        let WIDTH  :CGFloat = self.frame.size.width
        let HEIGHT :CGFloat = self.frame.size.height

        print( " View dimensions are [" + WIDTH.description + "]x[" + HEIGHT.description + "]" )

        self.drawExampleRectangle()
    }

    private func drawExampleRectangle()
    {
        let rectangleWidth  :CGFloat = 100.0
        let rectangleHeight :CGFloat = 200.0

        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        ctx.beginPath()
        ctx.setStrokeColor( UIColor.red.cgColor )
        ctx.setLineWidth( 10 )
        ctx.addRect( CGRect( x: 10, y: 20, width: rectangleWidth, height: rectangleHeight ) )
        ctx.strokePath()

        ctx.beginPath()
        ctx.setFillColor( UIColor.green.cgColor )
        ctx.addRect( CGRect( x: 10, y: 20, width: rectangleWidth, height: rectangleHeight ) )
        ctx.fillPath()
    }
}
