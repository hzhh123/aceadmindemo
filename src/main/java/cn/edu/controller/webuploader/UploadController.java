package cn.edu.controller.webuploader;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

import cn.edu.common.base.BaseController;
import cn.edu.utils.file.FileUtil;

@Controller
public class UploadController extends BaseController{

	@RequestMapping("/upload")
	public void addFile(HttpServletRequest request,
			HttpServletResponse response)
			throws IllegalStateException, IOException {
		//String uid=request.getParameter("uid");//获取uid
		//String pid=request.getParameter("pid");//获取jsp id参数
		//System.out.println(uid);
		//System.out.println(pid);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// int pre = (int) System.currentTimeMillis();//开始时时间
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					String myFileName = file.getOriginalFilename();
					if (myFileName.trim() != "") {
						String fileName = file.getOriginalFilename();
						String fileExt = fileName.substring(
								fileName.lastIndexOf(".") + 1).toLowerCase();
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyyMMddHHmmss");
						String newFileName = df.format(new Date());
						String fileNames = newFileName
								+ new Random().nextInt(1000) + "." + fileExt;
						 String path = "d:/" + fileNames;//上传路径
						// String path =
						// request.getSession().getServletContext()
						// .getRealPath("/resources/contractImgs")
						// + "/" + fileNames;
						File localFile = new File(path);
						if (!localFile.exists()) {// 如果文件夹不存在，自动创建
							localFile.mkdirs();
						}
						file.transferTo(localFile);
					}
				}
			}
			
		}
	}
	
	/**
     * 单个文件同步接口
     * 分片文件上传
     * @param request
     * @return
     * @throws JsonGenerationException
     * @throws JsonMappingException
     * @throws IOException
     */
    @RequestMapping(value = "/test-sync/sync",method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String sync(
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request, HttpServletResponse response)
            throws JsonGenerationException, JsonMappingException, IOException {


        if (request.getParameter("chunk") == null) {

            String realPath = request.getSession().getServletContext()
                    .getRealPath("/upload/");
            String fileName = file.getOriginalFilename();

            File targetFile = new File(realPath, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            file.transferTo(targetFile); // 小文件，直接拷贝

            return "";
        } else {
            int chunk = Integer.parseInt(request.getParameter("chunk")); // 当前分片
            int chunks = Integer.parseInt(request.getParameter("chunks")); // 分片总计
            String realPath = request.getSession().getServletContext()
                    .getRealPath("/upload/");
            System.out.println(chunks);
            String Ogfilename = file.getOriginalFilename();

            File tempFile = new File(realPath, Ogfilename);
            OutputStream outputStream = new FileOutputStream(tempFile, true);
            InputStream inputStream = file.getInputStream();

            byte buffer[] = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            inputStream.close();
            outputStream.close();

            return "";
        }
    }
    @ResponseBody
    @RequestMapping("/upload3")
    public Object upload3(HttpServletRequest request)
            throws IllegalStateException, IOException {
        // 获取上下文，解析request
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getServletContext());
        // 检测Form表单是否有multipart/form-data
        if (multipartResolver.isMultipart(request)) {
            // 将request变为多部分MultipartHttpServletRequest
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            // 遍历上传文件
            Iterator<String> it = multipartRequest.getFileNames();
            while (it.hasNext()) {
                // 以文件名获取上传文件
                MultipartFile multipartFile = multipartRequest
                        .getFile(it.next());
                if (multipartFile != null) {
                    String fileName = multipartFile.getOriginalFilename();
                    System.out.println("上传文件原名：" + fileName);
                    String dir="E://";
                    File targetFile=getTargetFile(dir, fileName);
                    multipartFile.transferTo(targetFile);
 
                }
            }
        }
        return renderSuccess("上传成功！");
    }
    
    @ResponseBody
    @RequestMapping("/upload4")
    public Object upload4(HttpServletRequest request)
            throws IllegalStateException, IOException {
    	Map<String,Object>map=new HashMap<String,Object>();
        // 获取上下文，解析request
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getServletContext());
        // 检测Form表单是否有multipart/form-data
        if (multipartResolver.isMultipart(request)) {
            // 将request变为多部分MultipartHttpServletRequest
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            // 遍历上传文件
            Iterator<String> it = multipartRequest.getFileNames();
            while (it.hasNext()) {
                // 以文件名获取上传文件
                MultipartFile multipartFile = multipartRequest
                        .getFile(it.next());
                if (multipartFile != null) {
                    String fileName = multipartFile.getOriginalFilename();
                    String realPath = request.getSession().getServletContext()
                            .getRealPath("/upload/");
                    File targetFile=getTargetFile(realPath, fileName);
                    multipartFile.transferTo(targetFile);
                    map.put("url", "/upload/"+fileName);
 
                }
            }
        }
        return renderSuccess("上传成功！",map);
    }
    //获取上传文件类型,fileName:上传文件原名，如a.txt
    public String getFileType(String fileName){
        return fileName.substring(fileName.lastIndexOf('.') + 1, fileName.length());
    }
    /**
     * 功能：以某种格式修改上传后的文件名
     * @param dir 上传文件保留的根目录
     * @param fileName 上传文件原名
     * @return
     */
    public File getTargetFile(String dir,String fileName){
        File dirFie=new File(dir);
        if(!dirFie.exists()){
            dirFie.mkdirs();
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
        String prefix = format.format(new Date());
        String childpath=prefix+fileName;
        File targetFile=new File(dirFie, childpath);
        return targetFile;
    }
    
    
    //文件打包下载
    @RequestMapping("/download")
    public void download(HttpServletResponse response) throws Exception {
    	List<File>files=new ArrayList<File>();
    	files.add(new File("d:/11.jpg"));
    	files.add(new File("d:/sougou.jpg"));
    	String zipFilePath="d:/create.rar";
    	FileUtil.downLoadFiles(files,response,zipFilePath);
    }
}
