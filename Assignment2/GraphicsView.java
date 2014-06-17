import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.util.Scanner;

import javax.swing.JComponent;

/*
 * Graphics View - Eric McCreath 2012,2014
 * 
 * 
 * 
 */


public class GraphicsView extends JComponent implements MouseMotionListener,
		MouseListener {

	static final int width = 192;
	static final int height = 160;

	int fb[][];
	GraphicsTester gt;

	Integer dsx, dsy;

	public GraphicsView(GraphicsTester gt) {
		this.gt = gt;
		fb = new int[width][height];
		this.setPreferredSize(new Dimension(width * 3, height * 3));
		this.addMouseMotionListener(this);
		this.addMouseListener(this);
		dsx = null;
		dsy = null;
	}

	@Override
	public void paint(Graphics g) {
		g.setColor(Color.black);
		g.fillRect(0, 0, width * 3, height * 3);
		g.setColor(Color.white);
		for (int j = 0; j < height; j++) {
			for (int i = 0; i < width; i++) {
				if ((fb[i][j] & 1) == 1) {
					g.setColor(Color.white);
					g.fillRect(i * 3, j * 3, 3, 3);
				} 
				if ((fb[i][j] & 2) == 2) {
					g.setColor(Color.green);
					g.fillRect(i * 3, j * 3, 3, 3);
				} 
				if ((fb[i][j] & 4) == 4) {
					if ((fb[i][j] & 2) == 2) {
					   g.setColor(Color.red);
					   g.fillRect(i * 3, j * 3, 3, 3);
					} else {
						g.setColor(Color.blue);
						g.fillRect(i * 3, j * 3, 3, 3);
					}
				} 
				
			}
		}
	}

	public void reset() {
		for (int j = 0; j < height; j++) {
			for (int i = 0; i < width; i++) {
				fb[i][j] = 0;

			}
		}
		repaint();
	}

	@Override
	public void mouseDragged(MouseEvent e) {

		if (dsx == null) {
			dsx = e.getX();
			dsy = e.getY();
		}
	}

	@Override
	public void mouseMoved(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseClicked(MouseEvent m) {
		int x = m.getX() / 3;
		int y = m.getY() / 3;

		fb[x][y] = 1;
		gt.addcommand(String.format("p%02x%02x", x, y));
		this.repaint();

	}

	@Override
	public void mouseEntered(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {

		if (dsx != null) {

			int nx = e.getX();
			int ny = e.getY();
			if (e.isControlDown()) {
				int rx = Math.min(dsx / 3, nx / 3);
				int ry = Math.min(dsy / 3, ny / 3);
				int rw = Math.abs(dsx / 3 - nx / 3) + 1;
				int rh = Math.abs(dsy / 3 - ny / 3) + 1;

				drawrect(rx, ry, rw, rh);
				gt.addcommand(String
						.format("r%02x%02x%02x%02x", rx, ry, rw, rh));
			} else {
				drawline(dsx / 3, dsy / 3, nx / 3, ny / 3);
				gt.addcommand(String.format("l%02x%02x%02x%02x", dsx / 3,
						dsy / 3, nx / 3, ny / 3));
			}
			dsx = null;
			dsy = null;
			this.repaint();
		}
	}

	private void drawrect(int x0, int y0, int w, int h) {
		for (int i = 0; i < h; i++) {
			for (int j = 0; j < w; j++) {
				fb[j + x0][i + y0] = 1;
			}
		}
	}

	private void drawline(int x0, int y0, int x1, int y1) {
		// TODO Auto-generated method stub
		int dx = Math.abs(x1 - x0);
		int dy = Math.abs(y1 - y0);
		int sx = (x0 < x1 ? 1 : -1);
		int sy = (y0 < y1 ? 1 : -1);
		int err = dx - dy;

		while (true) {
			fb[x0][y0] = 1;

			if (x0 == x1 && y0 == y1)
				return;
			int e2 = 2 * err;
			if (e2 > -dy) {
				err = err - dy;
				x0 = x0 + sx;
			}
			if (e2 < dx) {
				err = err + dx;
				y0 = y0 + sy;
			}
		}

	}

	public String dump() {
		StringBuffer sb = new StringBuffer();
		int wordsPerLine = width / 32;
		for (int y = 0; y < height; y++) {
			sb.append(y);
			for (int x = 0; x < wordsPerLine; x++) {
				int value = 0;
				for (int b = 0; b < 32; b++) {
					if ((fb[x * 32 + b][y] & 1) == 1) {
						value |= 1 << b;
					}
				}

				sb.append(":");
				sb.append(String.format("%08x", value));
			}
			sb.append("\n");
		}
		return sb.toString();
	}

	public void load(Scanner f1s, int i) {
		int wordsPerLine = width / 32;
		for (int y = 0; y < height; y++) {
			String line = f1s.nextLine();
			String bits[] = line.split(":");
			
			for (int x = 0; x < wordsPerLine; x++) {
				long lword = Long.parseLong(bits[x+1],16);
				
				
				
				
				for (int b = 0; b < 32; b++) {
					if (((lword>>b) & 1) == 1) {
						fb[x * 32 + b][y] |= i;
					}
					

				}
			}
			
		}
	}

	public int mark(int outof) {
		
		int wrong = 0;
		int pt = 0;
		
		int wordsPerLine = width / 32;
		for (int y = 0; y < height; y++) {
			
			
			for (int x = 0; x < wordsPerLine; x++) {
				
				
				for (int b = 0; b < 32; b++) {
					if ((fb[x * 32 + b][y] & 1) == 1  ) pt++;
					if (fb[x * 32 + b][y] == 1 || fb[x * 32 + b][y] == 2) wrong++;

				}
			}
			
		}
		System.out.println(wrong + " pixels wrong of " + pt + " expected to be drawn.");
		if (wrong == 0) return outof;
		if (pt == 0) return Math.max(0, ((outof-1) *(100-wrong))/100);
		if (wrong >= pt) return 0;
		return Math.max(0,(int) (((pt-wrong) * (outof-1)) /pt));
		
	}
}
