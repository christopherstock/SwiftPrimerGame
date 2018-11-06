/**
 *  Represents a colliding obstacle object.
 */
class SpgObstacle : SpgGameObject
{
    /** Determines how this obstacle shall move. */
    var movement:SpgObstacleMovement

    /**
     *  Inits this game object.
     *
     *  @param image    The image to represent this game object.
     *  @param startX   Start position X.
     *  @param startY   Start position Y.
     *  @param movement How this obstacle shall move.
     */
    init( image img:SpgImage, startX:Int, startY:Int, movement aMovement:SpgObstacleMovement = .NONE )
    {
        movement = aMovement

        super.init( image: img, startX: startX, startY: startY )
    }

    /**
     *  Moves this obstacle.
     */
    func move() -> Void
    {
        switch ( movement )
        {
            case .UP:
                rect.y -= 2

            case .DOWN:
                rect.y += 1

            case .NONE:
                break
        }
    }
}
