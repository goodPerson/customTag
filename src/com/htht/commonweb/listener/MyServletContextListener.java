package com.htht.commonweb.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.htht.commonweb.JavaEEbugRepair;

/**
 * WEB应用程序初始化监听器
 */
public class MyServletContextListener implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {
	 
	}

	public void contextInitialized(ServletContextEvent arg0) {
		try {
			JavaEEbugRepair.initRepair_S2_016();
			JavaEEbugRepair.initRepair_S2_017();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

