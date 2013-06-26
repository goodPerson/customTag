package junit;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import dao.OperateLogDaoImpl;
import dao.RegionDaoImpl;
import dao.TagAttrDaoImpl;
import dao.TagOperateImpl;

/** 用户管理业务控制器的测试用例 */
public class testUserAction {
	static ApplicationContext cxt;	
	static TagAttrDaoImpl tagAttrDao;

	//初始化ApplicationContext容器
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		//使用ClassPathXmlApplicationContext方式初始化ApplicationContext容器
		cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		tagAttrDao=(TagAttrDaoImpl) cxt.getBean("TagAttrDao");			
	}
	//测试UserAction的AddUser方法
	@Test
	public void testAddUser() {
		//tagAttrDao.listAttr("基本属性", "", "");

	}	
	
	public static TagAttrDaoImpl getTagAttrDao() {
		return tagAttrDao;
	}
	public static void setTagAttrDao(TagAttrDaoImpl tagAttrDao) {
		testUserAction.tagAttrDao = tagAttrDao;
	}
	
}
