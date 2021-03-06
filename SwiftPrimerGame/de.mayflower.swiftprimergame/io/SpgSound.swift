import AVFoundation

/**
 *  Manages one single sound to play.
 */
class SpgSound
{
    /** The native player instance. */
    private var player: AVAudioPlayer?

    /**
     *  Creates a new managed sound
     */
    init()
    {

    }

    func playBgSound()
    {
        guard let url = Bundle.main.url( forResource: "racer", withExtension: "mp3" ) else { return }

        do {

//          try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback,mode: AVAudioSession.Mode.default,options: AVAudioSession.CategoryOptions)

            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }    }
}
