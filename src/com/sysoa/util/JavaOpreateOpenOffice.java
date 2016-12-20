package com.sysoa.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import com.jfinal.kit.PropKit;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年12月12日 下午12:00:35
 * @version 1.0
 * @parameter
 * @since
 * @return 功能：开启openoffice服务 使用方法：直接生成该类对象
 */
@SuppressWarnings("unused")
public class JavaOpreateOpenOffice {

	public static void JavaCallOpenOffice() {
		Process process = null;
		try {
			String cmd = PropKit.use("OpenOfficeService.properties").get("OO_HOME")
					+ "\\program\\soffice.exe -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\"";
			process = Runtime.getRuntime().exec(cmd);
			System.out.println("openoffice正常启动.......");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("resource")
	public static void DistorySoffice() {
		Process process = null;
		try {
			// 显示进程
			process = Runtime.getRuntime().exec("tasklist");
			Scanner in = new Scanner(process.getInputStream());
			while (in.hasNextLine()) {
				String processString = in.nextLine();
				if (processString.contains("soffice.exe")) {
					// 关闭soffice进程的命令
					String cmd = "taskkill /f /im soffice.exe";
					process = Runtime.getRuntime().exec(cmd);
					System.out.println("openoffice正常关闭.......");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		DistorySoffice();
		// JavaCallOpenOffice();
	}
}
