package com.env.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.env.entity.EntPollutionInfo;
import com.env.service.IEntPollutionInfoManager;
import com.env.service.IEntpriseManager;

/**
 * 企业水排污信息
 * @author hbj403
 */

@Controller
public class EntPollutionInfoController {
	@Resource(name="entpriseManager")
	private IEntpriseManager entpriseManager;
	
	@Resource(name="entPollutionInfoManager")
	private IEntPollutionInfoManager entPollutionInfoManager;
	
	@RequestMapping("/toAddEntPollutionInfo")
	public String toAddEntPollutionInfo(){
		return "/addEntprise";
	}
	
	@RequestMapping("/addEntPollutionInfo")
	public String addEntPollutionInfo(EntPollutionInfo entPollutionInfo){
		entPollutionInfoManager.addEntPollutionInfo(entPollutionInfo);
		return "redirect:/getAllEntPollutionInfo";
	}
	
	/**
	 * 初始化加载运行设备情况信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/jsonfindAllEntPollutionInfoByEntUserId")
   	private void jsonfindAllEntPollutionInfoByEntUserId(HttpServletRequest request, HttpServletResponse response) {
		String entUserId=request.getParameter("entUserId");
		String gasOrWater=request.getParameter("gasOrWater");
		JSONObject datas=null;
		try {
			datas = entPollutionInfoManager.getJSON(entUserId,gasOrWater);
			PrintWriter out= response.getWriter();
			out.write(datas.toString());
			System.out.println("水污染物数据表数据获取:"+datas.toString());
			out.flush();
			out.close();
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
   	}
	
	@RequestMapping("/addEntPollutionInfoByPollutionInfoId")
	private void addEntPollutionInfoByPollutionInfoId(HttpServletRequest request, HttpServletResponse response){
		String entUserId=request.getParameter("entUserId");
		String accountTotalEmission=request.getParameter("accountTotalEmission");
		String mgL=request.getParameter("mgL");
		String monitorDate=request.getParameter("monitorDate");
		String monitorMothod=request.getParameter("monitorMothod");
		String pLocation=request.getParameter("pLocation");
		String pMethod=request.getParameter("pMethod");
		String pMouth=request.getParameter("pMouth");
		String pName=request.getParameter("pName");
		String standartMGL=request.getParameter("standartMGL");
		String totalEmission=request.getParameter("totalEmission");
		String over=request.getParameter("over");
		String gasOrWater=request.getParameter("gasOrWater");
		
		EntPollutionInfo entPollutionInfo =new EntPollutionInfo();
		entPollutionInfo.setEntUserId(entUserId);
		entPollutionInfo.setAccountTotalEmission(accountTotalEmission);
		entPollutionInfo.setMgL(mgL);
		entPollutionInfo.setMonitorDate(monitorDate);
		entPollutionInfo.setMonitorMothod(monitorMothod);
		
		entPollutionInfo.setpLocation(pLocation);
		entPollutionInfo.setpMethod(pMethod);
		entPollutionInfo.setpMouth(pMouth);
		entPollutionInfo.setpName(pName);
		
		entPollutionInfo.setStandartMGL(standartMGL);
		entPollutionInfo.setTotalEmission(totalEmission);
		entPollutionInfo.setOver(over);
		entPollutionInfo.setGasOrWater(gasOrWater);
		
		if(null!=entPollutionInfo){
			entPollutionInfoManager.addEntPollutionInfo(entPollutionInfo);
		}
		responseMessage(response);
	}
	
	@RequestMapping("/getEntPollutionInfoByPollutionInfoId")
	private void getEntPollutionInfoByPollutionInfoId(HttpServletRequest request, HttpServletResponse response){
		String pollutionInfoId=request.getParameter("pollutionInfoId");
		System.out.println("=============pollutionInfoId==============="+pollutionInfoId);
		try {
			if(null!=pollutionInfoId){
				EntPollutionInfo entPollutionInfo=entPollutionInfoManager.getEntPollutionInfoByPollutionInfoId(pollutionInfoId);
				request.setAttribute("entPollutionInfo",entPollutionInfo);
				request.getRequestDispatcher("admin_updateWaterPollution.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateEntPollutionInfo")
	public void updateEntPollutionInfo(HttpServletRequest request, HttpServletResponse response){
		String pollutionInfoId=request.getParameter("pollutionInfoId");
		String entUserId=request.getParameter("entUserId");
		String accountTotalEmission=request.getParameter("accountTotalEmission");
		String mgL=request.getParameter("mgL");
		String monitorDate=request.getParameter("monitorDate");
		String monitorMothod=request.getParameter("monitorMothod");
		String pLocation=request.getParameter("pLocation");
		String pMethod=request.getParameter("pMethod");
		String pMouth=request.getParameter("pMouth");
		String pName=request.getParameter("pName");
		String standartMGL=request.getParameter("standartMGL");
		String totalEmission=request.getParameter("totalEmission");
		String over=request.getParameter("over");
		
		EntPollutionInfo entPollutionInfo=entPollutionInfoManager.getEntPollutionInfoByPollutionInfoId(pollutionInfoId);
		if(null!=entPollutionInfo){
			entPollutionInfo.setPollutionInfoId(pollutionInfoId);
			entPollutionInfo.setEntUserId(entUserId);
			entPollutionInfo.setAccountTotalEmission(accountTotalEmission);
			entPollutionInfo.setMgL(mgL);
			entPollutionInfo.setMonitorDate(monitorDate);
			entPollutionInfo.setMonitorMothod(monitorMothod);
			
			entPollutionInfo.setpLocation(pLocation);
			entPollutionInfo.setpMethod(pMethod);
			entPollutionInfo.setpMouth(pMouth);
			entPollutionInfo.setpName(pName);
			
			entPollutionInfo.setStandartMGL(standartMGL);
			entPollutionInfo.setTotalEmission(totalEmission);
			entPollutionInfo.setOver(over);
			entPollutionInfoManager.updateEntPollutionInfo(entPollutionInfo);
		}
		responseMessage(response);
	}
	
	@RequestMapping("/watchEntPollutionInfoByPollutionInfoId")
	private void watchEntPollutionInfoByPollutionInfoId(HttpServletRequest request,HttpServletResponse response){
		String pollutionInfoId=request.getParameter("pollutionInfoId");
		System.out.println("=============pollutionInfoId==============="+pollutionInfoId);
		try {
			if(null!=pollutionInfoId){
				EntPollutionInfo entPollutionInfo=entPollutionInfoManager.getEntPollutionInfoByPollutionInfoId(pollutionInfoId);
				request.setAttribute("entPollutionInfo",entPollutionInfo);
				request.getRequestDispatcher("admin_watchWaterPollution.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deleteEntPollutionInfoByPollutionInfoId")
	private void deleteEntPollutionInfoByPollutionInfoId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String pollutionInfoId=request.getParameter("pollutionInfoId");
		String data = "";
		try {
			System.out.println("要删除的记录pollutionInfoId:"+pollutionInfoId);
			if(entPollutionInfoManager.delEntPollutionInfo(pollutionInfoId)){//删除数据
				data = "success";
			}else{
				data = "fail";
			}
		} catch (Exception e) {		 
			e.printStackTrace();
			data = "fail";
		}
		response.getWriter().write(data);
	}
	
	private void responseMessage(HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=" + "utf-8");
		Writer writer = null;
		try {
			writer = response.getWriter();
			writer.write("success");
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
}
