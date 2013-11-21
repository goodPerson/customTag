package action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import module.CustTagAndGroupMonitorD;
import module.CustTagAndGroupMonitorM;
import module.CustTagCountyD;

import com.opensymphony.xwork2.ActionSupport;
import common.PrintExcelUtil;

import dao.CustTagAndGroupMonitorDImpl;
import dao.CustTagAndGroupMonitorMImpl;

public class CustCounttsAction extends ActionSupport {
		private CustTagAndGroupMonitorDImpl custCountsDao;
		private CustTagAndGroupMonitorMImpl custCountsMDao;
		private List<CustTagAndGroupMonitorD>  listCustsPage;
		private List<CustTagAndGroupMonitorM>  listCustsMPage;
		private List<CustTagAndGroupMonitorD>  listCusts;
		private List<CustTagAndGroupMonitorM>  listCustsM;
		private Object sgsD;      //省公司
		private Object sjzD;       //石家庄
		private Object tsD;        //唐山
		private Object qhdD;	    //秦皇岛
		private Object hdD;     //邯郸
		private Object bdD;	  //保定
		private Object zjkD;    //张家口
		private Object cdD;	 //承德
		private Object hsD;    //衡水
		private Object czD;	//沧州
		private Object xtD;    //邢台
		private Object lfD;    //廊坊
		
		private Object sgsM;      //省公司
		private Object sjzM;       //石家庄
		private Object tsM;        //唐山
		private Object qhdM;	    //秦皇岛
		private Object hdM;     //邯郸
		private Object bdM;	  //保定
		private Object zjkM;    //张家口
		private Object cdM;	 //承德
		private Object hsM;    //衡水
		private Object czM;	//沧州
		private Object xtM;    //邢台
		private Object lfM;    //廊坊
		
		/**下载渠道经理详细信息所需要的参数*/
		String contentType;//内容类型
		FileInputStream downloadFile;//
		String fileName;//文件名
		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		int pageno=0;
		int pagesize=0;
		
		private void initCust(){
			XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			custCountsDao=(CustTagAndGroupMonitorDImpl) factory.getBean("custDdao");
		}
		private void initCustM(){
			XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			custCountsMDao= (CustTagAndGroupMonitorMImpl) factory.getBean("custMdao");
		}
		
