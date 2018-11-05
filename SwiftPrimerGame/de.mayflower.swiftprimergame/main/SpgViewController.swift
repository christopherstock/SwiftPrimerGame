import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller holding the singleton UIView.
 */
class SpgViewController : UIViewController
{
    /** The engine instance. */
    public static var engine :SpgEngine! = nil
    /** The game instance. */
    public static var game   :SpgGame!   = nil

    /**
     *  Being invoked when this view controller is initialized.
     *
     *  @param coder The coder instance.
     */
    required init?( coder: NSCoder )
    {
        super.init( coder: coder )
    }

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
