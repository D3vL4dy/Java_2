package kr.or.ddit.basic.fileupload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 * - 서블릿 버전 3.0이상에서 파일 업로드를 하려면 서블릿에 @MultipartConfig 애노테이션을 설정해야 한다.
 *   
 *   @MultipartConfig 애노테이션에 설정할 변수
 *   - location : 업로드할 파일이 임시적으로 저장될 경로 지정(기본값 : "")
 *   - fileSizeThreshold : 파일 크기가 이 속성에 지정한 크기를 넘어가면 location에 지정한 디렉토리에 임시로 저장한다.
 *                         (단위 : byte, 기본값 : 0 (무조건 임시디렉토리에 저장))
 *   - maxFileSize : 1개의 파일의 최대 크기(단위 : byte, 기본값 : -1L(무제한))
 *   - maxRequestSize : 서버로 전송되는 request의 최대 크기
 *                     (파라미터데이터 + 파일 데이터)
 *                     (단위 : byte, 기본값 : -1L(무제한))
 */
@WebServlet("/fileuploadTest.do")
@MultipartConfig(
      fileSizeThreshold = 1024 * 1024 * 10,
      maxFileSize = 1024 * 1024 * 30,
      maxRequestSize = 1024 * 1024 * 50
)
public class FileuploadTest extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      // 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
      String uploadPath = "d:/d_other/uploadFiles";
      
      // 저장될 폴더가 없으면 생성한다.
      File fdir = new File(uploadPath);
      if(!fdir.exists()) {
         fdir.mkdirs();
      }
      
      // 파일이 아닌 일반 파라미터 데이터는 getParameter()메서드를 이용해서 구한다.
      String userName = request.getParameter("userName");
      System.out.println("일반 파라미터 데이터 : " + userName);
      
      String fileName = ""; // 파일명이 저장될 변수명
      
      // Upload한 파일 목록이 저장될 List 선언
      List<FileInfo> fileList = new ArrayList<FileInfo>();
      
      /*
       * - 서블릿 3.0이상에 새롭게 추가된 Upload용 메서드
       * 1) request.getParts(); ==> 전체 Part객체가 저장된 컬렉션이 반환된다.
       * 2) request.getPart("part이름"); ==> 지정한 이름에 맞는 Part객체를 반환한다.
       */
      
      // 전체 Part객체 갯수만큼 반복
      for(Part part : request.getParts()) {
         // 1개의 업로드 파일 정보를 구한다.
         fileName = extractFileName(part);
         
         // 파일명이 공백("")이면 이것은 일반 파라미터 데이터란 의미이다.
         if(!"".equals(fileName)) {
            FileInfo finfo = new FileInfo();
            
            finfo.setFileName(fileName);
            finfo.setFileSize((int)Math.ceil(part.getSize() / 1024.0)); // Math.ceil 소숫점 무조건 올림해주는 메서드
            
            try {
               // Upload된 파일을 서버쪽 저장장소에 저장한다.
               part.write(uploadPath + File.separator + fileName);
               finfo.setStatus("Success");
            } catch (IOException e) {
               finfo.setStatus("Fail : " + e.getMessage());
            }
            
            fileList.add(finfo); // 파일 정보를 List에 추가
         }      
      }
      // 파일 처리 작업 완료...
      
      request.setAttribute("userName", userName);
      request.setAttribute("fileList", fileList);
      
      request.getRequestDispatcher("/basic/upload/uploadFileList.jsp").forward(request, response);
   }
   
   // Part객체에서 파일명을 찾아서 반환하는 메서드
   
   /*
    * Part 구조
    * 1) 파일 아닐 경우
    * ---------------sdfwef123246516             ==> 구분선
    * Content-Disposition: form-data; name="age" ==> 파라미터명
    *                                            ==> 빈줄
    * 30                                         ==> 파라미터값                                           
    */
   
   /*
    * 2) 파일일 경우
    * ---------------sdfwef123246516             ==> 구분선
    * Content-Disposition: form-data; name="uploadfile"; filename="test1.txt" ==> 파라미터명
    *                                            ==> 빈줄
    * abcd1234%^&**                              ==> 파일내용                                           
    */
   private String extractFileName(Part part) {
      String fileName = "";
      
      // 각 Part의 Content-Disposition의 값 구하기
      String contentDisposition = part.getHeader("Content-Disposition");
      String[] items = contentDisposition.split(";");
      
      for(String item : items) {
         // 파일 정보 찾기
         if(item.trim().startsWith("filename")) {
            // filename="test1.txt"
            fileName = item.substring(item.indexOf("=")+2, item.length()-1);
         }
      }
      
      return fileName;
   }

}