		public String mainMethod(){
			this.initCustM();
//			标签月统计折线图开始
			listCustsM=custCountsMDao.getRecentlyCountsM();
			for (int i=0;i<listCustsM.size();i++){
				CustTagAndGroupMonitorM cum=listCustsM.get(i);
				String reginNameM=cum.getRegionName();
				 if("沧州".equals(reginNameM)){
                	czM=cum;
                }else if("保定".equals(reginNameM)){
                	bdM=cum;
                }else if("承德".equals(reginNameM)){
                	cdM=cum;
                }else  if ("省公司".equals(reginNameM)){
                	sgsM=cum;
                }else if("石家庄".equals(reginNameM)){
                	sjzM=cum;
                }else if("唐山".equals(reginNameM)){
                	tsM=cum;
                }else if("秦皇岛".equals(reginNameM)){
                	qhdM=cum;
                }else if("邯郸".equals(reginNameM)){
                	hdM=cum;
                }else if("廊坊".equals(reginNameM)){
                	lfM=cum;
                }else if("张家口".equals(reginNameM)){
                	zjkM=cum;
                }else if("衡水".equals(reginNameM)){
                	hsM=cum;
                }else if("邢台".equals(reginNameM)){
                	xtM=cum;
                }				 
			}
//			标签月统计折线图结束
			return SUCCESS;
		}

		
		/**
		 * 客户标签日统计
		 * @return
		 */
		public String mainDay(){
			this.initCust();
//			标签日统计折线图开始
			listCusts=custCountsDao.getRecentlyCounts();
			for (int i=0;i<listCusts.size();i++){
				CustTagAndGroupMonitorD cud=listCusts.get(i);
				String reginName=cud.getRegionName();
				 if("沧州".equals(reginName)){
                	czD=cud;
                }else if("保定".equals(reginName)){
                	bdD=cud;
                }else if("承德".equals(reginName)){
                	cdD=cud;
                }else  if ("省公司".equals(reginName)){
                	sgsD=cud;
                }else if("石家庄".equals(reginName)){
                	sjzD=cud;
                }else if("唐山".equals(reginName)){
                	tsD=cud;
                }else if("秦皇岛".equals(reginName)){
                	qhdD=cud;
                }else if("邯郸".equals(reginName)){
                	hdD=cud;
                }else if("廊坊".equals(reginName)){
                	lfD=cud;
                }else if("张家口".equals(reginName)){
                	zjkD=cud;
                }else if("衡水".equals(reginName)){
                	hsD=cud;
                }else if("邢台".equals(reginName)){
                	xtD=cud;
                }
				 
			}
//			标签日统计折线图结束
			return SUCCESS;
		}
		/**
		 * 导出地市日统计
		 * @return
		 * @throws Exception
		 */
		public String exportDr() throws Exception{
			this.initCust();
//			标签日统计 开始
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response.addHeader("Content-Type", "text/html;charset=utf-8");
			String title="";
			String findstartDay=request.getParameter("findstartDay");
			String findsendDay=request.getParameter("findsendDay");
			String regionName=URLDecoder.decode(request.getParameter("regionName"), "utf-8");
			if (!"".equals(regionName)){
				title+=regionName+"_";
			}
			title+="客户标签地区日统计";
			listCustsPage=custCountsDao.queryAll(findstartDay,findsendDay,regionName);
			String  exportType = "xls";
			// 定义表头
			String header = "日期 地域名称 访问人数 访问次数 客户清单下载人数 客户清单下载次数 客户分群创建人数 客户分群创建个数 标签新增创建人数 标签新增创建个数";
			// 获取数据
			List<Object[]> datalist = new ArrayList<Object[]>();
			for (int i = 0; i < listCustsPage.size(); i++) {
				CustTagAndGroupMonitorD t = (CustTagAndGroupMonitorD) listCustsPage.get(i);
				Object[]	obj={((CustTagAndGroupMonitorD) t).getStatisDate(),((CustTagAndGroupMonitorD) t).getRegionName(),((CustTagAndGroupMonitorD) t).getAccessSubsCnt(),
		                ((CustTagAndGroupMonitorD) t).getAccessCnt(),((CustTagAndGroupMonitorD) t).getCustlistDwlnSubsCnt(),((CustTagAndGroupMonitorD) t).getCustlistDwlnCnt(),
		                ((CustTagAndGroupMonitorD) t).getCustgroupCreateSubsCnt(),((CustTagAndGroupMonitorD) t).getCustgroupCreateCnt(),
		                ((CustTagAndGroupMonitorD) t).getCusttagCreateSubsCnt(),((CustTagAndGroupMonitorD) t).getCusttagCreateCnt()};
				datalist.add(obj);
			}
			finputStream(title,exportType,  header,  datalist);
			
			return "exportDR";
		}
		
		/**
		 * 客户标签日统计
		 * @return
		 * @throws IOException
		 */
		public String getTagCountsData() throws IOException{
			this.initCust();
//			标签日统计 开始

			response.setCharacterEncoding("utf-8");
			response.addHeader("Content-Type", "text/html;charset=utf-8");
			String findstartDay=request.getParameter("findstartDay");
			String findsendDay=request.getParameter("findsendDay");
			String regionName=URLDecoder.decode(request.getParameter("regionName"), "utf-8");
			pager();
			

			listCustsPage=custCountsDao.queryAll(findstartDay,findsendDay,regionName,pageno, pagesize);
			
			int totalRecord=custCountsDao.getPageInfo().getTotalRows();
			JSONArray  jsonArray=new JSONArray();
			if (null!=listCustsPage){
				for(int i=0;i<listCustsPage.size();i++){
					CustTagAndGroupMonitorD cgd=listCustsPage.get(i);
					JSONObject jobj=new JSONObject();
					jobj.put("statisDate", cgd.getStatisDate());
					jobj.put("regionName", cgd.getRegionName());
					jobj.put("accessSubsCnt", cgd.getAccessSubsCnt());
					jobj.put("accessCnt", cgd.getAccessCnt());
					jobj.put("custlistDwlnSubsCnt", cgd.getCustlistDwlnSubsCnt());
					jobj.put("custlistDwlnCnt", cgd.getCustlistDwlnCnt());
					jobj.put("custgroupCreateSubsCnt", cgd.getCustgroupCreateSubsCnt());
					jobj.put("custgroupCreateCnt", cgd.getCustgroupCreateCnt());
					jobj.put("custtagCreateSubsCnt", cgd.getCusttagCreateSubsCnt());
					jobj.put("custtagCreateCnt", cgd.getCusttagCreateCnt());
					jsonArray.add(jobj);
				}
				   JSONObject  jsonFinal=new JSONObject();
				   jsonFinal.put("total", totalRecord);
				   jsonFinal.put("rows", jsonArray);
				   PrintWriter pWriter=response.getWriter();
				   pWriter.print(jsonFinal.toString());
				   pWriter.flush();
				   pWriter.close();
			}
//         标签日统计结束
			return SUCCESS;
		}
    
