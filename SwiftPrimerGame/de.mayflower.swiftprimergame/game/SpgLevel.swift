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

        player          = SpgPlayer(
            image:  SpgImage.PLAYER_PRISTINE,
            startX: 305,
            startY: SpgSetting.PLAYER_OFFSET_TOP
        )
        decos           = [
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 0    ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 904  ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 1808 ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 2712 ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 3616 ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 4520 ),
            SpgDeco( image: SpgImage.BG,            startX: 0,   startY: 5424 ),

            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 0    ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 391  ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 782  ),
            SpgDeco( image: SpgImage.ROAD_RIGHT,    startX: 260, startY: 1173 ),
            SpgDeco( image: SpgImage.ROAD_RIGHT,    startX: 460, startY: 1564 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 660, startY: 1955 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 660, startY: 2346 ),
            SpgDeco( image: SpgImage.BRIDGE,        startX: 660, startY: 2737 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 660, startY: 3187 ),
            SpgDeco( image: SpgImage.ROAD_LEFT,     startX: 460, startY: 3578 ),
            SpgDeco( image: SpgImage.ROAD_LEFT,     startX: 260, startY: 3969 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 4360 ),
            SpgDeco( image: SpgImage.BRIDGE,        startX: 260, startY: 4751 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 5201 ),
            SpgDeco( image: SpgImage.ROAD_STRAIGHT, startX: 260, startY: 5592 ),
            SpgDeco( image: SpgImage.FINISH_LINE,   startX: 260, startY: 5469 ),
        ]

        obstacles       = [
            SpgObstacle( image: SpgImage.CAR_1,     startX: 425, startY: 250  ),
            SpgObstacle( image: SpgImage.TRUCK_1,   startX: 305, startY: 830  ),
        ]
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

        // check if the player crashed
        for obstacle in obstacles
        {
            if ( player.getRect().overlaps( rect: obstacle.getRect() ) )
            {
                player.setImage( newImage: SpgImage.PLAYER_CRASHED )

                return .PLAYER_CRASHED
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
