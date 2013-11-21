package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.ConsistList;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;

import dao.TestConsistImpl;




public class ConsistAction extends ActionSupport{
	private TestConsistImpl tagconsist =new TestConsistImpl();
	private List<ConsistList> struslist;
	private String[] names;
	private Integer[] count;
	private String a;
	private String b;
	private String constname;
	
	public void initTag(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tagconsist=(TestConsistImpl)factory.getBean("TestConsistImpl");
	}
	public String execute() {
		
		return SUCCESS;
	}
	public void getconsist() throws Exception{
		this.initTag();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		struslist=tagconsist.getStrut();
		names=new String[struslist.size()];
		count=new Integer[struslist.size()]; 
		JSONArray list=new JSONArray();
		JSONObject object=new JSONObject();
		String a="name";
		String b="y";
		for(int i=0;i<struslist.size();i++){
			object.put(a,struslist.get(i).getName());
			object.put(b, struslist.get(i).getCount());
		//	names[i]=(struslist.get(i).getName());
		//	count[i]=(struslist.get(i).getCount());
			list.add(object);
		}
//		JSONObject jsonObjectFinal = new JSONObject();
//		jsonObjectFinal.put("data", list); 
		PrintWriter print=response.getWriter();
		print.print(list);
		print.flush();
		print.close();	
	}

	public TestConsistImpl getTagconsist() {
		return tagconsist;
	}
	public void setTagconsist(TestConsistImpl tagconsist) {
		this.tagconsist = tagconsist;
	}
	public List<ConsistList> getStruslist() {
		return struslist;
	}
	public void setStruslist(List<ConsistList> struslist) {
		this.struslist = struslist;
	}
	public String[] getNames() {
		return names;
	}
	public void setNames(String[] names) {
		this.names = names;
	}
	public Integer[] getCount() {
		return count;
	}
	public void setCount(Integer[] count) {
		this.count = count;
	}
	public String getConstname() {
		return constname;
	}
	public void setConstname(String constname) {
		this.constname = constname;
	}

}
