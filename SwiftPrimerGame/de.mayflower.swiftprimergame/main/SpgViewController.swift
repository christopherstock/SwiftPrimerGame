import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller holding the singleton UIView.
 */
class SpgViewController : UIViewController
{
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

        // init engine and start main loop
        let engine:SpgEngine = SpgEngine( viewController: self )
        engine.startMainLoop()
    }
}
