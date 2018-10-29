import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller holding the singleton UIView.
 *
 *  TODO Add image system.
 *  TODO Add images for game objects.
 *  TODO Add sprites and sprite system.
 *  TODO Add bg music.
 *  TODO Add game end on reaching bottom bound etc.
 *
 *  TODO MINOR Fix simulator lag on touch input.
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

        SpgDebug.log( "Welcome to [" + SpgSetting.TITLE + "] v. [" + SpgSetting.VERSION + "]" )

        // init engine and game
        SpgViewController.engine = SpgEngine( viewController: self )
        SpgViewController.game   = SpgGame()

        // start the main loop
        SpgViewController.engine.startMainLoop()
    }
}
