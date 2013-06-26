package action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.Region;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import dao.RegionDaoImpl;

/**
 * 地域维表
 * @author ywz 
 *
 */
public class RegionAction {
	private  RegionDaoImpl regionDao;
	private List<Region> listCityName;
	
	//static ApplicationContext factory=null;
	/**
	 * 初始化方法
	 */
	public  void initRegion(){
    	XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//if (null==factory)
			//factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	regionDao=(RegionDaoImpl) factory.getBean("regionDaoImpl");
    }
	/**
	 * 获取城市名称
	 * @return
	 * @throws IOException 
	 */
	public void getCityName() throws IOException{
		//if (null==regionDao)
		this.initRegion();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		String region_id=request.getParameter("regionId");		
		listCityName=regionDao.getCityRegionName(region_id);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");		
		JSONArray listJsonCityName=new JSONArray();
		JSONObject object=new JSONObject();

		for(int i=listCityName.size();i>=0;i--){			 
			if (i!=listCityName.size()){
			Region region=listCityName.get(i);
			object.put("id", region.getRegion_id());
			object.put("text", region.getRegion_name());
			}else{
				object.put("id", "ALL");
				object.put("text", "全部");
			}
			listJsonCityName.add(object);
		}
		
		PrintWriter print=response.getWriter();
		print.print(listJsonCityName.toString());
		print.flush();
		print.close();
	}

	
    /**
     * 获取区县名称
     * @return
     * @throws IOException
     */
	public void getCountyName() throws IOException{
		//if (null==regionDao)
		this.initRegion();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String ciytId=request.getParameter("cityId");
		listCityName=regionDao.getCountyName(ciytId);
		JSONArray listCountyName=new JSONArray();
		JSONObject object=new JSONObject();
		for (int i=listCityName.size();i>=0;i--){
			if (i!=listCityName.size()){
				Region region=listCityName.get(i);			
				object.put("id", region.getRegion_id());
				object.put("text", region.getRegion_name());
			}else{
				object.put("id", "ALL");
				object.put("text", "全部");
			}
			listCountyName.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(listCountyName.toString());
		print.flush();
		print.close();		
	}

			
	public RegionDaoImpl getRegionDao() {
		return regionDao;
	}
	public void setRegionDao(RegionDaoImpl regionDao) {
		this.regionDao = regionDao;
	}
	public List<Region> getListCityName() {
		return listCityName;
	}
	public void setListCityName(List<Region> listCityName) {
		this.listCityName = listCityName;
	}
	
}
