import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.LayoutManager;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/*
 * Graphics Tester - Eric McCreath 2012,2014
 * 
 * Just a simple program for testing simple graphics commands for
 * and rPeANUt assignment.  It can: create command lists and dumps;
 *  view a dump file; and also view and compare 2 dump files.
 * 
 * Uses GraphicsView.java
 * 
 * to compile:
 *   javac GraphicsTester.java
 * 
 * to run:
 *   java GraphicsTester
 * 
 */


public class GraphicsTester implements ActionListener, LayoutManager {
    JFrame jf;
	GraphicsView vv;
	String commands;
    JButton rbut, sbut, lbut;
    JFileChooser jfcs;
    JLabel info;
    JTextField fname1, fname2;
    
    static final String infostr = "<html><h1>Graphics Tester</h1> " +
    		"Click the mouse to draw a point. <br>" +
    		"Drag the mouse to draw a line. <br>" +
    		"Drag while holding 'ctrl' to draw a box. <br>" +
    		"Reset clears the screen. <br>" +
    		"Save will save both the dump of what is <br> drawn and the commands for drawing it. <br>" +
    		"Load will load one or two dump files given <br>in the text fields (this also resets the screen).<html>";
	
	
	
	public void  reset() {
		commands = "";
		vv.reset();
	}
    
    public GraphicsTester() {
	   jf = new JFrame("rPeANUt Graphics Tester");
	   jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	   vv = new GraphicsView(this);
	   JPanel mp = new JPanel();
	   mp.setLayout(this);
	   rbut = new JButton("Reset");
	   rbut.addActionListener(this);
	   mp.add(vv);
	   mp.add(rbut);
	   sbut = new JButton("Save");
	   sbut.addActionListener(this);
	   mp.add(sbut);
	   
	   lbut = new JButton("Load");
	   lbut.addActionListener(this);
	   mp.add(lbut);
	   
	   info = new JLabel(infostr);
	   mp.add(info);
	   reset();
	   
	   fname1 = new JTextField();
	   mp.add(fname1);
	   
	   fname2 = new JTextField();
	   mp.add(fname2);
	   
	   
	   jfcs = new JFileChooser(".");
	   jf.getContentPane().add(mp);
	   jf.setVisible(true);
	   jf.pack();
    }
    public static void main(String[] args) {
		new GraphicsTester();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == rbut) {
			reset();
		} else if (e.getSource() == sbut) {
		    System.out.println(commands);    
		    System.out.println(vv.dump());
		    int res = jfcs.showSaveDialog(jf);
	        if (res == JFileChooser.APPROVE_OPTION) {
	        	File file = jfcs.getSelectedFile();
	        	save(file.getPath() + ".commands", commands + "h");
	        	save(file.getPath() + ".dump", vv.dump());
					
					
				
	        }
		 
		} else if (e.getSource() == lbut) {
	        reset();
	        try {
				Scanner f1s = new Scanner(new File (fname1.getText()));
				vv.load(f1s,2);
			} catch (FileNotFoundException e1) {
			}
			try {
				Scanner f2s = new Scanner(new File (fname2.getText()));
				vv.load(f2s,4);
			} catch (FileNotFoundException e1) {
			}
		}
	}
private void save(String name, String cont) {
	PrintWriter pr;
	try {
		pr = new PrintWriter(new File(name));
		pr.append(cont);
		pr.close();
	} catch (FileNotFoundException e) {
		System.out.println("Problem Save " );
	}
}
	
	public void addcommand(String f) {
		commands += f;
	}

	
	public void layoutContainer(Container c) {
		Rectangle b = c.getBounds();
		Dimension vvp = vv.getPreferredSize();
		Dimension infop = info.getPreferredSize();
		Dimension rbutp = rbut.getPreferredSize();
		Dimension sbutp = sbut.getPreferredSize();
		Dimension lbutp = lbut.getPreferredSize();
		Dimension fname1p = fname1.getPreferredSize();
		Dimension fname2p = fname2.getPreferredSize();
			
		
		vv.setLocation(0, 0);
		vv.setSize(vvp.width, vvp.height);
		
		
		info.setLocation(vvp.width,0);
		info.setSize(infop.width,infop.height);
		
		rbut.setLocation(vvp.width,infop.height);
		rbut.setSize(rbutp.width,rbutp.height);
		
		sbut.setLocation(vvp.width + rbutp.width,infop.height);
		sbut.setSize(sbutp.width,sbutp.height);
		
		
		lbut.setLocation(vvp.width + rbutp.width + sbutp.width,infop.height);
		lbut.setSize(lbutp.width,lbutp.height);
		
		
		fname1.setLocation(vvp.width,infop.height + rbutp.height);
		fname1.setSize(vvp.width,fname1p.height);
		
		fname2.setLocation(vvp.width,infop.height + rbutp.height + fname1p.height);
		fname2.setSize(vvp.width,fname1p.height);
		
		
		
		
	}

	public Dimension minimumLayoutSize(Container c) {
		Dimension vvm = vv.getPreferredSize();
		Dimension infom = info.getPreferredSize();
		return new Dimension(vvm.width+infom.width,vvm.height);
	}

	public Dimension preferredLayoutSize(Container c) {
		Dimension vvm = vv.getPreferredSize();
		Dimension infom = info.getPreferredSize();
		return new Dimension(vvm.width+infom.width,vvm.height);
	}
	
	
	@Override
	public void addLayoutComponent(String arg0, Component arg1) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public void removeLayoutComponent(Component arg0) {
		// TODO Auto-generated method stub
		
	}
}