		/**
		 * 导出地市月统计
		 * @return
		 * @throws Exception 
		 */
		public String exportRm() throws Exception{
			this.initCustM();
//			标签月统计 开始
			String title="";
			response.setCharacterEncoding("utf-8");
			response.addHeader("Content-Type", "text/html;charset=utf-8");
			String statisMonth=request.getParameter("statisMonth");
			String regionName=URLDecoder.decode(request.getParameter("regionName"), "utf-8");
			if (!"".equals(regionName)){
				title+=regionName+"_";
			}
			title+="客户标签地区月统计";
			listCustsMPage=custCountsMDao.queryAllM(statisMonth,regionName);
			
			String  exportType = "xls";
			// 定义表头
			String header = "月份 地域名称 访问人数 访问次数 客户清单下载人数 客户清单下载次数 客户分群创建人数 客户分群创建个数 标签新增创建人数 标签新增创建个数";
			// 获取数据
			List<Object[]> datalist = new ArrayList<Object[]>();
			for (int i = 0; i < listCustsMPage.size(); i++) {
				CustTagAndGroupMonitorM t = (CustTagAndGroupMonitorM) listCustsMPage.get(i);
				Object[]	obj={((CustTagAndGroupMonitorM) t).getStatisMonth(),((CustTagAndGroupMonitorM) t).getRegionName(),((CustTagAndGroupMonitorM) t).getAccessSubsCnt(),
						((CustTagAndGroupMonitorM) t).getAccessCnt(),((CustTagAndGroupMonitorM) t).getCustlistDwlnSubsCnt(),((CustTagAndGroupMonitorM) t).getCustlistDwlnCnt(),
						((CustTagAndGroupMonitorM) t).getCustgroupCreateSubsCnt(),((CustTagAndGroupMonitorM) t).getCustgroupCreateCnt(),
						((CustTagAndGroupMonitorM) t).getCusttagCreateSubsCnt(),((CustTagAndGroupMonitorM) t).getCusttagCreateCnt()};
				datalist.add(obj);
			}
			finputStream(title,exportType,  header,  datalist);
			return "exportRm";
		}
		
		/**
		 * 客户标签月统计
		 * @return
		 * @throws IOException
		 */
		public String getTagCountsDataM() throws IOException{
			this.initCustM();
//			标签月统计 开始
			response.setCharacterEncoding("utf-8");
			response.addHeader("Content-Type", "text/html;charset=utf-8");
			String statisMonth=request.getParameter("statisMonth");
			String regionName=URLDecoder.decode(request.getParameter("regionName"), "utf-8");
			pager();
			listCustsMPage=custCountsMDao.queryAllM(statisMonth,regionName,pageno, pagesize);
			
			int totalRecord=custCountsMDao.getPageInfo().getTotalRows();
			JSONArray  jsonArray=new JSONArray();
			if (null!=listCustsMPage){
				for(int i=0;i<listCustsMPage.size();i++){
					CustTagAndGroupMonitorM cgd=listCustsMPage.get(i);
					JSONObject jobj=new JSONObject();
					jobj.put("statisMonth", cgd.getStatisMonth());
					jobj.put("regionName", cgd.getRegionName());
					jobj.put("accessSubsCnt", cgd.getAccessSubsCnt());
					jobj.put("accessCnt", cgd.getAccessCnt());
					jobj.put("custlistDwlnSubsCnt", cgd.getCustlistDwlnSubsCnt());
					jobj.put("custlistDwlnCnt", cgd.getCustlistDwlnCnt());
					jobj.put("custgroupCreateSubsCnt", cgd.getCustgroupCreateSubsCnt());
					jobj.put("custgroupCreateCnt", cgd.getCustgroupCreateCnt());
					jobj.put("custtagCreateSubsCnt", cgd.getCusttagCreateSubsCnt());
					jobj.put("custtagCreateCnt", cgd.getCusttagCreateCnt());
					jsonArray.add(jobj);
				}
				   JSONObject  jsonFinal=new JSONObject();
				   jsonFinal.put("total", totalRecord);
				   jsonFinal.put("rows", jsonArray);
				   PrintWriter pWriter=response.getWriter();
				   pWriter.print(jsonFinal.toString());
				   pWriter.flush();
				   pWriter.close();
			}
//         标签月统计结束
			return SUCCESS;
		}

