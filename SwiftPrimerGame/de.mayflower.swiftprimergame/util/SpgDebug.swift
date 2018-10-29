import UIKit
import Foundation

/**
 *  The debug system that wraps debug logs.
 */
class SpgDebug
{
    /**
     *  Logs the specified debug message in the debug console.
     *  Only if the global debug switch is enabled.
     *
     *  @param msg The message or any debug object to log.
     */
    public static func log( _ msg:Any )
    {
        if ( SpgSetting.DEBUG_MODE )
        {
            print( msg )
        }
    }
}
