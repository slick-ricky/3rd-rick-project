package com.cafe.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	

	// 파일 업로드 (저장 경로,원본 파일 이름,파일 데이터) 필요 요소 세가지 
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() +"_"+originalName;
		String savedPath = calcPath(uploadPath);


		File target = new File(uploadPath +savedPath,savedName);
		FileCopyUtils.copy(fileData, target);

		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;

		if(MediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else{
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		return uploadedFileName;
	}

	// 이미지 타입의 파일인 경우 썸네일 생성, 아닌 경우 실행 문자열의 치환 용도에 불과
	private static String makeIcon(String uploadPath, String path, String fileName)throws Exception{
		String iconName = uploadPath + path + File.separator+ fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 썸네일 생성
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = 
				Scalr.resize(sourceImg, 
						Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT,100);

		String thumbnailName = uploadPath + path + File.separator +"s_"+ fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 년/월/일 폴더 생성,파일저장
	// 작성된 calcPath()의 리턴 값은 최종 결과 폴더를 반환하는데,
	// 내부적으로 폴더를 생성해 주는 기능이 필요하기 때문에 기본적인 경로 uploadPath를 파라미터로 전달 받는다.

	private static String calcPath(String uploadPath){
	    Calendar cal = Calendar.getInstance();

	    String yearPath = File.separator+cal.get(Calendar.YEAR);
	    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
	    String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

	    // 얻어낸 날짜 정보는 기본 경로롸 함께 makeDir()에 전달되어 폴더가 생성된다.
	    makeDir(uploadPath,yearPath,monthPath,datePath);

	    logger.info(datePath);

	    return datePath;
	}

	//폴더 생성
	private static void makeDir(String uploadPath, String... paths){
		if(new File(uploadPath + paths[paths.length-1]).exists()){
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if(! dirPath.exists() ){
				dirPath.mkdir();
			}
		}
	}
}
