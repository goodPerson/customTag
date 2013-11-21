package treasury;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * 金库模式Service工具类
 * @author wly
 *
 */
public class TreasuryService {// http://133.96.60.63:8081/csp/services/Venus4AService?wsdl //http://133.96.5.13/services/Venus4AService?wsdl //http://133.96.5.77/tbu/services/Venus4AService?wsdl/http://133.96.100.224/csp/services/Venus4AService?wsdl
	    //http://133.96.100.224/csp/services/Venus4AService
//	public static String targetEndPoint = "http://133.96.10.224/csp/services/Venus4AService";   //生产环境路径
	public static String targetEndPoint = "http://www.baidu.com";   //测试环境路径
	/**
	 * 金库请求
	 * @param inputXml
	 * @return
	 */
	public static String treasuryRequest(String inputXml) throws Exception{
		try {
			
			Service service = new Service();
			Call call = (Call)service.createCall();
			call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
			call.setOperationName("treasuryRequest");
			call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
			call.setReturnClass(String.class);
//			String result = (String)call.invoke(new Object[]{inputXml});
			String result ="<?xml version=\"1.0\" encoding=\"UTF-8\"?><Treasury><ResultCode>9999</ResultCode><ResultMessage>调用接口成功</ResultMessage><TreasuryId>124889</TreasuryId><Switch>0</Switch><JointUserNum>1</JointUserNum><AuthFailCount>3</AuthFailCount><JointUsers><JointUser><Account>zhangsan-001</Account><RealName>张三</RealName></JointUser><JointUser><Account>lisi-001</Account><RealName>李四</RealName></JointUser></JointUsers><AuthorizeList><Authorize>1</Authorize></AuthorizeList></Treasury>";
			return result;
		} catch (Exception e) {
			return "1111";
		}
	} 
	
