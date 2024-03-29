//  Copyright (C) 2000, 2001
//  ASTRON (Netherlands Foundation for Research in Astronomy)
//  P.O.Box 2, 7990 AA Dwingeloo, The Netherlands, seg@astron.nl
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//////////////////////////////////////////////////////////////////////

package org.astron.util;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.util.*;
import org.astron.util.gui.*;

public class Sample {

  public Sample() {
    JFrame frame = new JFrame("JNotifier demo");
    JNotifier notifier = new JNotifier();
    addMessageListener(notifier);
    fireMessage(new MessageEvent (this,"Dit is een foutmelding",MessageEvent.ERROR));
    fireMessage(new MessageEvent (this,"Nu een waarschuwing",MessageEvent.WARNING));
    fireMessage(new MessageEvent (this,"Dit is een gewone melding"));
    fireMessage(new MessageEvent (this,"MessageEvent"));
    fireMessage(new MessageEvent (this,"Dit is een gewone melding"));
    fireMessage(new MessageEvent (this,"Dit is een gewone melding"));
    fireMessage(new MessageEvent (this,"Dit is een gewone melding"));
    frame.getContentPane().add(notifier);
    frame.pack();
    frame.show();
    frame.addWindowListener(new MyWindowListener());
  }

  /** Classes that wish to report active messages to the user should implement
   *  these methods.
   *
   *  ----------------------------
   */

  ArrayList _mlisteners = new ArrayList();

  public void addMessageListener (MessageListener messageListener) {
    _mlisteners.add(messageListener);
  }
  public void removeMessageListener (MessageListener messageListener) {
    _mlisteners.remove(messageListener);
  }
  public void fireMessage(MessageEvent event) {
    for (int i=0; i<_mlisteners.size(); i++) {
      ((MessageListener)_mlisteners.get(i)).note(event);
    }
  }

  /** -------------------------------- */


  /*** Main ***/
  public static void main(String[] args) {
    Sample sample1 = new Sample();
  }
  private class MyWindowListener implements WindowListener {
    public void windowActivated(WindowEvent e) {}
    public void windowClosed(WindowEvent e) {}
    public void windowClosing(WindowEvent e) { System.exit(0); }
    public void windowDeactivated(WindowEvent e) {}
    public void windowDeiconified(WindowEvent e) {}
    public void windowIconified(WindowEvent e) {}
    public void windowOpened(WindowEvent e) {}
  }
}