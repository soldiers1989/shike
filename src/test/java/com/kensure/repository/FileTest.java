package com.kensure.repository;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import co.kensure.io.FileUtils;
import co.kensure.mem.DateUtils;

public class FileTest {

	@Test
	public void test() {
		String path = "E:\\workspaces\\eclipse1\\shike\\src\\main\\webapp";
//		String path = "E:\\workspaces\\eclipse1\\shike\\target\\classes";
//		String path = "E:\\workspaces\\eclipse0\\nbws\\webapp";

		String tartpath = "E:\\workspaces\\eclipse2";
		Date date = DateUtils.parse("2019-02-22 00:00:00", DateUtils.DATE_FORMAT_PATTERN);
		List<String> list = new ArrayList<String>();
		getList(path, date, list);
		for (String filepath : list) {		
			File sourceFile = new File(filepath);
			filepath = filepath.replace(path, tartpath);
			File targetFile = new File(filepath);
			try {
				String fold = filepath.substring(0, filepath.lastIndexOf("\\"));			
				FileUtils.createDir(fold);
				FileUtils.copyFile(sourceFile, targetFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(filepath);
		}

	}

	private void getList(String path, Date date, List<String> list) {
		String[] childs = FileUtils.getChildList(path);
		for (String child : childs) {
			String filepath = path + "\\" + child;
			File file = new File(filepath);
			if (file.isDirectory()) {
				getList(filepath, date, list);
			} else {
				if (file.lastModified() >= date.getTime()) {
					list.add(filepath);
				}
			}
		}

	}

}
