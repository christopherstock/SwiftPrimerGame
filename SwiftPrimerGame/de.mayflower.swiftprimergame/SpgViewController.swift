import UIKit

class SpgViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "SpgViewController.viewDidLoad() being invoked" )

        // Do any additional setup after loading the view, typically from a nib.




/*
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            ctx.cgContext.setLineWidth(10)

            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        img.draw(in: CGRect( x:0, y:0, width:20, height:30 ))
*/


    }
}
