import Foundation
import UIKit

/**
 *  The main application class.
 *
 *  TODO Add main thread.
 *  TODO Add UI controls via dragging.
 *  TODO Add example game logic.
 *  TODO Assign UIView dimensions only once in viewDidLoad etc.
 *  TODO Add documentation for all elements.
 *  TODO Structure all classes to packages.
 *  TODO Extract drawing methods to static methods in SpgDrawing.
 */
class SpgMain
{
    /**
     *  The main method being invoked when the viewController is operative.
     *
     *  @param viewController The view controller instance.
     */
    public static func main( viewController: SpgViewController )
    {
        print( "SpgMain.main(viewController) being invoked" )

        viewController.testViewController()
        viewController.testView()




    }
}
