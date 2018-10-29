import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller that holds the singleton UIView.
 */
class SpgViewController : UIViewController
{
    /** The singleton game instance. */
    public static var game :SpgGame! = nil

    /**
     *  Being invoked when the view is fully loaded.
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "Welcome to [" + SpgSetting.TITLE + "] v. [" + SpgSetting.VERSION + "]" )

        // init game engine and start the main loop
        SpgViewController.game = SpgGame( viewController: self )
        SpgViewController.game.startGameLoop()
    }
}
