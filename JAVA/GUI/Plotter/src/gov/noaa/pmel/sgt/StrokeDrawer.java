/*
 * $Id: StrokeDrawer.java 8825 2006-06-28 14:44:59Z pompert $
 *
 * This software is provided by NOAA for full, free and open release.  It is
 * understood by the recipient/user that NOAA assumes no liability for any
 * errors contained in the code.  Although this software is released without
 * conditions or restrictions in its use, it is expected that appropriate
 * credit be given to its author and to the National Oceanic and Atmospheric
 * Administration should the software be included by the recipient as an
 * element in other product development.
 */

package  gov.noaa.pmel.sgt;

import java.awt.*;


/**
 * Defines the methods that implement stroke drawing in sgt. This
 * interface is necessary since sgt v2.0 will use Java2D functionality
 * to draw strokes if it is available.
 *
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since 2.1
 */
public interface StrokeDrawer {

  public void drawHeavy(Graphics g, int[] xout, int[] yout, int size,
                        LineAttribute attr);

  public void drawDashed(Graphics g, int[] xout, int[] yout, int size,
                         LineAttribute attr);

  public void drawStroke(Graphics g, int[] xout, int[] yout, int size,
                         LineAttribute attr);

  public void drawHighlight(Graphics g, int[] xout, int[] yout, int size,
			    LineAttribute attr);
}










