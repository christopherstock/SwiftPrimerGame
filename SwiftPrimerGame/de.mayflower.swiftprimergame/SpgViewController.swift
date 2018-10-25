import UIKit
import Foundation

class SpgViewController : UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "SpgViewController.viewDidLoad() being invoked" )

        print( " View Frame size:" )
        print( self.view.frame  )
        print( self.view.bounds )

        print( "Welcome to SwiftPrimerGame, v. [0.0.1]" )
        SpgMain.main( viewController: self )



        // Do any additional setup after loading the view, typically from a nib.
    }

    func testViewController()
    {
        print( "SpgViewController.testViewController() being invoked!" )
    }

    func testView()
    {
        print( "SpgViewController.testView() being invoked!" )

        // guard let view :SpgView = self.view as? SpgView else { return }
        let view :SpgView = self.view as! SpgView
        view.test()




    }
}
