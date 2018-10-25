import UIKit
import Foundation
import QuartzCore

class SpgViewController : UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print( "SpgViewController.viewDidLoad() being invoked" )

        print( " View Frame size:" )
        print( self.view.frame  )
        print( self.view.bounds )

        print( "Welcome to SwiftPrimerGame, v. [0.0.1]" )
        SpgMain.main( viewController: self )





        // try main thread
        DispatchQueue.global( qos: .background ).async
        {
            print("==> This is run on the background queue")

            DispatchQueue.main.async
            {
                print("==> This is run on the main queue, after the previous code in outer block")
            }
        }



        // try game loop?
/*
        var updater = CADisplayLink(target: self, selector: Selector("gameLoop"))
        updater.preferredFramesPerSecond = 25
        updater.addToRunLoop(RunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
*/

        /*
        self.view.setNeedsDisplay()
        self.view.setNeedsDisplay()
        self.view.setNeedsDisplay()
        self.view.setNeedsDisplay()
*/
        self.startGameLoop()

        // Do any additional setup after loading the view, typically from a nib.
    }

    func testViewController()
    {
        print( "SpgViewController.testViewController() being invoked!" )
    }

    func testView()
    {
        print( "SpgViewController.testView() being invoked!" )

        // guard let view :SpgView = self.view as? SpgView else { return }
        let view :SpgView = self.view as! SpgView
        view.test()




    }

    func startGameLoop()
    {
        let displaylink = CADisplayLink(
            target: self,
            selector: #selector( self.step )
        )

        displaylink.preferredFramesPerSecond = 25
        displaylink.add(
            to: .current,
            forMode: RunLoop.Mode.default
        )
    }

    @objc
    func step( displaylink: CADisplayLink )
    {
        print(displaylink.timestamp)

        let view :SpgView = self.view as! SpgView
        view.setNeedsDisplay()

    }
}
