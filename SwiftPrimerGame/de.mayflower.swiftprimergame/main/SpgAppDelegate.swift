import UIKit

/**
 *  The main application delegate.
 */
@UIApplicationMain
class SpgAppDelegate: UIResponder, UIApplicationDelegate
{
    /** The UI window instance. */
    var window: UIWindow?

    /**
     *  The constructor is being invoked when this application is instanciated.
     */
    func application
    (
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
    -> Bool
    {
        // Override point for customization after application launch.
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
