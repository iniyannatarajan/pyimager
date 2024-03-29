/*
 * ButtonPanel.java
 *
 *  Copyright (C) 2002-2007
 *  ASTRON (Netherlands Foundation for Research in Astronomy)
 *  P.O.Box 2, 7990 AA Dwingeloo, The Netherlands, seg@astron.nl
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package nl.astron.lofar.sas.otbcomponents;

import java.awt.event.ActionListener;
import java.util.*;
import javax.swing.*;
import org.apache.log4j.Logger;

/**
 * @created 13-01-2006, 14:01
 *
 * @author  blaakmeer
 *
 * @version $Id: ButtonPanel.java 22364 2012-10-16 14:41:04Z coolen $
 *
 * @updated
 */
public final class ButtonPanel extends javax.swing.JPanel {
    
    static Logger logger = Logger.getLogger(ButtonPanel.class);
    static String name = "ButtonPanel";
    
    /** Creates new form BeanForm */
    public ButtonPanel() {
        buttons = new HashMap<>();
        initComponents();
        hasPlaceHolder=true;
    }

    /** adds a button to the BeanForm */
    public void addButton(String text) {
        if (hasPlaceHolder) {
            jPanelButtons.remove(buttonsPlaceHolder);
            hasPlaceHolder=false;
        }
        
        JButton jButton = new JButton();
        jButton.setText(text);
        java.awt.GridBagConstraints gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.insets = new java.awt.Insets(0, 2, 0, 2);
        jPanelButtons.add(jButton, gridBagConstraints);

        /** add the event firing code */
        jButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                fireActionListenerActionPerformed(evt);
            }
        });
        
        buttons.put(text,jButton);
        jPanelButtons.repaint();
    }
    
    /** sets the visibility state of the button */
    public void setButtonVisible(String button, boolean visible) {
        buttons.get(button).setVisible(visible);
        jPanelButtons.repaint();
    }

    /** returns the visible state of the button */
    public boolean isButtonVisible(String button) {
        if (buttons.containsKey(button)) {
            return buttons.get(button).isVisible();
        } else {
            logger.error("wrong button asked: "+button);
            return false;
        }
    }

    /** sets the enable state of the button */
    public void setButtonEnabled(String button, boolean enabled) {
        buttons.get(button).setEnabled(enabled);
        jPanelButtons.repaint();
    }
    
    /** returns the enable state of the button */
    public boolean isButtonEnabled(String button) {
        if (buttons.containsKey(button)) {
            return buttons.get(button).isEnabled();
        } else {
            logger.error("wrong button asked: "+button);
            return false;
        }
    }

    /** Sets the tooltiptext for a button
     *
     * @param   button     the Key identifying this button
     * @param   tooltip    text to go to the tooltip
     *
     */
    public void setButtonToolTip(String button, String toolTipText) {
        buttons.get(button).setToolTipText(toolTipText);
        jPanelButtons.repaint();
    }

    /** Sets an icon for a button
     *
     * @param   button     the Key identifying this button
     * @param   icon       icon for this button
     *
     */
    public void setButtonIcon(String button,Icon icon) {
        buttons.get(button).setIcon(icon);
    }
    
    
    /** remove one button and the actionListeners associated with it
     *
     * @param   key     the Key identifying this button
     */
     public void removeButton(String aKey) {
         if (buttons.containsKey(aKey)) {
            ActionListener al[]=buttons.get(aKey).getActionListeners();
            for (int i=0;i<al.length;i++) {
                removeActionListener(al[i]);
            }
            jPanelButtons.remove(buttons.get(aKey));
            buttons.remove(aKey);            
         }
         if (buttons.isEmpty()) {
            jPanelButtons.add(buttonsPlaceHolder);
            hasPlaceHolder=true;
         }
         jPanelButtons.repaint();
     }
    
     private void showMap() {
        Iterator it=buttons.keySet().iterator();
        while (it.hasNext()) {
            String key =((String)it.next());
            logger.trace(key+" <-> "+ buttons.get(key).getText());
        }    
     }

     /** remove all buttons from button panel, restores the buttonplaceholder
     *  and removes all actionListeners associated with these buttons.
     */ 
    public void removeAllButtons() {
        Iterator it=buttons.keySet().iterator();
        while (it.hasNext()) {
            String aKey=(String)it.next();
            if (buttons.containsKey(aKey)) {
                ActionListener al[]=buttons.get(aKey).getActionListeners();
                for (int i=0;i<al.length;i++) {
                    removeActionListener(al[i]);
                }
                jPanelButtons.remove(buttons.get(aKey));
            }
        }
        buttons.clear();
        jPanelButtons.repaint();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanelButtons = new javax.swing.JPanel();
        buttonsPlaceHolder = new javax.swing.JButton();

        setLayout(new java.awt.BorderLayout());

        jPanelButtons.setLayout(new java.awt.GridBagLayout());

        jPanelButtons.setBorder(new javax.swing.border.EtchedBorder());
        buttonsPlaceHolder.setText("group of buttons here");
        jPanelButtons.add(buttonsPlaceHolder, new java.awt.GridBagConstraints());

        add(jPanelButtons, java.awt.BorderLayout.CENTER);

    }
    // </editor-fold>//GEN-END:initComponents


    /** 
     * Contains all buttons in the form 
     */
    private HashMap<String,JButton> buttons;
    private boolean hasPlaceHolder=false;
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton buttonsPlaceHolder;
    private javax.swing.JPanel jPanelButtons;
    // End of variables declaration//GEN-END:variables

    /**
     * Utility field used by event firing mechanism.
     */
    private javax.swing.event.EventListenerList myListenerList =  null;

    /**
     * Registers ActionListener to receive events.
     *
     * @param listener The listener to register.
     */
    public void addActionListener(java.awt.event.ActionListener listener) {

        if (myListenerList == null ) {
            myListenerList = new javax.swing.event.EventListenerList();
        }
        myListenerList.add (java.awt.event.ActionListener.class, listener);
    }

    /**
     * Removes ActionListener from the list of listeners.
     *
     * @param listener The listener to remove.
     */
    public void removeActionListener(java.awt.event.ActionListener listener) {

        myListenerList.remove (java.awt.event.ActionListener.class, listener);
    }

    /**
     * Notifies all registered listeners about the event.
     * 
     * @param event The event to be fired
     */
    private void fireActionListenerActionPerformed(java.awt.event.ActionEvent event) {

        if (myListenerList == null) return;
        Object[] listeners = myListenerList.getListenerList ();
        for (int i = listeners.length - 2; i >= 0; i -= 2) {
            if (listeners[i]==java.awt.event.ActionListener.class) {
                ((java.awt.event.ActionListener)listeners[i+1]).actionPerformed (event);
            }
        }
    }
    
}
