import UIKit

/**
 *  The main view controller holding the singleton UIView.
 */
class SpgViewController : UIViewController
{
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

    /**
     *  Shows an alert dialog.
     *
     *  @param title       The dialog title.
     *  @param message     The dialog message.
     *  @param buttonLabel The label for the button that closes the dialog.
     */
    func showAlert( title:String, message:String, buttonLabel:String ) -> Void
    {
        DispatchQueue.main.async {

            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction( UIAlertAction( title: buttonLabel, style: .default, handler: nil) )

            self.present( alert, animated: true, completion: nil )
        }
    }
}
