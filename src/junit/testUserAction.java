package junit;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import dao.OperateLogDaoImpl;
import dao.RegionDaoImpl;
import dao.TagAttrDaoImpl;
import dao.TagOperateImpl;

/** �û�����ҵ��������Ĳ������� */
public class testUserAction {
	static ApplicationContext cxt;	
	static TagAttrDaoImpl tagAttrDao;

	//��ʼ��ApplicationContext����
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		//ʹ��ClassPathXmlApplicationContext��ʽ��ʼ��ApplicationContext����
		cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		tagAttrDao=(TagAttrDaoImpl) cxt.getBean("TagAttrDao");			
	}
	//����UserAction��AddUser����
	@Test
	public void testAddUser() {
		//tagAttrDao.listAttr("��������", "", "");

	}	
	
	public static TagAttrDaoImpl getTagAttrDao() {
		return tagAttrDao;
	}
	public static void setTagAttrDao(TagAttrDaoImpl tagAttrDao) {
		testUserAction.tagAttrDao = tagAttrDao;
	}
	
}
