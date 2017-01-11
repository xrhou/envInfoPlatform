package com.env.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.env.entity.EntMonitorReport;
import com.env.service.IEntMonitorReportManager;
import com.env.service.IEntProductManager;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
import com.env.service.IOperationLogManager;
/**
 * 单位添加自行监测报告
 * @author hbj403
 */
@Controller
public class EntMonitorReportController {
	@Resource(name="entUserManager")
	private IEntUserManager entUserManager;
	
	@Resource(name="entpriseManager")
	private IEntpriseManager entpriseManager;
	
	@Resource(name="entProductManager")
	private IEntProductManager entProductManager;
	
	@Resource(name="entMonitorReportManager")
	private IEntMonitorReportManager entMonitorReportManager;
	
	@Resource(name="operationLogManager")
	private IOperationLogManager operationLogManager;

	@RequestMapping("/getMonitorReportByReportId")
	public void getMonitorReportByReportId(HttpServletRequest request,HttpServletResponse response){
		String reportId=request.getParameter("reportId");
		System.out.println("==================reportId:"+reportId);
		try {
			EntMonitorReport entMonitorReport=entMonitorReportManager.getEntMonitorReportByReportId(reportId);
			request.setAttribute("entMonitorReport", entMonitorReport);
			request.getRequestDispatcher("admin_updateSelfReport.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化加载企业自行监测报告
	 * @param request
	 * @param response
	 */
	@RequestMapping("/jsonfindByEntUserId")
   	private void jsonfindByEntUserId(HttpServletRequest request, HttpServletResponse response) {
		String entUserId=request.getParameter("entUserId");
		System.out.println("自行监测报告jsonfindByEntUserId---:"+entUserId);
		JSONObject datas=null;
		try {
			datas = entMonitorReportManager.getJSONByEntUserId(entUserId);
			System.out.println("自行监测报告jsonfindByEntUserId---:"+datas.toString());
			PrintWriter out= response.getWriter();
			out.write(datas.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
   	}
	
	
	@RequestMapping("/addReport")
	public void addReport(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		System.out.println("addReport start work.....");
		//String uploadDir = request.getSession().getServletContext().getRealPath("/")+ FileOperateUtil.UPLOADDIR;
		String realpath=request.getSession().getServletContext().getRealPath("uploads");
		System.out.println("realpath:---->"+realpath);
		//数据库存放路径
		String dataPath="";
		String dataPath2="";
		String entUserId = request.getParameter("entUserId");
		String reportName = request.getParameter("reportName");
		String entName = request.getParameter("entName");
		String entUsercode = request.getParameter("entUsercode");
		String productDay = request.getParameter("productDay");
		String reportDate = request.getParameter("reportDate");
		String monitorDay = request.getParameter("monitorDay");
		String reportedUrl = request.getParameter("reportedUrl");
		System.out.println("reportedUrl:"+reportedUrl+",reportName:"+reportName+",entName:"+entName+",entUsercode:"+entUsercode+",productDay:"+productDay+",reportDate:"+reportDate+",monitorDay:"+monitorDay);
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 记录上传过程起始时的时间，用来计算上传时间
				int pre = (int) System.currentTimeMillis();
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						System.out.println("myFileName:-->:"+myFileName);
						// 重命名上传后的文件名
						String fileName = System.currentTimeMillis()+"-"+file.getOriginalFilename();
						// 定义上传路径
						dataPath = realpath+"/" +fileName;
						dataPath2="uploads/"+fileName;
						System.out.println(dataPath);
						File localFile = new File(dataPath);
						if(!localFile.exists()){
							localFile.mkdir();
						}
						file.transferTo(localFile);
					}
				}
				// 记录上传该文件后的时间
				int finaltime = (int) System.currentTimeMillis();
				System.out.println(finaltime - pre);
			}
			//记录文件上传路径到数据库
			EntMonitorReport entMonitorReport=new EntMonitorReport(entUserId, reportName, dataPath2, reportDate, productDay, monitorDay,reportedUrl);
			entMonitorReportManager.addEntMonitorReport(entMonitorReport);
			System.out.println("记录文件上传路径到数据库ok");
		}
		responseMessage(response);
	}

	private void responseMessage(HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=" + "utf-8");
		Writer writer = null;
		try {
			writer = response.getWriter();
			writer.write("{\"code\":" + 200 + ",\"message\":\"" + "文件处理成功"+ "\"}");
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/updateReportById")
	public void updateReportById(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		String realpath=request.getSession().getServletContext().getRealPath("uploads");
		System.out.println("realpath:---->"+realpath);
		//数据库存放路径
		String dataPath="";
		String dataPath2="";
		String reportId = request.getParameter("reportId");
		String reportName = request.getParameter("reportName");
		String entName = request.getParameter("entName");
		String entUsercode = request.getParameter("entUsercode");
		String productDay = request.getParameter("productDay");
		String reportDate = request.getParameter("reportDate");
		String monitorDay = request.getParameter("monitorDay");
		String reportedUrl = request.getParameter("reportedUrl");
		System.out.println("reportName:"+reportName+",entName:"+entName+",entUsercode:"+entUsercode+",productDay:"+productDay+",reportDate:"+reportDate+",monitorDay:"+monitorDay);
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 记录上传过程起始时的时间，用来计算上传时间
				int pre = (int) System.currentTimeMillis();
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						System.out.println("myFileName:-->:"+myFileName);
						// 重命名上传后的文件名
						String fileName = System.currentTimeMillis()+"-"+file.getOriginalFilename();
						// 定义上传路径
						dataPath = realpath +"/"+ fileName;
						dataPath2="uploads/"+fileName;
						System.out.println(dataPath);
						File localFile = new File(dataPath);
						file.transferTo(localFile);
					}
				}
				// 记录上传该文件后的时间
				int finaltime = (int) System.currentTimeMillis();
				System.out.println(finaltime - pre);
			}
			//记录文件上传路径到数据库
			EntMonitorReport entMonitorReport=entMonitorReportManager.getEntMonitorReportByReportId(reportId);
			entMonitorReport.setEntReportDate(reportDate);
			entMonitorReport.setEntReportFileName(reportName);
			entMonitorReport.setEntReportFilePath(dataPath2);
			entMonitorReport.setMonitorDay(monitorDay);
			entMonitorReport.setProductDay(productDay);
			entMonitorReport.setReportedUrl(reportedUrl);
			entMonitorReportManager.updateEntMonitorReport(entMonitorReport);
			System.out.println("记录更新文件上传路径到数据库ok");
		}
		responseMessage(response);
	}
	
	@RequestMapping("/deleteEntMonitorReportByReportId")
	public void deleteEntMonitorReportByReportId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("in to deleteEntMonitorReportByReportId...");
		String reportId = (null == request.getParameter("reportId")||"".equals(request.getParameter("reportId")))? null:request.getParameter("reportId");
		String data = "";
		try {
			//删除数据
			System.out.println("要删除的报告记录:"+reportId);
			if(entMonitorReportManager.delEntMonitorReport(reportId)){
				data = "success";
			}else{
				data = "fail";
			}
		} catch (Exception e) {		 
			e.printStackTrace();
			data = "fail";
		}
		request.setAttribute("data", data);
		response.getWriter().write(data);
	}
	
	@RequestMapping("/getDownFile")
	public void getDownFile(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String realpath=request.getSession().getServletContext().getRealPath("/");
		request.setCharacterEncoding("UTF-8");
		InputStream stream;
		String reportId = request.getParameter("reportId");//文件名
		System.out.println(reportId);
		EntMonitorReport entMonitorReport=entMonitorReportManager.getEntMonitorReportByReportId(reportId);
		//截取文件后缀
		String fileTail=entMonitorReport.getEntReportFilePath().substring(entMonitorReport.getEntReportFilePath().lastIndexOf("."));
		System.out.println("下载文件名称:"+entMonitorReport.getEntReportFileName()+fileTail);
		try {
			stream = new FileInputStream(realpath+entMonitorReport.getEntReportFilePath()); //文件下载路径
			OutputStream os = null;
			response.setContentType("APPLICATION/DOWNLOAD");
			response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(entMonitorReport.getEntReportFileName()+fileTail, "UTF-8"));
			response.setContentLength(stream.available());
			os = response.getOutputStream();
			int iBytesRead = 0;
			byte[] buffer = new byte[10240000];
			while ((iBytesRead = stream.read(buffer, 0, 10240000)) != -1) {
				os.write(buffer, 0, iBytesRead);
			}
			os.close();
			stream.close();
    		response.flushBuffer();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	

	@RequestMapping("/download")
	public void download(HttpServletRequest request,HttpServletResponse response, String storeName, String contentType,String realName) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		//String ctxPath = request.getSession().getServletContext().getRealPath("/")+UPLOADDIR;
		String downLoadPath =storeName;

		long fileLength = new File(downLoadPath).length();
		//String storeName = "201205051340364510870879724.zip";  
        String realName1 = "Java设计模式.zip";  
        //String contentType = "application/octet-stream"; 
		response.setContentType(contentType);
		response.setHeader("Content-disposition", "attachment; filename="+ new String(realName1.getBytes("utf-8"), "ISO8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));
		
		response.setContentType("APPLICATION/DOWNLOAD");
		response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(realName1, "UTF-8"));
		
		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}
	
	
	
}