	/**
	 * 金库认证初始化
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String treasuryAuthInit(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("treasuryAuthInit");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
		//String result = (String)call.invoke(new Object[]{inputXml});
		String result="<?xml version=\"1.0\" encoding=\"UTF-8\"?><Treasury><ResultCode>0</ResultCode><ResultMessage>调用接口成功</ResultMessage></Treasury>";
		return result;
	} 
	
	/**
	 * 金库认证
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String treasuryAuth(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("treasuryAuth");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
//		String result = (String)call.invoke(new Object[]{inputXml});
		String result = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Treasury><ResultCode>0</ResultCode><ResultMessage>调用接口成功</ResultMessage></Treasury>";
		return result;
	} 
	
	/**
	 * 金库日志同步
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String treasuryLog(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("treasuryLog");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
		String result = (String)call.invoke(new Object[]{inputXml});
		return result;
	} 
	
	public static String treasuryLog(HttpServletRequest request,String status,String app,String appModule,String opType,String opText,String optObj,String logLevel) {
		String result = "";
		try {
			HttpSession session = request.getSession();
			String treasuryId = (String) session.getAttribute("treasuryTreasuryId");//金库编号
			String busCode = (String) session.getAttribute("treasuryBusCode");//业务系统编号
			String sceneId = (String) session.getAttribute("treasurySceneId");//场景Id
			String masterAcc = (String) session.getAttribute("treasuryApplyMaster");//主账号
			String subUser = (String) session.getAttribute("treasuryApplySlave");//从账号
			String logType = (String) session.getAttribute("treasuryApplyLogType");//从账号
			if(treasuryId==null ||busCode==null||sceneId==null||masterAcc==null||subUser==null){
				return "";
			}
			if(logType==null){
				logType="1";
			}
			String ticket = (String) request.getSession().getAttribute("ticket");//ticket从4A获取" +
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		    String logTime = format.format(new Date());
		    
		    String sip = request.getRemoteAddr();
			String inputXml = makeLogInputXml(treasuryId, busCode, sceneId,logType, logTime, subUser,status, app, sip, appModule, opType, opText, ticket, optObj, logLevel, masterAcc);
			System.out.println("$$$$LogInputXml:"+inputXml);
			
			result = treasuryLog(inputXml);
			//由于每查询or导出一次就申请一次，所以这里可以用完就置空
			session.setAttribute("treasuryTreasuryId",null);//金库编号
			session.setAttribute("treasuryBusCode",null);//业务系统编号
			session.setAttribute("treasurySceneId",null);//场景Id
			session.setAttribute("treasuryApplyMaster",null);//主账号
			session.setAttribute("treasuryApplySlave",null);//从账号
			//session.setAttribute("treasuryApplyLogType",null);//从账号
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 
	 * 构造日志入参
	 * @param treasuryId 金库编号
	 * @param busCode 业务系统编号
	 * @param sceneId 场景ID
	 * @param logTime 日志产生时间
	 * @param subUser 从帐号名称
	 * @param app 应用资源名称
	 * @param sip 用户端IP
	 * @param appModule 业务模块
	 * @param opType 用户操作类型
	 * @param opText 用户操作内容
	 * @param ticket 用户票据
	 * @param optObj 操作对象
	 * @param logLevel 日志级别
	 * @param masterAcc 主账号
	 * @return
	 */
	public static String makeLogInputXml(String treasuryId,String busCode,String sceneId,String logType,String logTime,String subUser,String status,String app,String sip,
			String appModule,String opType,String opText,String ticket,String optObj,String logLevel,String masterAcc){
		
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

	/**
	 * 金库日志同步
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String treasuryLog2(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("treasuryLog2");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
		String result = (String)call.invoke(new Object[]{inputXml});
		return result;
	} 
	
	public static String treasuryLog2(HttpServletRequest request,String status,String app,String appModule,String opType,String opText,String optObj,String logLevel) {
		String result = "";
		try {
			HttpSession session = request.getSession();
			String treasuryId = (String) session.getAttribute("treasuryTreasuryId");//金库编号
			String busCode = (String) session.getAttribute("treasuryBusCode");//业务系统编号
			String sceneId = (String) session.getAttribute("treasurySceneId");//场景Id
			String masterAcc = (String) session.getAttribute("treasuryApplyMaster");//主账号
			String subUser = (String) session.getAttribute("treasuryApplySlave");//从账号
			String logType = (String) session.getAttribute("treasuryApplyLogType");//从账号
			if(treasuryId==null ||busCode==null||sceneId==null||masterAcc==null||subUser==null ||logType==null){
				return "";
			}
			if(logType==null){
				logType="1";
			}
			String ticket = (String) request.getSession().getAttribute("ticket");//ticket从4A获取" +
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		    String logTime = format.format(new Date());
		    
		    String sip = request.getRemoteAddr();
			String inputXml = makeLogInputXml2(treasuryId, busCode, sceneId,logType, logTime, subUser,status, app, sip, appModule, opType, opText, ticket, optObj, logLevel, masterAcc);
			System.out.println("$$$$LogInputXml:"+inputXml);
			
			result = treasuryLog(inputXml);
			//由于每查询or导出一次就申请一次，所以这里可以用完就置空
			session.setAttribute("treasuryTreasuryId",null);//金库编号
			session.setAttribute("treasuryBusCode",null);//业务系统编号
			session.setAttribute("treasurySceneId",null);//场景Id
			session.setAttribute("treasuryApplyMaster",null);//主账号
			session.setAttribute("treasuryApplySlave",null);//从账号
			session.setAttribute("treasuryApplyLogType",null);//从账号
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 
	 * 构造日志入参
	 * @param treasuryId 金库编号
	 * @param busCode 业务系统编号
	 * @param sceneId 场景ID
	 * @param logTime 日志产生时间
	 * @param subUser 从帐号名称
	 * @param app 应用资源名称
	 * @param sip 用户端IP
	 * @param appModule 业务模块
	 * @param opType 用户操作类型
	 * @param opText 用户操作内容
	 * @param ticket 用户票据
	 * @param optObj 操作对象
	 * @param logLevel 日志级别
	 * @param masterAcc 主账号
	 * @return
	 */
	public static String makeLogInputXml2(String treasuryId,String busCode,String sceneId,String logType,String logTime,String subUser,String status,String app,String sip,
			String appModule,String opType,String opText,String ticket,String optObj,String logLevel,String masterAcc){
		
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

	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception{
		/*Document document = DocumentHelper.createDocument();
		Element treasury = document.addElement("Treasury");
		Element busCode = treasury.addElement("BusCode");
		busCode.setText("117000");
		Element sceneId = treasury.addElement("SceneId");
		sceneId.setText("001");
		Element applyMaster = treasury.addElement("ApplyMaster");
		applyMaster.setText("jiyongliang-T300000279");
		Element applyslave = treasury.addElement("Applyslave");
		applyslave.setText("pxtest");
		try {
			
			String result = treasuryRequest(document.asXML());
			System.out.println(result);
			Document resultDoc = DocumentHelper.parseText(result);
			Element root = resultDoc.getRootElement();
			Element jointUsers = root.element("JointUsers");
			List userList = jointUsers.elements();
			for(int i=0;i<userList.size();i++){
				Element user = (Element)userList.get(i);
				System.out.println(user.getText());
			}
			String result = treasuryLog(makeLogInputXml("", "", "", "", "", "", "", "", "", "", "", "", "", ""));
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		System.out.println(treasuryRequest(getRequestInputXml("117000","001","jiyongliang-T300000279","pxtest")));
	}
	
	private static String getRequestInputXml(String busCode,String sceneId,String applyMaster,String applyslave){
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
	 * 金库场景工单列表查询
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String getWorkOrderList(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("getWorkOrderList");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
		String result = (String)call.invoke(new Object[]{inputXml});
		return result;
	} 
	private static String getWorkOrderList(String busCode,String sceneId,String applyMaster,String applyslave){
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
	 *金库场景工单校验接口
	 * @param inputXml
	 * @return
	 * @throws Exception
	 */
	public static String getValidateOrder(String inputXml) throws Exception{
		Service service = new Service();
		Call call = (Call)service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(targetEndPoint));
		call.setOperationName("getValidateOrder");
		call.addParameter("inputXml", new QName("http://www.w3.org/2001/XMLSchema", "string"), ParameterMode.IN);
		call.setReturnClass(String.class);
		String result = (String)call.invoke(new Object[]{inputXml});
		return result;
	}
	private static String getValidateOrder(String busCode,String sceneId,String orderType,String orderid,String applyMaster,String applyslave ){
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
}
