/*
 * LoadFileDialog.java
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

import java.io.File;
import javax.swing.JFileChooser;

/**
 * @created 26-01-2006, 11:33
 *
 * @author  coolen
 *
 * @version $Id: BeamFileDialog.java 15066 2010-05-25 11:35:17Z coolen $
 *
 * @updated
 */
public class BeamFileDialog extends javax.swing.JDialog {
    
    /** Creates new form BeanForm
     * 
     * @param   parent      Frame where this dialog belongs to
     * @param   modal       Should the Dialog be modal or not
     * @param   aType       Beams or AnaBeams
     */
    public BeamFileDialog(java.awt.Frame parent, boolean modal, String aType) {
        super(parent, modal);
        initComponents();
              setTopLabel(aType);
        getRootPane().setDefaultButton(loadButton);
        
        ok=true;
    }
    
    public void setType(String aType) {
        setTopLabel(aType);
        getRootPane().setDefaultButton(loadButton);
        
        ok=true;
    }
    
    /* Sets the top label with the right information */
    private void setTopLabel(String name) {
        this.topLabelInput.setText("Choose a file with " + name);
    }

     
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        topLabelInput = new javax.swing.JLabel();
        fileNameInput = new javax.swing.JTextField();
        browseButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();
        loadButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("LOFAR Load File");
        setAlwaysOnTop(true);
        setModal(true);
        setName("loadFileDialog"); // NOI18N
        setResizable(false);

        topLabelInput.setText("Choose a file");

        fileNameInput.setToolTipText("Filename field");

        browseButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/nl/astron/lofar/sas/otb/icons/16_fileopen.gif"))); // NOI18N
        browseButton.setText("Browse");
        browseButton.setToolTipText("browse for a file");
        browseButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                browseButtonActionPerformed(evt);
            }
        });

        cancelButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/nl/astron/lofar/sas/otb/icons/16_cancel.png"))); // NOI18N
        cancelButton.setText("Cancel");
        cancelButton.setToolTipText("Cancel filesearch");
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelButtonActionPerformed(evt);
            }
        });

        loadButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/nl/astron/lofar/sas/otb/icons/16_apply.png"))); // NOI18N
        loadButton.setText("Load");
        loadButton.setToolTipText("Load this File");
        loadButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                loadButtonActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createSequentialGroup()
                        .add(10, 10, 10)
                        .add(topLabelInput, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 370, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(layout.createSequentialGroup()
                        .addContainerGap()
                        .add(cancelButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 100, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                        .add(loadButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 110, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(layout.createSequentialGroup()
                        .addContainerGap()
                        .add(fileNameInput, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 337, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                        .add(browseButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 111, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(39, 39, 39)
                .add(topLabelInput, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 20, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(10, 10, 10)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(fileNameInput, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(browseButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 20, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 52, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(cancelButton)
                    .add(loadButton))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void browseButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_browseButtonActionPerformed
        if (fc == null) {
            fc = new JFileChooser();
        }
      int returnVal = fc.showOpenDialog(this);
      if (returnVal == JFileChooser.APPROVE_OPTION) {
          itsFile = fc.getSelectedFile();
          fileNameInput.setText(itsFile.getPath());
      }
    }//GEN-LAST:event_browseButtonActionPerformed

    private void loadButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_loadButtonActionPerformed
        ok = true;
        setVisible(false);
        dispose();
    }//GEN-LAST:event_loadButtonActionPerformed

    private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelButtonActionPerformed
        ok = false;
        setVisible(false);

        dispose();
    }//GEN-LAST:event_cancelButtonActionPerformed


    private File itsFile    = null;
    private JFileChooser fc = null;
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton browseButton;
    private javax.swing.JButton cancelButton;
    private javax.swing.JTextField fileNameInput;
    private javax.swing.JButton loadButton;
    private javax.swing.JLabel topLabelInput;
    // End of variables declaration//GEN-END:variables


    
    /**
     * Getter for property fileName.
     * @return Value of property fileName.
     */
    public File getFile()    {

        return this.itsFile;
    }

  
    /**
     * Holds value of property ok.
     */
    private boolean ok;

    /**
     * Getter for property ok.
     * @return Value of property ok.
     */
    public boolean isOk() {

        return this.ok;
    }
    
}