import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller that holds the singleton UIView.
 */
class SpgViewController : UIViewController
{
    /** The singleton game instance. */
    var game :SpgGame! = nil

    /**
     *  Being invoked when the view is loaded completely.
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "SpgViewController.viewDidLoad() being invoked" )

        // init game engine and start the main loop
        self.game = SpgGame( viewController: self )
        self.game.startGameLoop()

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
