package action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.SystemManager;
import module.UserInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;

import treasury.TreasuryService;



/**
 * 金库模式认证Action
 * 
 * @author wly
 * 
 */
//public class TreasuryAction extends BaseAction {
public class TreasuryAction extends ActionSupport{

	private String tName;
//	@Resource
//	private TreasurySwitchManager treasurySwitchManager;
	@Resource
	private SystemManager systemManager;
	static ApplicationContext context=null;
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	private void initWebService(){		
		try {
			context = new ClassPathXmlApplicationContext("applicationContext-cxf.xml");
			systemManager=(SystemManager)context.getBean("systemManager");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public String execute() throws Exception {
		return null;
	}
/**
     * 金库请求
     * @throws Exception
     */
	//@Action("treasuryRequest")
	public void treasuryRequest() throws Exception {
		
		//initWebService();
	   // UserInfo userInfo = systemManager.getUserInfo(request.getParameter("userId"));
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String applyMaster = request.getParameter("applyMaster");
		
		
		String str = "";
		if (!"".equals(tName)) {
			str = URLDecoder.decode(tName, "UTF-8");
		}

		String applyslave = "";
		
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");

//		if (userInfo != null) {
		 int intFlag=1;   //测试
		if (intFlag>0) {
			//applyslave = userInfo.getUser().getUserIdAccounts();
			applyslave = "wangwei-T300008005";
		}

		JSONObject jo = new JSONObject();
		String resultCodeStr = "";
		try {
			String inputXml = getRequestInputXml(busCode, sceneId, applyMaster,
					applyslave);
			System.out.println("Requrst:inputXml:" + inputXml);
			String result = TreasuryService.treasuryRequest(inputXml);
			if("".equals(applyMaster)){
				applyMaster = "2222";
				jo.put("applyMaster", "2222");
			}			
					

			if ("1111".equals(result)) {
				jo.put("result", "1111");
				String appModule = "";
				String opText = "";
				String optObj = "";
				appModule = URLDecoder.decode(appModule, "UTF-8");
				opText = URLDecoder.decode(opText, "UTF-8");
				optObj = URLDecoder.decode(optObj, "UTF-8");
			} else {
				System.out.println("Requrest:result:" + result);
				Document resDoc = DocumentHelper.parseText(result);
				Element root = resDoc.getRootElement();
				Element resultCode = root.element("ResultCode");
				Element treasuryId = root.element("TreasuryId");
				Element theSwitch = root.element("Switch");
				Element jointUsers = root.element("JointUsers");
				List userList = jointUsers.elements();
//                String jointUsersS=jointUsers.getText();    //测试环境
				
				 List list=root.elements("JointUsers");
				 Element foo=null;
				  for(int i=0;i<list.size();i++){
				       foo=(Element)list.get(i);
				       System.out.print("id:" + foo.elementText("payOrderId")); 
				   }
				   
				
				
				JSONArray usersInfo = new JSONArray();
				int ulen=userList.size();
				for (int i = 0; i < userList.size(); i++) {
					Element user = (Element) userList.get(i);
					JSONObject account = new JSONObject();
					account.put("Account", user.element("Account")
							.getText());
					account.put("RealName", user.element("RealName")
							.getText());
					usersInfo.add(account);
				}
				 

				jo.put("ResultCode", resultCode.getText());
				jo.put("TreasuryId", treasuryId.getText());
				jo.put("Switch", theSwitch.getText());
				jo.put("JointUsers", usersInfo);
				jo.put("Authorize", "1");
				resultCodeStr = resultCode.getText();
				if("9999".equals(resultCodeStr)){
					jo.put("resultCodeStr", "9999");
					String appModule = "";
					String opText = "";
					String optObj = "";
					String subUser = "";
					subUser = URLDecoder.decode(subUser,"UTF-8");
					appModule = URLDecoder.decode(appModule, "UTF-8");
					opText = URLDecoder.decode(opText, "UTF-8");
					optObj = URLDecoder.decode(optObj, "UTF-8");
				}
				String theSwitchs=theSwitch.getText();
                if("1".equals(theSwitchs)){
                	jo.put("theSwitchs", "1");
                	treasuryLog();
                }  
                if("123".equals(usersInfo)){
                	jo.put("usersInfo", "123");
                }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter writer = response.getWriter();
		writer.write(jo.toString());
		writer.flush();
		writer.close();
	}
	//@Action("treasuryAuthInit")   接口认证
	public void treasuryAuthInit() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		// request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String applyMaster = request.getParameter("applyMaster");
		String jointUser = request.getParameter("jointUser");
		String treasuryId = request.getParameter("treasuryId");
		String applyReason = request.getParameter("applyReason");
		applyReason = new String(applyReason.getBytes("GBK"), "UTF-8");
		String authType = request.getParameter("authType");
		if (applyReason == null || "".equals(applyReason)) {
			applyReason = "";
		}

		
		  // System.out.println("jointUser:"+jointUser);
		 // System.out.println("@@@@applyReason:"+applyReason);
		JSONObject jo = new JSONObject();
		String resultCodeStr = "";
		try {
			String inputXml = getAuthInitXml(treasuryId, busCode, sceneId,
					applyMaster, applyReason, authType, jointUser);
			String result = TreasuryService.treasuryAuthInit(inputXml);
			System.out.println("AuthInit:inputXml:" + inputXml);
			System.out.println("AuthInit:result:" + result);

			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
			resultCodeStr = resultCode.getText();
			if("9999".equals(resultCodeStr)){
				jo.put("resultCodeStr", "9999");
				String appModule = "";
				String opText = "";
				String optObj = "";
				String subUser = "";
				subUser = URLDecoder.decode(subUser,"UTF-8");
				appModule = URLDecoder.decode(appModule, "UTF-8");
				opText = URLDecoder.decode(opText, "UTF-8");
				optObj = URLDecoder.decode(optObj, "UTF-8");
			}

			if ("1".equals(resultCodeStr)) {
				resultCodeStr = root.element("ResultMessage").getText();
				treasuryLog();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().write(resultCodeStr);
	}

	//@Action("treasuryAuth")
	public void treasuryAuth() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String applyMaster = request.getParameter("applyMaster");
		String applySlave = "";
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		if (userInfo != null) {
			applySlave = userInfo.getUser().getUserIdAccounts();
		}
		String jointUser = request.getParameter("jointUser");
		String treasuryId = request.getParameter("treasuryId");
		String authType = request.getParameter("authType");
		String jointUserValue = request.getParameter("jointUserValue");

		// 加入session 以备后续日志所用
		HttpSession session = request.getSession();
		session.setAttribute("treasuryTreasuryId", treasuryId);// 金库编号
		session.setAttribute("treasuryBusCode", busCode);// 业务系统编号
		session.setAttribute("treasurySceneId", sceneId);// 场景Id
		session.setAttribute("treasuryApplyMaster", applyMaster);// 主账号
		session.setAttribute("treasuryApplySlave", applySlave);// 从账号

		JSONObject jo = new JSONObject();
		String resultCodeStr = "";
		try {
			String inputXml = getAuthXml(treasuryId, busCode, sceneId,
					applyMaster, applySlave, authType, jointUserValue);
			String result = TreasuryService.treasuryAuth(inputXml);
			System.out.println("Auth:inputXml:" + inputXml);
			System.out.println("Auth:result:" + result);
			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
			resultCodeStr = resultCode.getText();
			if("9999".equals(resultCodeStr)){
				jo.put("resultCodeStr", "9999");
				String appModule = "";
				String opText = "";
				String optObj = "";
				String subUser = "";
				subUser = URLDecoder.decode(subUser,"UTF-8");
				appModule = URLDecoder.decode(appModule, "UTF-8");
				opText = URLDecoder.decode(opText, "UTF-8");
				optObj = URLDecoder.decode(optObj, "UTF-8");
			}


			if ("1".equals(resultCodeStr)) {
				resultCodeStr = root.element("ResultMessage").getText();
				treasuryLog();
			}
			if("1001".equals(resultCodeStr)){
				resultCodeStr= root.element("ResultMessage").getText();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().write(resultCodeStr);
	}

	/**
	 * 金库请求入参
	 * 
	 * @param busCode
	 * @param sceneId
	 * @param applayMaster
	 * @param applyslave
	 * @return
	 */
	private String getRequestInputXml(String busCode, String sceneId,
			String applyMaster, String applyslave) {
		Document document = DocumentHelper.createDocument();
		Element treasury = document.addElement("Treasury");
		Element busCodeElm = treasury.addElement("BusCode");
		busCodeElm.setText(busCode);
		Element sceneIdElm = treasury.addElement("SceneId");
		sceneIdElm.setText(sceneId);
		Element applyMasterElm = treasury.addElement("ApplyMaster");
		applyMasterElm.setText(applyMaster);
		Element applyslaveElm = treasury.addElement("Applyslave");
		applyslaveElm.setText(applyslave);
		return document.asXML();
	}

	/**
	 * 金库认证初始化
	 * 
	 * @param treasuryId
	 * @param busCode
	 * @param sceneId
	 * @param applayMaster
	 * @param applyReason
	 * @param authType
	 * @param jointUser
	 * @return
	 */
	private String getAuthInitXml(String treasuryId, String busCode,
			String sceneId, String applyMaster, String applyReason,
			String authType, String jointUser) {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("Treasury");
		root.addElement("TreasuryId").setText(treasuryId);
		root.addElement("BusCode").setText(busCode);
		root.addElement("SceneId").setText(sceneId);
		root.addElement("ApplyMaster").setText(applyMaster);
	    root.addElement("ApplyReason").setText(applyReason);
		root.addElement("AuthType").setText(authType);
		Element jointMasterList = root.addElement("JointMasterList");
		String[] jointUsers = jointUser.split("::");
		for (String user : jointUsers) {
			if (user != null && !user.equals("")) {
				Element usr = jointMasterList.addElement("JointUser");
				usr.addElement("Account").setText(user);
			}
		}

		return document.asXML();

	}

	/**
	 * 金库认证
	 * 
	 * @param treasuryId
	 * @param busCode
	 * @param sceneId
	 * @param applyMaster
	 * @param applySlave
	 * @param authType
	 * @param jointUser
	 * @param jointUserValue
	 * @return
	 */
	private String getAuthXml(String treasuryId, String busCode,
			String sceneId, String applyMaster, String applySlave,
			String authType, String jointUserValue) {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("Treasury");
		root.addElement("TreasuryId").setText(treasuryId);
		root.addElement("BusCode").setText(busCode);
		root.addElement("SceneId").setText(sceneId);
		root.addElement("ApplyMaster").setText(applyMaster);
		root.addElement("ApplySlave").setText(applySlave);
		root.addElement("AuthType").setText(authType);

		Element jointMasterAuth = root.addElement("JointMasterAuth");

		String[] uvs = jointUserValue.split(";;");
		for (String uv : uvs) {
			Element masterAuth = jointMasterAuth.addElement("MasterAuth");
			String[] uvArray = uv.split("::");
			masterAuth.addElement("Id").setText(uvArray[0]);
			masterAuth.addElement("Value").setText(uvArray[1]);
		}
		return document.asXML();

	}

	//@Action("treasuryLog")
	public void treasuryLog() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String treasuryId = request.getParameter("treasuryId");
		String subUser = request.getParameter("subUser");
		String logType = request.getParameter("logType");
		String ticket = (String) request.getSession().getAttribute("ticket");// ticket从4A获取
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		String logTime = format.format(new Date());
		String status = request.getParameter("status");
		String app = request.getParameter("app");
		String sip = request.getRemoteAddr();
		String appModule = request.getParameter("appModule");
		String opType = request.getParameter("opType");
		String opText = request.getParameter("opText");
		String optObj = request.getParameter("optObj");
		String logLevel = request.getParameter("logLevel");
		String masterAcc = request.getParameter("masterAcc");
		
		String resultCodeStr = "";
		try {
			String inputXml = getLogXml(treasuryId, busCode, sceneId, logType,
					logTime, subUser, status, app, sip, appModule, opType,
					opText, ticket, optObj, logLevel, masterAcc);
			String result = TreasuryService.treasuryLog(inputXml);
			System.out.println("Auth:inputXml:" + inputXml);
			System.out.println("Auth:result:" + result);
			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
			resultCodeStr = resultCode.getText();
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().write(resultCodeStr);
	}

	@SuppressWarnings("unused")
	private String getLogXml(String treasuryId, String busCode, String sceneId,
			String logType, String logTime, String subUser, String status,
			String app, String sip, String appModule, String opType,
			String opText, String ticket, String optObj, String logLevel,
			String masterAcc) throws UnsupportedEncodingException {
		appModule = URLDecoder.decode(appModule, "UTF-8");
		opText = URLDecoder.decode(opText, "UTF-8");
		optObj = URLDecoder.decode(optObj, "UTF-8");
		subUser=URLDecoder.decode(subUser, "UTF-8");
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("Treasury");
		root.addElement("TreasuryId").setText(treasuryId);
		root.addElement("BusCode").setText(busCode);
		root.addElement("SceneId").setText(sceneId);
		root.addElement("LogType").setText(logType);
		Element operateLog = root.addElement("OperateLog");
		operateLog.addElement("LogTime").setText(logTime);
		operateLog.addElement("SubUser").setText(subUser);
		operateLog.addElement("Status").setText(status);
		operateLog.addElement("App").setText(app);
		operateLog.addElement("Sip").setText(sip);
		operateLog.addElement("AppModule").setText(appModule);
		operateLog.addElement("OpType").setText(opType);
		operateLog.addElement("OpText").setText(opText);
		operateLog.addElement("Ticket").setText(ticket);
		operateLog.addElement("OptObj").setText(optObj);
		operateLog.addElement("LogLevel").setText(logLevel);
		operateLog.addElement("MasterAcc").setText(masterAcc);

		return document.asXML();

	}

	//@Action("treasuryLog2")
	public void treasuryLog2() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String treasuryId = request.getParameter("treasuryId");
		String subUser = request.getParameter("subUser");
		String logType = request.getParameter("logType");
		String ticket = (String) request.getSession().getAttribute("ticket");// ticket从4A获取
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		String logTime = format.format(new Date());
		String status = request.getParameter("status");
		String app = request.getParameter("app");
		String sip = request.getRemoteAddr();
		String appModule = request.getParameter("appModule");
		String opType = request.getParameter("opType");
		String opText = request.getParameter("opText");
		String optObj = request.getParameter("optObj");
		String logLevel = request.getParameter("logLevel");
		String masterAcc = request.getParameter("masterAcc");

		String resultCodeStr = "";
		try {
			String inputXml = getLogXml2(treasuryId, busCode, sceneId, logType,
					logTime, subUser, status, app, sip, appModule, opType,
					opText, ticket, optObj, logLevel, masterAcc);
			String result = TreasuryService.treasuryLog(inputXml);
			System.out.println("Auth:inputXml:" + inputXml);
			System.out.println("Auth:result:" + result);
			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
			resultCodeStr = resultCode.getText();
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().write(resultCodeStr);
	}

	@SuppressWarnings("unused")
	private String getLogXml2(String treasuryId, String busCode,
			String sceneId, String logType, String logTime, String subUser,
			String status, String app, String sip, String appModule,
			String opType, String opText, String ticket, String optObj,
			String logLevel, String masterAcc)
			throws UnsupportedEncodingException {
		appModule = URLDecoder.decode(appModule, "UTF-8");
		opText = URLDecoder.decode(opText, "UTF-8");
		optObj = URLDecoder.decode(optObj, "UTF-8");
		subUser=URLDecoder.decode(subUser, "UTF-8");
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("Treasury");
		root.addElement("TreasuryId").setText(treasuryId);
		root.addElement("BusCode").setText(busCode);
		root.addElement("SceneId").setText(sceneId);
		root.addElement("LogType").setText(logType);
		Element operateLog = root.addElement("OperateLog");
		operateLog.addElement("LogTime").setText(logTime);
		operateLog.addElement("SubUser").setText(subUser);
		operateLog.addElement("Status").setText(status);
		operateLog.addElement("App").setText(app);
		operateLog.addElement("Sip").setText(sip);
		operateLog.addElement("AppModule").setText(appModule);
		operateLog.addElement("OpType").setText(opType);
		operateLog.addElement("OpText").setText(opText);
		operateLog.addElement("Ticket").setText(ticket);
		operateLog.addElement("OptObj").setText(optObj);
		operateLog.addElement("LogLevel").setText(logLevel);
		operateLog.addElement("MasterAcc").setText(masterAcc);

		return document.asXML();

	}
    
	//@Action("getWorkOrderList")
	public void getWorkOrderList() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String applyMaster = request.getParameter("applyMaster");
		String applyslave = "";
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		if (userInfo != null) {
			applyslave = userInfo.getUser().getUserIdAccounts();
		}
		JSONObject jo = new JSONObject();
		String resultCodeStr = "";
		try {
			String inputXml = getWorkOrderListInputXml(busCode, sceneId, applyMaster, applyslave);
			System.out.println("Requrest:inputXml:"+inputXml);
			String result="<Result><ResultCode>0</ResultCode><ResultMessage>调用接口成功</ResultMessage>" +
					"<OrderList><Order><Orderid>20014</Orderid><OrderType>单次工单</OrderType><OrderName>报表</OrderName>" +
					"<OrderApplyMaster>anpandi-T300001811</OrderApplyMaster><OrderDoMaster>anpandi-T300001811</OrderDoMaster>" +
					"<OrderStatus>有效</OrderStatus><OrderDes>工单描述</OrderDes></Order></OrderList></Result>";
			//String result = TreasuryService.getWorkOrderList(inputXml);
			System.out.println("Requrest:result:"+result);
			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
//			Element treasuryId = root.element("TreasuryId");
			Element orderList = root.element("OrderList");
			List userList = orderList.elements();
			resultCodeStr = resultCode.getText();
			
			JSONArray usersInfo = new JSONArray();
			for(int i=0;i<userList.size();i++){
				Element user = (Element)userList.get(i);
				JSONObject account = new JSONObject();
				account.put("Orderid",user.element("Orderid").getText());
				account.put("OrderName",user.element("OrderName").getText());
				usersInfo.add(account);
			}
			jo.put("ResultCode", resultCodeStr);
			jo.put("OrderList", usersInfo);
			
			if("1000".equals(resultCodeStr)){
				treasuryLog2();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter writer = response.getWriter();
		writer.write(jo.toString());
		writer.flush();
		writer.close();
		
	}
	/**
	 * 金库场景工单列表查询入参
	 * 
	 * @param busCode
	 * @param sceneId
	 * @param applayMaster
	 * @param applyslave
	 * @return
	 */
	private String getWorkOrderListInputXml(String busCode, String sceneId,
			String applyMaster, String applyslave) {
		Document document = DocumentHelper.createDocument();
		Element orders = document.addElement("Orders");
		Element busCodeElm = orders.addElement("BusCode");
		busCodeElm.setText(busCode);
		Element sceneIdElm = orders.addElement("SceneId");
		sceneIdElm.setText(sceneId);
		Element applyMasterElm = orders.addElement("ApplyMaster");
		applyMasterElm.setText(applyMaster);
		Element applyslaveElm = orders.addElement("Applyslave");
		applyslaveElm.setText(applyslave);
		return document.asXML();
	}
	/**
	 * 金库场景工单校验接口
	 * @param busCode
	 * @param sceneId
	 * @param orderType
	 * @param orderid
	 * @param applayMaster
	 * @param applyslave
	 * @return
	 */
	//@Action("getValidateOrder")
	public void getValidateOrder() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		String busCode = request.getParameter("busCode");
		String sceneId = request.getParameter("sceneId");
		String orderType = request.getParameter("orderType");
		String orderid = request.getParameter("orderid");
		String applyMaster = request.getParameter("applyMaster");
		String applyslave = "";
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		if (userInfo != null) {
			applyslave = userInfo.getUser().getUserIdAccounts();
		}
		orderType = URLDecoder.decode(orderType, "UTF-8");
		JSONObject jo = new JSONObject();
		String resultCodeStr = "";
		try {
			String inputXml = getValidateOrderInputXml(busCode, sceneId,orderType,orderid, applyMaster, applyslave);
			System.out.println("Requrest:inputXml:"+inputXml);
			String result = "<Result><ResultCode>0</ResultCode><ResultMessage>调用接口成功</ResultMessage></Result>";
			//String result = TreasuryService.getWorkOrderList(inputXml);
			System.out.println("Requrest:result:"+result);
			Document resDoc = DocumentHelper.parseText(result);
			Element root = resDoc.getRootElement();
			Element resultCode = root.element("ResultCode");
			resultCodeStr = resultCode.getText();
			if ("9999".equals(resultCodeStr)) {
				resultCodeStr = "0";
			}

			if ("1".equals(resultCodeStr)) {
				resultCodeStr = root.element("ResultMessage").getText();
				treasuryLog();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().write(resultCodeStr);
	}
	/**
	 * 金库场景工单校验接口入参
	 * @param busCode
	 * @param sceneId
	 * @param orderType
	 * @param orderid
	 * @param applayMaster
	 * @param applyslave
	 * @return
	 */
	@SuppressWarnings("unused")
	private String getValidateOrderInputXml(String busCode,String sceneId,String orderType,String orderid,String applyMaster,String applyslave){
		Document document = DocumentHelper.createDocument();
		Element orders = document.addElement("Orders");
		Element busCodeElm = orders.addElement("BusCode");
		busCodeElm.setText(busCode);
		Element sceneIdElm = orders.addElement("SceneId");
		sceneIdElm.setText(sceneId);
		Element orderTypeElm = orders.addElement("OrderType");
		orderTypeElm.setText(orderType);
		Element orderidElm = orders.addElement("Orderid");
		orderidElm.setText(orderid);
		Element applyMasterElm = orders.addElement("ApplyMaster");
		applyMasterElm.setText(applyMaster);
		Element applyslaveElm = orders.addElement("Applyslave");
		applyslaveElm.setText(applyslave);
		return document.asXML();
	}
	public String getTName() {
		return tName;
	}

	public void setTName(String name) {
		tName = name;
	}

}
