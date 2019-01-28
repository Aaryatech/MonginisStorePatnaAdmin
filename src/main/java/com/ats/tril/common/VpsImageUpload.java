package com.ats.tril.common;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VpsImageUpload {
	
	//public static final String FR_FOLDER = "/home/ats-12/";
	//public static final String FLOUR_MAP= "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/FLOURMAP/";
	//public static final String Item_Image= "C:/pdf/";
	//public static final String Item_Image= "/opt/tomcat-latest/webapps/mongistoreuploads/";
	
	public static final String Item_Image= "/home/devour/apache-tomcat-9.0.12/webapps/mongistoreuploads/";
	//public static final String Item_Image= "/home/aaryate1/tomcat.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/Item/";
	public static final String SPONSOR_FOLDER = "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/SPONSOR/";

	public static final String GALLARY_FOLDER = "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/GALLARY/";
	
	public static final String LOGO_FOLDER = "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/LOGO/";
	
	public static final String EXHIBITOR_FOLDER = "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/EXHIBITOR/";

	public static final String EVENT_FOLDER = "/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/EVENT/";
	
	public static final String MEMBER_FOLDER="/home/aaryate1/exhibition.aaryatechindia.in/tomcat-8.0.18/webapps/uploads/MEMBER/";

	private static final String FIELDMAP_FOLDER = null;
	private static final String KYC_FOLDER = null;

	private static String curTimeStamp = null;

	public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName) throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = Paths.get(Item_Image + imageName);

			byte[] bytes = file.getBytes();

			if (imageType == 1) {
				System.out.println("Inside Image Type =1");

				path = Paths.get(Item_Image + imageName);

				System.out.println("Path= " + path.toString());

			} else if (imageType == 2) {

				path = Paths.get(SPONSOR_FOLDER + imageName);

			} else if (imageType == 3) {

				path = Paths.get(GALLARY_FOLDER + imageName);

			}else if (imageType == 4) {

				path = Paths.get(LOGO_FOLDER + imageName);

			}
			else if (imageType ==5) {

				path = Paths.get(EXHIBITOR_FOLDER + imageName);

			}

			else if (imageType ==6) {

				path = Paths.get(EVENT_FOLDER + imageName);

			}
			else if (imageType == 7) {

				path = Paths.get(MEMBER_FOLDER + imageName);

			}

			Files.write(path, bytes);

		}

	}

}
