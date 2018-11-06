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

    /** The singleton player instance. */
    private var player    :SpgPlayer
    /** The decoration objects. */
    private var decos     :[SpgDeco]
    /** The obstacles. */
    private var obstacles :[SpgObstacle]

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

        let data:SpgLevelData = SpgLevelData()

        player          = data.createPlayer()
        decos           = data.createDecos()
        obstacles       = data.createObstacles()
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
        if ( SpgSetting.DEBUG_DRAW_GAME_OBJECT_RECTS )
        {
            // draw bg
            drawDebugBg( ctx: ctx, camera: camera )
        }

        // draw decos
        for deco in decos
        {
            deco.draw( ctx: ctx, camera: camera )
        }

        // draw obstacles
        for obstacle in obstacles
        {
            obstacle.draw( ctx: ctx, camera: camera )
        }

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

    /**
     *  Renders the level for one tick of the game logic.
     *
     *  @return The new game state after performing this tick.
     */
    func render() -> SpgGameState
    {
        // move player forward
        player.moveDown()

        // move all obstacles
        for obstacle in obstacles
        {
            obstacle.move()
        }

        // check if the player crashed
        if ( !SpgSetting.DEBUG_DISABLE_COLLISIONS )
        {
            for obstacle in obstacles
            {
                if ( player.getRect().overlaps( rect: obstacle.getRect() ) )
                {
                    player.setImage( newImage: SpgImage.PLAYER_CRASHED )

                    return .PLAYER_CRASHED
                }
            }
        }

        // check if the level end is reached now
        if ( player.getRect().y >= height - player.getRect().height - SpgSetting.PLAYER_OFFSET_BOTTOM )
        {
            return .FINISH_REACHED
        }

        return .RUNNING
    }
}
