/*
 * $Id: TransformColor.java 8825 2006-06-28 14:44:59Z pompert $
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

/**
 * Interface provides support for accessing color transforms for a
 * color map.
 *
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since 2.0
 */
public interface TransformColor {
  Transform getRedTransform();

  void setRedTransform(Transform redTransform);

  Transform getGreenTransform();

  void setGreenTransform(Transform greenTransform);

  Transform getBlueTransform();

  void setBlueTransform(Transform blueTransform);

  void setColorTransforms(Transform red, Transform green, Transform blue);
}
