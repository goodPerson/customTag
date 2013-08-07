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
	private static RegionDaoImpl regionDao;
	private List<Region> listCityName;
	private int lvl_id1;
	
	static ApplicationContext factory=null;
	/**
	 * 初始化方法
	 */
	public static void initRegion(){
    	XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
    	regionDao=(RegionDaoImpl) factory.getBean("regionDaoImpl");
    }
	/**
	 * 获取城市名称
	 * @return
	 * @throws IOException 
	 */
	public void getCityName() throws IOException{
		if (null==regionDao)
		this.initRegion();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		String region_id=(String) request.getSession().getAttribute("regionId");
	  int  lvl_id=regionDao.getlvl(region_id);
		listCityName=regionDao.getCityRegionName(region_id);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");		
		JSONArray listJsonCityName=new JSONArray();
		JSONObject object=new JSONObject();

		for(int i=listCityName.size()-1;i>=0;i--){			 
//			if (i!=listCityName.size()){
			Region region=listCityName.get(i);
			object.put("id", region.getRegion_id());
			object.put("text", region.getRegion_name());
/*			}else{
				object.put("id", "ALL");
				object.put("text", "全部");
			}*/
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
		if (null==regionDao)
		this.initRegion();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		
		String ciytId=(String) request.getSession().getAttribute("regionId");
	    lvl_id1=regionDao.getlvl(ciytId);
		listCityName=regionDao.getCountyName(ciytId,lvl_id1);
		JSONArray listCountyName=new JSONArray();
		JSONObject object=new JSONObject();
		for (int i=0;i<listCityName.size();i++){
//			if (i!=listCityName.size()){
				Region region=listCityName.get(i);			
				object.put("id", region.getRegion_id());
				object.put("text", region.getRegion_name());
/*			}else{
				object.put("id", "ALL");
				object.put("text", "全部");
			}*/
			listCountyName.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(listCountyName.toString());
		print.flush();
		print.close();		
	}
	
	public void downRegion() throws IOException{
		if (null==regionDao)
			this.initRegion();
			HttpServletResponse response=ServletActionContext.getResponse();
			HttpServletRequest   request   =ServletActionContext.getRequest();
			response.setCharacterEncoding("gbk");
			response.setContentType("text/html;charset=gbk");
			response.addHeader("Content-Type", "text/html;charset=gbk");
			String ciytId=(String) request.getSession().getAttribute("regionId");
		    int  lvl_id=regionDao.getlvl(ciytId);
			listCityName=regionDao.getDownName(ciytId,lvl_id);
			JSONArray listCountyName=new JSONArray();
			JSONObject object=new JSONObject();
			if(ciytId.equals("1")){
				for(int i=listCityName.size()-1;i>=0;i--){			 
//					if (i!=listCityName.size()){
					Region region=listCityName.get(i);
					object.put("id", region.getRegion_id());
					object.put("text", region.getRegion_name());
		/*			}else{
						object.put("id", "ALL");
						object.put("text", "全部");
					}*/
					listCountyName.add(object);
				}
			}else{
			for (int i=0;i<listCityName.size();i++){
//				if (i!=listCityName.size()){
					Region region=listCityName.get(i);			
					object.put("id", region.getRegion_id());
					object.put("text", region.getRegion_name());
	/*			}else{
					object.put("id", "ALL");
					object.put("text", "全部");
				}*/
				listCountyName.add(object);
			}}
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
	public int getLvl_id1() {
		return lvl_id1;
	}
	public void setLvl_id1(int lvl_id1) {
		this.lvl_id1 = lvl_id1;
	}
	
	
}
