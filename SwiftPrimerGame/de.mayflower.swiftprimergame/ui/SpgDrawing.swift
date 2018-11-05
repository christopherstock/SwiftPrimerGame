import Foundation
import UIKit

/**
 *  Offers independent drawing functonality.
 */
class SpgDrawing
{
    /**
     *  Draws the stroke of a rect.
     *
     *  @param ctx    The context to draw onto.
     *  @param x      The location x of the rectangle to draw.
     *  @param y      The location y of the rectangle to draw.
     *  @param width  The width  of the rectangle to draw.
     *  @param height The height of the rectangle to draw.
     *  @param col    The color for the drawing operation.
     */
    static func drawRect( ctx:CGContext, x:Int, y:Int, width:Int, height:Int, col:UIColor )
    {
        ctx.beginPath()
        ctx.setStrokeColor( col.cgColor )
        ctx.setLineWidth( 1 )
        ctx.addRect( CGRect( x: x, y: y, width: width, height: height ) )
        ctx.strokePath()
    }

    /**
     *  Fills a rect.
     *
     *  @param ctx    The context to draw onto.
     *  @param x      The location x of the rectangle to draw.
     *  @param y      The location y of the rectangle to draw.
     *  @param width  The width  of the rectangle to draw.
     *  @param height The height of the rectangle to draw.
     *  @param col    The color for the drawing operation.
     */
    static func fillRect( ctx:CGContext, x:Int, y:Int, width:Int, height:Int, col:UIColor )
    {
        ctx.beginPath()
        ctx.setFillColor( col.cgColor )
        ctx.addRect( CGRect( x: x, y: y, width: width, height: height ) )
        ctx.fillPath()
    }

    /**
     *  Draws an image on the specified location.
     *
     *  @param ctx The context to draw onto.
     *  @param img The image to draw.
     *  @param x   The location x for the image to draw.
     *  @param y   The location y for the image to draw.
     */
    static func drawImage( ctx:CGContext, img:UIImage, x:Int, y:Int )
    {
        let imagePoint :CGPoint  = CGPoint( x: x, y: y )
        img.draw( at: imagePoint )
    }
}
