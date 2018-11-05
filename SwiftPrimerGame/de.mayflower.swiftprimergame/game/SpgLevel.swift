import Foundation
import CoreGraphics
import UIKit

/**
 *  Represents the level that surrounds the player .
 */
class SpgLevel
{
    /** The width of the accessable area. */
    var width  :Int
    /** The height of the accessable area. */
    var height :Int

    /** Flags if the player reached the level end. */
    private var levelEndReached :Bool
    /** The singleton player instance. */
    private var player          :SpgPlayer

    /**
     *  Creates a new level instance.
     *
     *  @param width  Desired level width.
     *  @param height Desired level height.
     */
    init( width aWidth:Int, height aHeight:Int )
    {
        width           = aWidth
        height          = aHeight
        levelEndReached = false
        player          = SpgPlayer( startX: 475, startY: SpgSetting.PLAYER_OFFSET_TOP )
    }

    /**
     *  Delivers the player instance.
     *
     *  @return This level's player.
     */
    func getPlayer() -> SpgPlayer
    {
        return player
    }

    /**
     *  Draws the player onto the given drawing context.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    func draw( ctx:CGContext, camera:SpgCamera ) -> Void
    {
        // draw bg
        drawDebugBg( ctx: ctx, camera: camera )

        // draw fg
        player.draw( ctx: ctx, camera: camera )
    }

    /**
     *  Draws the debug background as a checkered debug field.
     *
     *  @param ctx    The drawing context to draw onto.
     *  @param camera The current camera position.
     */
    private func drawDebugBg( ctx:CGContext, camera:SpgCamera )
    {
        let SEGMENT_WIDTH  :Int = 100
        let SEGMENT_HEIGHT :Int = 100

        var drawX          :Int  = 0
        var drawY          :Int  = 0

        var toggleColor    :Bool = false

        while ( drawY < height )
        {
            drawX = 0
            while ( drawX < width )
            {
                SpgDrawing.fillRect(
                    ctx:    ctx,
                    x:      drawX - camera.scrollX,
                    y:      drawY - camera.scrollY,
                    width:  SEGMENT_WIDTH,
                    height: SEGMENT_HEIGHT,
                    col:    ( toggleColor ? UIColor.green : UIColor.cyan )
                )
                drawX += SEGMENT_WIDTH

                toggleColor = !toggleColor
            }

            toggleColor = !toggleColor

            drawY += SEGMENT_HEIGHT
        }
    }

    /**
     *  Considers the current touch input events.
     *
     *  @param touch The instance of the touch input.
     */
    func handleTouchInput( touch:SpgTouch ) -> Void
    {
        // only move if the level end is not reached
        if ( !levelEndReached )
        {
            // move player horizontally
            if ( touch.swipedLeft )
            {
                player.moveLeft()
            }
            else if ( touch.swipedRight )
            {
                player.moveRight( level: self )
            }
        }
    }

    /**
     *  Renders the level for one tick of the game logic.
     */
    func render() -> Void
    {
        // check if the level end is reached
        if ( player.getRect().y >= height - player.getRect().height - SpgSetting.PLAYER_OFFSET_BOTTOM )
        {
            levelEndReached = true
        }

        // move player forward if the level end is not reached
        if ( !levelEndReached )
        {
            player.moveForward()
        }
    }
}
