/*
 * $Id: ThreeDotsButton.java 8825 2006-06-28 14:44:59Z pompert $
 *
 * This software is provided by NOAA for full, free and open release.  It is
 * understood by the recipient/user that NOAA assumes no liability for any
 * errors contained in the code.  Although this software is released without
 * conditions or restrictions in its use, it is expected that appropriate
 * credit be given to its author and to the National Oceanic and Atmospheric
 * Administration should the software be included by the recipient as an
 * element in other product development.
 */

package gov.noaa.pmel.swing;

import javax.swing.JButton;
import java.awt.Color;
import java.awt.Insets;

/**
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since SGT 3.0
 **/
public class ThreeDotsButton extends JButton {
  private static ThreeDotsIcon dotsIcon_ = new ThreeDotsIcon(Color.black);

  public ThreeDotsButton() {
    super();
    setIcon(dotsIcon_);
    if(!MRJUtil.isAquaLookAndFeel()) {
      setMargin(new Insets(0, 0, 0, 0));
    }
   }
}