import UIKit
import Foundation

/**
 *  The view class that's displayed in the View Controller.
 */
class SpgView : UIView
{
    /** The width of the singleton view. */
    public var  width  :Int = 0
    /** The height of the singleton view. */
    public var  height :Int = 0

    /** A reference to the game instance. TODO remove! */
    private var game   :SpgGame!
    /** The touch instance. */
    private var touch  :SpgTouch!

    /**
     *  Temporary game instance setter .. TODO remove! .. create constructor
     */
    public func setGame( game aGame:SpgGame )
    {
        game = aGame
    }

    /**
     *  Temporary touch instance setter .. TODO remove!
     */
    public func setTouch( touch aTouch:SpgTouch )
    {
        touch = aTouch
    }

    /**
     *  Assigns the view width and height from the current frame size.
     */
    public func assignDimensions()
    {
        width  = Int( frame.size.width  )
        height = Int( frame.size.height )
    }

    /**
     *  Draws all the game items on the UIView for the current game tick.
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
    private func clearScreen( ctx:CGContext ) -> Void
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
