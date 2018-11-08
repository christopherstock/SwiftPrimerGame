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
        // invoke super constructor
        super.viewDidLoad()

        // acclaim
        SpgDebug.log( "Welcome to [" + SpgSetting.TITLE + "] v. [" + SpgSetting.VERSION + "]" )

        // play bg sound if enabled
        if ( !SpgSetting.DEBUG_MUTE )
        {
            // play bg sound
            let sound:SpgSound = SpgSound()
            sound.playBgSound()
        }

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
     *  @param onClose     The action to perform when the dialog is closed.
     */
    func showAlert(
        title:       String,
        message:     String,
        buttonLabel: String,
        onClose:     @escaping (UIAlertAction) -> Void
    ) -> Void
    {
        DispatchQueue.main.async {

            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(
                UIAlertAction(
                    title: buttonLabel,
                    style: .default,
                    handler: onClose
                )
            )

            self.present( alert, animated: true, completion: nil )
        }
    }
}
