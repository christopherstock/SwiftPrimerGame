import UIKit
import Foundation
import QuartzCore

/**
 *  The main view controller holding the singleton UIView.
 *
 *  TODO init() in THIS class
 *  TODO Remove self. everywhere
 *  TODO Remove all ! .. everywhere!
 *  TODO Remove all ? everywhere?
 *  TODO Remove ! in UIImage constructor!
 *  TODO Add drawImage to SpgDrawing!
 *  TODO Find better startup than SpgViewController ?
 *  TODO Redesign 'public' and 'private' everywhere!
 *  TODO Offset for car to bottom!
 *  TODO Add debug switch for debug bg blocks.
 *
 *  TODO Add finish line!
 *  TODO Add obstacles!
 *  TODO Add deco?
 *  TODO Add image system. Done?
 *  TODO Add images for game objects.
 *  TODO Add sprites and sprite system.
 *  TODO Add bg music.
 *  TODO Add game end on reaching bottom bound etc.
 *
 *  TODO MINOR Fix simulator lag on touch input.
 *  TODO MINOR Improve static access to SpgGame instance? Enable static access to ViewController or AppDelegate?
 *  TODO MINOR Limit draw area to inner bounds? (without navbar and statusbar)
 *
 *  ASK  Should _ be used as parameter label?
 *  ASK  How can UIImage be unboxed in constructor?
 *  ASK  Documentation generator tool?
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

SpgDebug.log( self.view.frame.size.width  )
SpgDebug.log( self.view.frame.size.height )

        // init engine and game
        SpgViewController.engine = SpgEngine( viewController: self )
        SpgViewController.game   = SpgGame()

        // start the main loop
        SpgViewController.engine.startMainLoop()
    }
}