		private void finputStream(String title,String exportType, String header, List<Object[]> datalist) throws Exception{
			FileInputStream result = PrintExcelUtil.getDownloadFile(exportType,
					title, title, header, datalist);
			contentType = "application/vnd.ms-excel;charset=utf-8";
			downloadFile = result;
			fileName = title+".xls";
			fileName = new String(fileName.getBytes(), "ISO8859-1");
		}		

		private void pager(){
			if (request.getParameter("page")==null || ""==request.getParameter("page")){
				pageno=1;
			}else{
				pageno=Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("rows")==null || ""==request.getParameter("rows")){
				pagesize=10;
			}else{
				pagesize=Integer.parseInt(request.getParameter("rows"));
			}
		}
		
		
		public Object getSgsD() {
			return sgsD;
		}
		public void setSgsD(Object sgsD) {
			this.sgsD = sgsD;
		}
		public Object getSjzD() {
			return sjzD;
		}
		public void setSjzD(Object sjzD) {
			this.sjzD = sjzD;
		}
		public Object getTsD() {
			return tsD;
		}
		public void setTsD(Object tsD) {
			this.tsD = tsD;
		}
		public Object getQhdD() {
			return qhdD;
		}
		public void setQhdD(Object qhdD) {
			this.qhdD = qhdD;
		}
		public Object getHdD() {
			return hdD;
		}
		public void setHdD(Object hdD) {
			this.hdD = hdD;
		}
		public Object getBdD() {
			return bdD;
		}
		public void setBdD(Object bdD) {
			this.bdD = bdD;
		}
		public Object getZjkD() {
			return zjkD;
		}
		public void setZjkD(Object zjkD) {
			this.zjkD = zjkD;
		}
		public Object getCdD() {
			return cdD;
		}
		public void setCdD(Object cdD) {
			this.cdD = cdD;
		}
		public Object getHsD() {
			return hsD;
		}
		public void setHsD(Object hsD) {
			this.hsD = hsD;
		}
		public Object getCzD() {
			return czD;
		}
		public void setCzD(Object czD) {
			this.czD = czD;
		}
		public Object getXtD() {
			return xtD;
		}
		public void setXtD(Object xtD) {
			this.xtD = xtD;
		}
		public Object getLfD() {
			return lfD;
		}
		public void setLfD(Object lfD) {
			this.lfD = lfD;
		}
		public Object getSgsM() {
			return sgsM;
		}
		public void setSgsM(Object sgsM) {
			this.sgsM = sgsM;
		}
		public Object getSjzM() {
			return sjzM;
		}
		public void setSjzM(Object sjzM) {
			this.sjzM = sjzM;
		}
		public Object getTsM() {
			return tsM;
		}
		public void setTsM(Object tsM) {
			this.tsM = tsM;
		}
		public Object getQhdM() {
			return qhdM;
		}
		public void setQhdM(Object qhdM) {
			this.qhdM = qhdM;
		}
		public Object getHdM() {
			return hdM;
		}
		public void setHdM(Object hdM) {
			this.hdM = hdM;
		}
		public Object getBdM() {
			return bdM;
		}
		public void setBdM(Object bdM) {
			this.bdM = bdM;
		}
		public Object getZjkM() {
			return zjkM;
		}
		public void setZjkM(Object zjkM) {
			this.zjkM = zjkM;
		}
		public Object getCdM() {
			return cdM;
		}
		public void setCdM(Object cdM) {
			this.cdM = cdM;
		}
		public Object getHsM() {
			return hsM;
		}
		public void setHsM(Object hsM) {
			this.hsM = hsM;
		}
		public Object getCzM() {
			return czM;
		}
		public void setCzM(Object czM) {
			this.czM = czM;
		}
		public Object getXtM() {
			return xtM;
		}
		public void setXtM(Object xtM) {
			this.xtM = xtM;
		}
		public Object getLfM() {
			return lfM;
		}
		public void setLfM(Object lfM) {
			this.lfM = lfM;
		}
		public String getContentType() {
			return contentType;
		}
		public void setContentType(String contentType) {
			this.contentType = contentType;
		}
		public FileInputStream getDownloadFile() {
			return downloadFile;
		}
		public void setDownloadFile(FileInputStream downloadFile) {
			this.downloadFile = downloadFile;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}	
		
}
