/*
 * $Id: ColorTransform.java 8825 2006-06-28 14:44:59Z pompert $
 *
 * This software is provided by NOAA for full, free and open release.  It is
 * understood by the recipient/user that NOAA assumes no liability for any
 * errors contained in the code.  Although this software is released without
 * conditions or restrictions in its use, it is expected that appropriate
 * credit be given to its author and to the National Oceanic and Atmospheric
 * Administration should the software be included by the recipient as an
 * element in other product development.
 */
 
package gov.noaa.pmel.util;

import java.beans.PropertyChangeListener;
import gov.noaa.pmel.util.Range2D;
import java.awt.*;
import gov.noaa.pmel.sgt.TransformColor;
import gov.noaa.pmel.sgt.Transform;
 
/**
 * <code>Transform</code> defines an interface for transformations between 
 * user and physical coordinates.
 *
 * @see AxisTransform
 *
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since 1.0
 */
public class ColorTransform implements TransformColor {
	Transform mRedTransform;
	Transform mGreenTransform;
	Transform mBlueTransform;;
	
	public ColorTransform() {
	}
	
	public ColorTransform(Transform redTransform, Transform greenTransform, Transform blueTransform) {
		mRedTransform = redTransform;
		mGreenTransform = greenTransform;
		mBlueTransform = blueTransform;
	}
	
	public Transform getRedTransform() {
		return mRedTransform;
	}

	public void setRedTransform(Transform redTransform) {
		mRedTransform = redTransform;
	}

	public Transform getGreenTransform()  {
		return mGreenTransform;
	}

	public void setGreenTransform(Transform greenTransform) {
		mGreenTransform = greenTransform;
	}

	public Transform getBlueTransform() {
		return mBlueTransform;
	}

	public void setBlueTransform(Transform blueTransform) {
		mBlueTransform = blueTransform;
	}

	public void setColorTransforms(Transform red, Transform green, Transform blue) {
		mRedTransform = red;
		mGreenTransform = green;
		mBlueTransform = blue;
	}
}

