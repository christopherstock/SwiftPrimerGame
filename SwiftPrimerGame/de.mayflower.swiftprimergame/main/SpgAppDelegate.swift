import UIKit

/**
 *  The main application delegate
 *
 *  TODO Enable moving obstacles.
 *  TODO Dynamically create UIViewController and UIView?
 *
 *  TODO MINOR Move all setting constants to plist file
 *  TODO MINOR Limit draw area to inner bounds? (without navbar and statusbar)
 *  TODO MINOR Fix simulator lag on touch input
 *
 *  ASK  How to avoid initializing duplicate values in init() and reset() -> SpgGame: https://stackoverflow.com/questions/37903782/how-to-prevent-duplicate-code-when-initializing-variables
 *  ASK  plist file best practices?
 *  ASK  Should _ be used as parameter label
 *  ASK  How can UIImage be unboxed in constructor
 *  ASK  Documentation generator tool
 *  ASK  How to solve duplicate parameter and instance field names in constructor
 *  ASK  Best practice for using: open, public, internal, fileprivate, private
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
