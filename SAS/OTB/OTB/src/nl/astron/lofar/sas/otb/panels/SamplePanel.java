/*
 * SamplePanel.java
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
 *
 */

package nl.astron.lofar.sas.otb.panels;

import org.apache.log4j.Logger;
import nl.astron.lofar.sas.otb.MainFrame;
import nl.astron.lofar.sas.otb.jotdb3.jOTDBnode;
import nl.astron.lofar.sas.otb.util.treemanagers.ResultTreeManager;
import nl.astron.lofar.sas.otb.util.treenodes.TreeNode;


/**
 * This panel contains a TreePanel and some textfields that display information
 * about the selected node.
 *
 * An event listener was added to catch TreeSelection events from the TreePanel
 *
 * @created 13-01-2006, 14:58
 * @author  blaakmeer
 * @version $Id: SamplePanel.java 22364 2012-10-16 14:41:04Z coolen $
 * @updated
 */
public final class SamplePanel extends javax.swing.JPanel 
                       implements IPluginPanel {

    static Logger logger = Logger.getLogger(SamplePanel.class);
    static String name = "Sample";
    
    private int treeCounter=0;
    
    /** Creates new form BeanForm */
    public SamplePanel() {
        initComponents();
        initialize();
    }
        
    public void initialize() {
        treePanel.setTitle("Example Tree");
        buttonPanel.addButton("New Tree");
        buttonPanel.setButtonIcon("New Tree",new javax.swing.ImageIcon(getClass().getResource("/nl/astron/lofar/sas/otb/icons/16_new.png")));
        buttonPanel.addButton("Back to Main");
        buttonPanel.setButtonIcon("Back to Main",new javax.swing.ImageIcon(getClass().getResource("/nl/astron/lofar/sas/otb/icons/16_exit1.png")));

    }

    public boolean initializePlugin(MainFrame mainframe) {
        itsMainFrame = mainframe;


        setNewRootNode();
        return true;
    }
    
    public void setNewRootNode() {

        // initialize the tree
        // create a sample root node. This should be retrieved from the OTDB of course.
        jOTDBnode otdbNode = new jOTDBnode(0,0,0,0);
        otdbNode.name = "Node_0";
        // put the OTDBnode in a wrapper for the tree
        //OTDBtreeNode otdbTreeNode = new OTDBtreeNode(otdbNode, itsMainFrame.getOTDBrmi());
        // example of an empty tree
         ResultTreeManager treeManager = ResultTreeManager.getInstance(itsMainFrame.getUserAccount());
          
        TreeNode otdbTreeNode = new TreeNode(treeManager,otdbNode);

        itsMainFrame.setHourglassCursor();
        // and create a new root
        treePanel.newRootNode(otdbTreeNode);
        itsMainFrame.setNormalCursor();
    }
    
    public String getFriendlyName() {
        return getFriendlyNameStatic();
    }

    public boolean hasChanged() {
        return changed;
    }
    
    public void setChanged(boolean flag) {
        changed = flag;
    }
    
    public void checkChanged() {
        if (this.hasChanged()) {
            this.setNewRootNode();
            this.setChanged(false);
        }
    }

    
    public static String getFriendlyNameStatic() {
        return name;
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        buttonPanel = new nl.astron.lofar.sas.otbcomponents.ButtonPanel();
        jPanelMain = new javax.swing.JPanel();
        jSplitPane = new javax.swing.JSplitPane();
        treePanel = new nl.astron.lofar.sas.otbcomponents.TreePanel();
        jPanelContents = new javax.swing.JPanel();
        jPanelFields = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jTextField6 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jTextField7 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jTextField8 = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jTextField9 = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jTextField10 = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        jTextField11 = new javax.swing.JTextField();

        setLayout(new java.awt.BorderLayout());

        buttonPanel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonPanelActionPerformed(evt);
            }
        });

        add(buttonPanel, java.awt.BorderLayout.SOUTH);

        jPanelMain.setLayout(new java.awt.BorderLayout());

        jSplitPane.setDividerLocation(250);
        jSplitPane.setLeftComponent(treePanel);

        jPanelContents.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));

        jPanelFields.setLayout(new java.awt.GridBagLayout());

        jLabel1.setText("Name");
        jLabel1.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel1, gridBagConstraints);

        jTextField1.setEditable(false);
        jTextField1.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField1, gridBagConstraints);

        jLabel2.setText("Index");
        jLabel2.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel2, gridBagConstraints);

        jTextField2.setEditable(false);
        jTextField2.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField2.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField2, gridBagConstraints);

        jLabel3.setText("Leaf");
        jLabel3.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel3, gridBagConstraints);

        jTextField3.setEditable(false);
        jTextField3.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField3.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField3, gridBagConstraints);

        jLabel4.setText("Instances");
        jLabel4.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel4, gridBagConstraints);

        jTextField4.setEditable(false);
        jTextField4.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField4.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField4, gridBagConstraints);

        jLabel5.setText("Limits");
        jLabel5.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel5, gridBagConstraints);

        jTextField5.setEditable(false);
        jTextField5.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField5.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField5, gridBagConstraints);

        jLabel6.setText("Description");
        jLabel6.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel6, gridBagConstraints);

        jTextField6.setEditable(false);
        jTextField6.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField6.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField6, gridBagConstraints);

        jLabel7.setText("TreeID");
        jLabel7.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel7, gridBagConstraints);

        jTextField7.setEditable(false);
        jTextField7.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField7.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField7, gridBagConstraints);

        jLabel8.setText("NodeID");
        jLabel8.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 7;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel8, gridBagConstraints);

        jTextField8.setEditable(false);
        jTextField8.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField8.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 7;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField8, gridBagConstraints);

        jLabel9.setText("ParentID");
        jLabel9.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 8;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel9, gridBagConstraints);

        jTextField9.setEditable(false);
        jTextField9.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField9.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 8;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField9, gridBagConstraints);

        jLabel10.setText("ParamDefID");
        jLabel10.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 9;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel10, gridBagConstraints);

        jTextField10.setEditable(false);
        jTextField10.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField10.setPreferredSize(new java.awt.Dimension(200, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 9;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField10, gridBagConstraints);

        jLabel11.setText("Path");
        jLabel11.setPreferredSize(new java.awt.Dimension(75, 15));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 10;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 0, 6);
        jPanelFields.add(jLabel11, gridBagConstraints);

        jTextField11.setEditable(false);
        jTextField11.setMinimumSize(new java.awt.Dimension(200, 19));
        jTextField11.setPreferredSize(new java.awt.Dimension(400, 19));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 10;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        jPanelFields.add(jTextField11, gridBagConstraints);

        jPanelContents.add(jPanelFields);

        jSplitPane.setRightComponent(jPanelContents);

        jPanelMain.add(jSplitPane, java.awt.BorderLayout.WEST);

        add(jPanelMain, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents

    private void buttonPanelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonPanelActionPerformed
        logger.debug("actionPerformed: " + evt);
        switch (evt.getActionCommand()) {
            case "New Tree":
            // initialize the tree
            // create a sample root node. This should be retrieved from the OTDB of course.
            jOTDBnode otdbNode = new jOTDBnode(0,0,0,0);
            otdbNode.name = "Node_" + treeCounter++;
            // put the OTDBnode in a wrapper for the tree
            TreeNode otdbTreeNode = new TreeNode(ResultTreeManager.getInstance(itsMainFrame.getUserAccount()),otdbNode);
            // and create a new root
            treePanel.newRootNode(otdbTreeNode);
                break;
            case "Back to Main":
            itsMainFrame.showPanel(MainPanel.getFriendlyNameStatic());
                break;
        }
    }//GEN-LAST:event_buttonPanelActionPerformed
    
    private MainFrame itsMainFrame;
    private boolean changed=false;
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private nl.astron.lofar.sas.otbcomponents.ButtonPanel buttonPanel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanelContents;
    private javax.swing.JPanel jPanelFields;
    private javax.swing.JPanel jPanelMain;
    private javax.swing.JSplitPane jSplitPane;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField10;
    private javax.swing.JTextField jTextField11;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    private javax.swing.JTextField jTextField7;
    private javax.swing.JTextField jTextField8;
    private javax.swing.JTextField jTextField9;
    private nl.astron.lofar.sas.otbcomponents.TreePanel treePanel;
    // End of variables declaration//GEN-END:variables
    
}
