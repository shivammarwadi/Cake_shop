package com.cake.shop.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class helper {
	public static boolean deleteFile(String path)
	{
		boolean f=false;
		try
		{
			File file=new File(path);
			f=file.delete();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public static boolean saveImage(InputStream is,String path)
	{
		boolean f=false;
		try 
		{
			byte b[]=new byte[is.available()];
			b=is.readAllBytes();
			
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			  f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}
