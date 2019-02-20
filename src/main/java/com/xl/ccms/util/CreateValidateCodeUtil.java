package com.xl.ccms.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class CreateValidateCodeUtil {
	// ͼƬ�Ŀ�ȡ�
	private int width = 160;
	// ͼƬ�ĸ߶ȡ�
	private int height = 40;
	// ��֤���ַ����
	private int codeCount = 4;
	// ��֤���������
	private int lineCount = 20;
	// ��֤��
	private String code = null;
	// ��֤��ͼƬBuffer
	private BufferedImage buffImg = null;
	Random random = new Random();

	public CreateValidateCodeUtil() {
		creatImage();
	}

	public CreateValidateCodeUtil(int width, int height) {
		this.width = width;
		this.height = height;
		creatImage();
	}

	public CreateValidateCodeUtil(int width, int height, int codeCount) {
		this.width = width;
		this.height = height;
		this.codeCount = codeCount;
		creatImage();
	}

	public CreateValidateCodeUtil(int width, int height, int codeCount, int lineCount) {
		this.width = width;
		this.height = height;
		this.codeCount = codeCount;
		this.lineCount = lineCount;
		creatImage();
	}

	// ���ͼƬ
	private void creatImage() {
		int fontWidth = width / codeCount;// ����Ŀ��
		int fontHeight = height - 5;// ����ĸ߶�
		int codeY = height - 8;

		// ͼ��buffer
		buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = buffImg.getGraphics();
		// Graphics2D g = buffImg.createGraphics();
		// ���ñ���ɫ
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);

		// ��������
		// Font font1 = getFont(fontHeight);
		Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		g.setFont(font);

		// ���ø�����
		for (int i = 0; i < lineCount; i++) {
			int xs = random.nextInt(width);
			int ys = random.nextInt(height);
			int xe = xs + random.nextInt(width);
			int ye = ys + random.nextInt(height);
			g.setColor(getRandColor(1, 255));
			g.drawLine(xs, ys, xe, ye);
		}

		// ������
		float yawpRate = 0.01f;// ������
		int area = (int) (yawpRate * width * height);
		for (int i = 0; i < area; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);

			buffImg.setRGB(x, y, random.nextInt(255));
		}

		String str1 = randomStr(codeCount);// �õ�����ַ�
		this.code = str1;
		for (int i = 0; i < codeCount; i++) {
			String strRand = str1.substring(i, i + 1);
			g.setColor(getRandColor(1, 255));
			// g.drawString(a,x,y);
			// aΪҪ�������Ķ�����x��y��ʾҪ���Ķ���������ַ�Ļ���λ�ڴ�ͼ�����������ϵ�� (x, y) λ�ô�

			g.drawString(strRand, i * fontWidth + 3, codeY);
		}

	}

	// �õ�����ַ�
	private String randomStr(int n) {
		String str1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		String str2 = "";
		int len = str1.length() - 1;
		double r;
		for (int i = 0; i < n; i++) {
			r = (Math.random()) * len;
			str2 = str2 + str1.charAt((int) r);
		}
		return str2;
	}

	// �õ������ɫ
	private Color getRandColor(int fc, int bc) {// ��Χ��������ɫ
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * �����������
	 */
	private Font getFont(int size) {
		Random random = new Random();
		Font font[] = new Font[5];
		font[0] = new Font("Ravie", Font.PLAIN, size);
		font[1] = new Font("Antique Olive Compact", Font.PLAIN, size);
		font[2] = new Font("Fixedsys", Font.PLAIN, size);
		font[3] = new Font("Wide Latin", Font.PLAIN, size);
		font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, size);
		return font[random.nextInt(5)];
	}

	// Ť��
	private void shear(Graphics g, int w1, int h1, Color color) {
		shearX(g, w1, h1, color);
		shearY(g, w1, h1, color);
	}

	private void shearX(Graphics g, int w1, int h1, Color color) {

		int period = random.nextInt(2);

		boolean borderGap = true;
		int frames = 1;
		int phase = random.nextInt(2);

		for (int i = 0; i < h1; i++) {
			double d = (double) (period >> 1)
					* Math.sin((double) i / (double) period
							+ (6.2831853071795862D * (double) phase)
							/ (double) frames);
			g.copyArea(0, i, w1, 1, (int) d, 0);
			if (borderGap) {
				g.setColor(color);
				g.drawLine((int) d, i, 0, i);
				g.drawLine((int) d + w1, i, w1, i);
			}
		}

	}

	private void shearY(Graphics g, int w1, int h1, Color color) {

		int period = random.nextInt(40) + 10; // 50;

		boolean borderGap = true;
		int frames = 20;
		int phase = 7;
		for (int i = 0; i < w1; i++) {
			double d = (double) (period >> 1)
					* Math.sin((double) i / (double) period
							+ (6.2831853071795862D * (double) phase)
							/ (double) frames);
			g.copyArea(i, 0, 1, h1, 0, (int) d);
			if (borderGap) {
				g.setColor(color);
				g.drawLine(i, (int) d, i, 0);
				g.drawLine(i, (int) d + h1, i, h1);
			}
		}
	}

	public void write(OutputStream sos) throws IOException {
		ImageIO.write(buffImg, "png", sos);
		sos.close();
	}

	public BufferedImage getBuffImg() {
		return buffImg;
	}

	public String getCode() {
		return code.toLowerCase();
	}

	// ʹ�÷�������Servlet�����������룩
	// CreateValidateCode vCode = new CreateValidateCode(100, 30, 5, 10);
	// session.setAttribute("code", vCode.getCode()); //������Session������
	// vCode.write(response.getOutputStream());
	
}
