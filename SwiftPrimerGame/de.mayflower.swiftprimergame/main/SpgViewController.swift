import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller that holds the singleton UIView.
 *
 *
 *  TODO Separate engine belongings in this class to SpgEngine
 *  TODO Add deug class and mode and debug logs.
 *
 *  TODO MINOR Improve static access to SpgGame instance? Enable static access to ViewController or AppDelegate?
 *  TODO MINOR Limit draw area to inner bounds? (without navbar and statusbar)
 */
class SpgViewController : UIViewController
{
    /** The engine instance. */
    public static var engine :SpgEngine! = nil
    /** The game instance. */
    public static var game   :SpgGame!   = nil

    /**
     *  Being invoked when the view is fully loaded.
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "Welcome to [" + SpgSetting.TITLE + "] v. [" + SpgSetting.VERSION + "]" )

        // init engine and game
        SpgViewController.engine = SpgEngine()
        SpgViewController.game   = SpgGame( viewController: self )

        // start the game loop
        SpgViewController.game.startGameLoop()
    }
}
