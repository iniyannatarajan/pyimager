/*
 * $Id: LayerControl.java 8825 2006-06-28 14:44:59Z pompert $
 *
 * This software is provided by NOAA for full, free and open release.  It is
 * understood by the recipient/user that NOAA assumes no liability for any
 * errors contained in the code.  Although this software is released without
 * conditions or restrictions in its use, it is expected that appropriate
 * credit be given to its author and to the National Oceanic and Atmospheric
 * Administration should the software be included by the recipient as an
 * element in other product development.
 */

package gov.noaa.pmel.sgt;

import java.awt.Graphics;

/**
 * Used internally by SGT to work with <code>Layer</code> and
 * <code>LayerContainer</code>.
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since 3.0
 **/
public interface LayerControl {
  /**
   * Used internally by sgt.
   * @param pane Parent pane
   */
  void setPane(AbstractPane pane);
  /**
   * Used internally by sgt.
   * @param g Graphics object
   * @throws PaneNotFoundException Pane not found.
   */
  void draw(Graphics g) throws PaneNotFoundException;
  /**
   * Used internally by sgt.
   * @since 2.0
   * @param g Graphics object.
   * @throws PaneNotFoundException Pane not found.
   */
  void drawDraggableItems(Graphics g) throws PaneNotFoundException;

  /**
   * Get identifier of layer.  Internally uses getName() method for <code>Panel</code>.
   * @since 3.0
   * @return identifier
   */
  String getId();
}