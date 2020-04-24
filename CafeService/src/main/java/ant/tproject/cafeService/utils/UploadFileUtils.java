package ant.tproject.cafeService.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;

import ant.tproject.cafeService.cafe.BfileDto;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {

   static final int THUMB_WIDTH = 300;
   static final int THUMB_HEIGHT = 300;

   public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
         throws Exception {

      UUID uid = UUID.randomUUID();

      String newFileName = uid + "_" + fileName;
      String imgPath = uploadPath + ymdPath;

      File target = new File(imgPath, newFileName);
      FileCopyUtils.copy(fileData, target);

      String thumbFileName = "s_" + newFileName;
      File image = new File(imgPath + File.separator + newFileName);

      File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

      if (image.exists()) {
         thumbnail.getParentFile().mkdirs();
         Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
      }
      return newFileName;
   }
   //cafe 글쓰기 파일 업로드 썸네일 부분만 지웠습니다.
   public static String fileUploadBoard(String uploadPath, String fileName, byte[] fileData, String ymdPath)
         throws Exception {

      UUID uid = UUID.randomUUID();

      String newFileName = uid + "_" + fileName;
      String boardPath = uploadPath + ymdPath;

      File target = new File(boardPath, newFileName);
      FileCopyUtils.copy(fileData, target);
      return newFileName;
   }
   public static String calcPath(String uploadPath) {
      Calendar cal = Calendar.getInstance();
      String yearPath = File.separator + cal.get(Calendar.YEAR);
      String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
      String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

      makeDir(uploadPath, yearPath, monthPath, datePath);
      makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

      return datePath;
   }
   //썸네일 폴더는 따로 필요없어서 makeDir 한줄삭제햇습니다.
   public static String calcPathBoard(String uploadPath) {
      Calendar cal = Calendar.getInstance();
      String yearPath = File.separator + cal.get(Calendar.YEAR);
      String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
      String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

      makeDir(uploadPath, yearPath, monthPath, datePath);

      return datePath;
   }
   private static void makeDir(String uploadPath, String... paths) {

      if (new File(paths[paths.length - 1]).exists()) {
         return;
      }

      for (String path : paths) {
         File dirPath = new File(uploadPath + path);

         if (!dirPath.exists()) {
            dirPath.mkdir();
         }
      }
   }
   
   public static void downloadFile(String uploadPath, BfileDto bfileDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
       	String ymdPath = bfileDto.getCreadtm();
	    File file = new File(uploadPath+ymdPath, bfileDto.getStoredname());
	    BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
	 
	    //User-Agent : 어떤 운영체제로  어떤 브라우저를 서버( 홈페이지 )에 접근하는지 확인함
	    String header = request.getHeader("User-Agent");
	    String fileName;
	    
	    if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
	        //인터넷 익스플로러 10이하 버전, 11버전, 엣지에서 인코딩 
	        fileName = URLEncoder.encode(bfileDto.getOriginalname(), "UTF-8");
	    } else {
	        //나머지 브라우저에서 인코딩
	        fileName = new String(bfileDto.getOriginalname().getBytes("UTF-8"), "iso-8859-1");
	    }
	    //형식을 모르는 파일첨부용 contentType
	    response.setContentType("application/octet-stream");
	    //다운로드와 다운로드될 파일이름
	    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
	    //파일복사
	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
   }
   
}