import UIKit

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    /** The width of the singleton view. */
    var width  :Int = 0
    /** The height of the singleton view. */
    var height :Int = 0
    /** The touch instance. */
    var touch  :SpgTouch

    /** A reference to the game instance. TODO remove! */
    private var game  :SpgGame!

    /**
     *  Creates a new UI View with the given position and size.
     *
     *  @param frame Specifies the drawable area on the screen.
     *  @param touch The touch instance.
     */
    init( frame:CGRect, touch aTouch:SpgTouch )
    {
        width  = Int( frame.size.width  )
        height = Int( frame.size.height )
        touch  = aTouch

        super.init( frame: frame )

        SpgDebug.log( "Assigned view dimensions [" + String( width ) + "][" + String( height ) + "]" )
    }

    /**
     *  Required initializer though overridden init.
     */
    required init?( coder aDecoder: NSCoder )
    {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     *  Temporary game instance setter .. TODO remove! .. create constructor
     */
    func setGame( game aGame:SpgGame )
    {
        game = aGame
    }

    /**
     *  Draws all the game items on the UIView for the current game tick.
     *
     *  @param rect The rectangle of the drawable area.
     */
    override func draw( _ rect:CGRect )
    {
        // get drawing context
        if let ctx :CGContext = UIGraphicsGetCurrentContext()
        {
            // clear screen
            clearScreen( ctx: ctx )

            // draw game screen
            game.drawGameScreen( ctx: ctx )
        }
    }

    /**
     *  Paints the entire screen with black color.
     *
     *  @param ctx The current drawing context.
     */
    func clearScreen( ctx:CGContext ) -> Void
    {
        SpgDrawing.fillRect(
            ctx:    ctx,
            x:      0,
            y:      0,
            width:  width,
            height: height,
            col:    UIColor.black
        )
    }

    /**
     *  Being invoked from the system when a touch operation has started.
     */
    override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        if let firstTouch:UITouch = event?.allTouches?.first
        {
            touch.onTouchDown(
                point: firstTouch.location( in: self )
            )
        }
    }

    /**
     *  Being invoked from the system when a touch operation has ended.
     */
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        if let firstTouch:UITouch = event?.allTouches?.first
        {
            touch.onTouchMove(
                point: firstTouch.location( in: self )
            )
        }
    }

    /**
     *  Being invoked from the system when a touch operation is moving.
     */
    override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        if let firstTouch:UITouch = event?.allTouches?.first
        {
            touch.onTouchUp(
                point: firstTouch.location( in: self )
            )
        }
    }

    /**
     *  Being invoked from the system when a touch operation is cancelled.
     */
    override func touchesCancelled( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        if let firstTouch:UITouch = event?.allTouches?.first
        {
            touch.onTouchUp(
                point: firstTouch.location( in: self )
            )
        }
    }
}
