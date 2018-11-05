import UIKit

/**
 *  The main application delegate
 *
 *  TODO init() in viewController class .. remove statics
 *  TODO Remove all ? everywhere
 *  TODO Remove ! in UIImage constructor
 *  TODO Find better startup than SpgViewController
 *  TODO Redesign 'public' and 'private' everywhere
 *  TODO Offset for car to bottom
 *  TODO Add debug switch for debug bg blocks
 *  TODO Remove all ! .. everywhere
 *  TODO Add finish line
 *  TODO Add obstacles
 *  TODO Add deco
 *  TODO Add image system. Done
 *  TODO Add images for game objects
 *  TODO Add sprites and sprite system
 *  TODO Add bg music
 *  TODO Add game end on reaching bottom bound etc
 *
 *  TODO MINOR Improve static access to SpgGame instance. Enable static access to ViewController or AppDelegate
 *  TODO MINOR Limit draw area to inner bounds. (without navbar and statusbar)
 *  TODO MINOR Fix simulator lag on touch input
 *
 *  ASK  Should _ be used as parameter label
 *  ASK  How can UIImage be unboxed in constructor
 *  ASK  Documentation generator tool
 *  ASK  How to solve duplicate parameter and instance field names in constructor
 */
@UIApplicationMain
class SpgAppDelegate: UIResponder, UIApplicationDelegate
{
    /** The UI window instance. */
    var window: UIWindow?

    /**
     *  The constructor is being invoked when this application is instanciated.
     */
    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool
    {
        SpgDebug.log( "SpgAppDelegate.application being invoked" )

        return true
    }

    /**
     *  Being invoked when the application moves from active to inactive state.
     */
    func applicationWillResignActive( _ application: UIApplication )
    {
        SpgDebug.log( "SpgAppDelegate.applicationWillResignActive being invoked" )
    }

    /**
     *  Being invoked when the application enters the background state.
     */
    func applicationDidEnterBackground( _ application: UIApplication )
    {
        SpgDebug.log( "SpgAppDelegate.applicationDidEnterBackground being invoked" )
    }

    /**
     *  Being invoked when the application enters the foreground state.
     */
    func applicationWillEnterForeground( _ application: UIApplication )
    {
        SpgDebug.log( "SpgAppDelegate.applicationWillEnterForeground being invoked" )
    }

    /**
     *  Being invoked when the application became active (again).
     */
    func applicationDidBecomeActive( _ application: UIApplication )
    {
        SpgDebug.log( "SpgAppDelegate.applicationDidBecomeActive being invoked" )
    }

    /**
     *  Being invoked when the application is about to terminate.
     */
    func applicationWillTerminate( _ application: UIApplication )
    {
        SpgDebug.log( "SpgAppDelegate.applicationWillTerminate being invoked" )
    }
}
