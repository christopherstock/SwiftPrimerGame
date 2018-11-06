/**
 *  Separates the level data.
 */
class SpgLevelData
{
    /**
     *  Creates the player.
     *
     *  @return The player instance.
     */
    func createPlayer() -> SpgPlayer
    {
        return SpgPlayer(
            image:  SpgImage.PLAYER_PRISTINE,
            startX: 305,
            startY: SpgSetting.PLAYER_START_Y
        )
    }

    /**
     *  Creates the decoration.
     *
     *  @return All decoration objects.
     */
    func createDecos() -> [SpgDeco]
    {
        return [
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
    }

    /**
     *  Creates the obstacles.
     *
     *  @return All obstacle objects.
     */
    func createObstacles() -> [SpgObstacle]
    {
        return [
            SpgObstacle( image: SpgImage.CAR_1,     startX: 435,  startY: 250, movement: SpgObstacleMovement.UP   ),
            SpgObstacle( image: SpgImage.TRUCK_1,   startX: 305,  startY: 650, movement: SpgObstacleMovement.DOWN ),

            SpgObstacle( image: SpgImage.TREE_1,    startX: 35,   startY: 100  ),
            SpgObstacle( image: SpgImage.TREE_1,    startX: 35,   startY: 400  ),
            SpgObstacle( image: SpgImage.TREE_1,    startX: 35,   startY: 700  ),
            SpgObstacle( image: SpgImage.TREE_1,    startX: 35,   startY: 1000 ),

            SpgObstacle( image: SpgImage.TREE_2,    startX: 600,  startY: 100  ),
            SpgObstacle( image: SpgImage.TREE_2,    startX: 600,  startY: 400  ),
            SpgObstacle( image: SpgImage.TREE_2,    startX: 600,  startY: 700  ),
            SpgObstacle( image: SpgImage.TREE_2,    startX: 600,  startY: 1000 ),

            SpgObstacle( image: SpgImage.TREE_3,    startX: 190,  startY: 1300 ),
            SpgObstacle( image: SpgImage.TREE_3,    startX: 330,  startY: 1600 ),
            SpgObstacle( image: SpgImage.TREE_3,    startX: 470,  startY: 1900 ),
            SpgObstacle( image: SpgImage.TREE_3,    startX: 470,  startY: 2200 ),
            SpgObstacle( image: SpgImage.TREE_3,    startX: 470,  startY: 2500 ),

            SpgObstacle( image: SpgImage.TREE_4,    startX: 450,  startY: 3200 ),
            SpgObstacle( image: SpgImage.TREE_4,    startX: 430,  startY: 3470 ),

            SpgObstacle( image: SpgImage.WATER,     startX: -364, startY: 2830 ),
            SpgObstacle( image: SpgImage.WATER,     startX: 960,  startY: 2830 ),
        ]
    }
}
