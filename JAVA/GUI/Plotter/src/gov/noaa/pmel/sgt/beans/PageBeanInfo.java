/*
 * $Id: PageBeanInfo.java 8825 2006-06-28 14:44:59Z pompert $
 *
 * This software is provided by NOAA for full, free and open release.  It is
 * understood by the recipient/user that NOAA assumes no liability for any
 * errors contained in the code.  Although this software is released without
 * conditions or restrictions in its use, it is expected that appropriate
 * credit be given to its author and to the National Oceanic and Atmospheric
 * Administration should the software be included by the recipient as an
 * element in other product development.
 */

package gov.noaa.pmel.sgt.beans;

import java.beans.*;

/**
 * @author Donald Denbo
 * @version $Revision: 8825 $, $Date: 2006-06-28 14:44:59 +0000 (Wed, 28 Jun 2006) $
 * @since 3.0
 **/
public class PageBeanInfo extends SimpleBeanInfo {
  private Class beanClass = Page.class;
  private String iconColor16x16Filename = "PageIcon16.gif";
  private String iconColor32x32Filename = "PageIcon32.gif";
  private String iconMono16x16Filename;
  private String iconMono32x32Filename;

  public PageBeanInfo() {
  }
  public PropertyDescriptor[] getPropertyDescriptors() {
    try {
      PropertyDescriptor _background = new PropertyDescriptor("background", beanClass, null, "setBackground");
      PropertyDescriptor _dataModel = new PropertyDescriptor("dataModel", beanClass, "getDataModel", "setDataModel");
      PropertyDescriptor _JPane = new PropertyDescriptor("JPane", beanClass, "getJPane", null);
      PropertyDescriptor _JPaneSize = new PropertyDescriptor("JPaneSize", beanClass, "getJPaneSize", null);
      PropertyDescriptor _name = new PropertyDescriptor("name", beanClass, "getName", "setName");
      PropertyDescriptor _panelModel = new PropertyDescriptor("panelModel", beanClass, "getPanelModel", "setPanelModel");
      PropertyDescriptor _printHAlign = new PropertyDescriptor("printHAlign", beanClass, "getPrintHAlign", "setPrintHAlign");
      PropertyDescriptor _printOrigin = new PropertyDescriptor("printOrigin", beanClass, "getPrintOrigin", "setPrintOrigin");
      PropertyDescriptor _printScaleMode = new PropertyDescriptor("printScaleMode", beanClass, "getPrintScaleMode", "setPrintScaleMode");
      PropertyDescriptor _printVAlign = new PropertyDescriptor("printVAlign", beanClass, "getPrintVAlign", "setPrintVAlign");
      PropertyDescriptor[] pds = new PropertyDescriptor[] {
        _background,
        _dataModel,
        _JPane,
        _JPaneSize,
        _name,
        _panelModel,
        _printHAlign,
        _printOrigin,
        _printScaleMode,
        _printVAlign};
      return pds;
    }
    catch(IntrospectionException ex) {
      ex.printStackTrace();
      return null;
    }
  }
  public java.awt.Image getIcon(int iconKind) {
    switch (iconKind) {
      case BeanInfo.ICON_COLOR_16x16:
        return iconColor16x16Filename != null ? loadImage(iconColor16x16Filename) : null;
      case BeanInfo.ICON_COLOR_32x32:
        return iconColor32x32Filename != null ? loadImage(iconColor32x32Filename) : null;
      case BeanInfo.ICON_MONO_16x16:
        return iconMono16x16Filename != null ? loadImage(iconMono16x16Filename) : null;
      case BeanInfo.ICON_MONO_32x32:
        return iconMono32x32Filename != null ? loadImage(iconMono32x32Filename) : null;
    }
    return null;
  }
}