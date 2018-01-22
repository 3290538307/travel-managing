package com.etc.utils;

import java.io.File;

public class DeleteFile {
	private static final String path="E:\\Web\\travel\\WebContent\\client\\images\\";
	public static void deleteFile(String filename){
		new File(path+filename).delete();
	}

}
