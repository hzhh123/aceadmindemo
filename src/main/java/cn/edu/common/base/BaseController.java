package cn.edu.common.base;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.edu.utils.Charsets;
import cn.edu.utils.StringEscapeEditor;
import cn.edu.utils.URLUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.baomidou.mybatisplus.plugins.Page;

import cn.edu.common.result.PageInfo;
import cn.edu.common.result.Result;

/**
*@author 何志华
*@time 创建时间：2017年10月12日下午9:47:22
**/

public abstract class BaseController {
	/**
	 * Logger for this class
	 */
	protected Logger logger = LogManager.getLogger(getClass());
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		//自动转换日期字段
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"),true));
		//防止XSS攻击
		binder.registerCustomEditor(String.class, new StringEscapeEditor());
	}
	
	/**
	 * ajax失败
	 * @param msg 失败消息
	 * @return
	 */
	public Object renderError(String msg) {
		Result result=new Result();
		result.setMsg(msg);
		result.setSuccess(false);
		return result;
	}
	/**
	 * ajax成功
	 * @param msg 成功消息
	 * @return
	 */
	public Object renderSuccess(String msg) {
		Result result=new Result();
		result.setMsg(msg);
		result.setSuccess(true);
		return result;
	}
	/**
	 * ajax 成功
	 * @return
	 */
	public Object renderSuccess() {
		Result result=new Result();
		result.setSuccess(true);
		return result;
	}
	/**
	 * ajax 成功
	 * @return
	 */
	public Object renderSuccess(String msg,Map<String,Object>map) {
		Result result=new Result();
		result.setSuccess(true);
		result.setMsg(msg);
		result.setMap(map);
		return result;
	}
	/**
	 * ajax成功
	 * @param obj 成功对象
	 * @return
	 */
	public Object renderSuccess(Object obj) {
		Result result=new Result();
		result.setSuccess(true);
		result.setObj(obj);
		return result;
	}
	/**
	 * redirect跳转
	 * @param url 目标url
	 * @return
	 */
	public String redirect(String url) {
		return new StringBuilder("redirect:").append(url).toString();
	}
	/**
	 * 下载文件
	 * @param file 文件
	 */
	protected ResponseEntity<Resource> download(File file) {
		String fileName = file.getName();
		return download(file, fileName);
	}
	
	/**
	 * 下载
	 * @param file 文件
	 * @param fileName 生成的文件名
	 * @return {ResponseEntity}
	 */
	protected ResponseEntity<Resource> download(File file, String fileName) {
		Resource resource = new FileSystemResource(file);
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		String header = request.getHeader("User-Agent");
		// 避免空指针
		header = header == null ? "" : header.toUpperCase();
		HttpStatus status;
		if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
			fileName = URLUtils.encodeURL(fileName, Charsets.UTF_8);
			status = HttpStatus.OK;
		} else {
			fileName = new String(fileName.getBytes(Charsets.UTF_8), Charsets.ISO_8859_1);
			status = HttpStatus.CREATED;
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<Resource>(resource, headers, status);
	}
	
	//分页
	public <T> Page<T> getPage(int current, int size, String sort, String order){
        Page<T> page = new Page<T>(current, size, sort);
        if ("desc".equals(order)) {
            page.setAsc(false);
        } else {
            page.setAsc(true);
        }
        return page;
    }
    
    public <T> PageInfo pageToPageInfo(Page<T> page) {
        PageInfo pageInfo = new PageInfo();
        pageInfo.setData(page.getRecords());
        pageInfo.setCount(page.getTotal());
        pageInfo.setOrder(page.getOrderByField());
        return pageInfo;
    }
}
