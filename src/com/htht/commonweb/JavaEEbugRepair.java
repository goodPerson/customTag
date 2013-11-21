package com.htht.commonweb;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.util.Map;

import ognl.MethodAccessor;
import ognl.MethodFailedException;
import ognl.OgnlRuntime;


/**
 * @author yanjianzhong(yjz_ok@163.com) 2013/08/08
 * @版权所有,转载请标明出处. http://blog.csdn.net/jzshmyt
 * download : http://jskfs.googlecode.com/files/struts2_(016_017)_bug_repair.rar
 */
public class JavaEEbugRepair{
	/*
	 * 官方描述：
	 * S2-016：https://cwiki.apache.org/confluence/display/WW/S2-016
	 * S2_016 bug repair
	 */
	private static S2_0XX s2_016 = new S2_0XX();
	

	/*
	 *  修改 ognl.Ognl#parseExpression,调用 check_s2_016 方法
	 *  public static Object parseExpression(String expression)throws OgnlException
	 *	{
	 *		  //modify point begin
	 *		  if(JavaEEBug.check_s2_016(expression)){ 
	 *				return null 
	 *		  }
	 *		  //modify point end
	 *	      try {
	 *	          OgnlParser parser = new OgnlParser(new StringReader(expression));
	 *	          return parser.topLevelExpression();
	 *	      } catch (ParseException e) {
	 *	          throw new ExpressionSyntaxException(expression, e);
	 *	      } catch (TokenMgrError e) {
	 *	          throw new ExpressionSyntaxException(expression, e);
	 *	      }
	 *	  }
	 */
	public static boolean repair_s2_016(String expression){
		return s2_016.check(expression);
	}
	/*
    * 在servlet/struts/spring 任何一个框架的listener中调用
	*/
	public static void initRepair_S2_016(){
		OgnlRuntime.setMethodAccessor(Runtime.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(System.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(ProcessBuilder.class,new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(OgnlRuntime.class, new NoMethodAccessor());
		
		//io敏感操作
		OgnlRuntime.setMethodAccessor(OutputStream.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(InputStream.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(File.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(DataOutput.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(DataInput.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(Reader.class, new NoMethodAccessor());
		OgnlRuntime.setMethodAccessor(Writer.class, new NoMethodAccessor());
		
		s2_016 = new S2_0XX(){
			public boolean check(String expression){
			    String evalMethod[] = {"Runtime", "ProcessBuilder",
			    		"java.io.File","new File",
			    		"OutputStream","InputStream"};
			    String methodString = null;
			    methodString = expression.toLowerCase();
			    
			    for (int i = 0; i < evalMethod.length; i++) {
			    	
			        if (methodString.indexOf(evalMethod[i].toLowerCase()) > -1) {
			            System.out.print("|OGNL正在执行恶意语句|" + methodString + "|看到这个消息，请联系安全工程师！！！");
			            return true;
			        }
			    }
			    return false;
			}
		};
		
	}
	
	/*
	 * S2-017：https://cwiki.apache.org/confluence/display/WW/S2-017
	 * S2_017 bug repair
	 */
	private static S2_0XX s2_017 = new S2_0XX();
	
    /*
	* Call by org.apache.struts2.dispatcher.mapper.DefaultActionMapper#handleSpecialParameters 
	* Repair Example :
	* public void handleSpecialParameters(HttpServletRequest request, ActionMapping mapping)
	* {
	*	    Set uniqueParameters = new HashSet();
	*	    Map parameterMap = request.getParameterMap();
	*	    Iterator iterator = parameterMap.keySet().iterator();
	*	    while (iterator.hasNext()) {
	*	      String key = (String)iterator.next();
	*	
	*	      if ((key.endsWith(".x")) || (key.endsWith(".y"))) {
	*	        key = key.substring(0, key.length() - 2);
	*	      }
	*	      //modify point begin
	*	      if (JavaEEBug.check_s2_017(key)) {
	*	          return;
	*	      }
	*	      //modify point end
	*	      if (!uniqueParameters.contains(key)) {
	*	        ParameterAction parameterAction = (ParameterAction)this.prefixTrie.get(key);
	*	
	*	        if (parameterAction != null) {
	*	          parameterAction.execute(key, mapping);
	*	          uniqueParameters.add(key);
	*	          break;
	*	        }
	*	      }
	*	    }
	*	  }
	*/
	public static boolean repair_s2_017(String key){
		return s2_017.check(key);
	}
	
	/*
    * 在servlet/struts/spring 任何一个框架的listener中调用
	*/
	public static void initRepair_S2_017(){
		s2_017 = new S2_0XX(){
			public boolean check(String key){
				return (key.contains("redirect:")) || (key.contains("redirectAction:")) || (key.contains("action:"));
			}
		};
	}
}

/**
 *  漏洞验证修复之基类
 *  说明：
 *  漏洞修复代码的实现逻辑,非侵入式设计。
 *  当listener中未调用initRepair_S2_016、initRepair_S2_017进行漏洞调用初始化时,
 *  保持Ognl和DefaultActionMapper修复前源码等价逻辑.
 * 
 */
class S2_0XX {
	public boolean check(String key){
		return false;
	}
}


class NoMethodAccessor implements MethodAccessor {
	public NoMethodAccessor() {
	}

	public Object callStaticMethod(Map context, Class targetClass,
			String methodName, Object[] args) throws MethodFailedException {
		if(targetClass!=null){
			System.out.println("拦截并拒绝敏感操作: static "+targetClass.getName()+"#"+methodName);
		}
		throw new MethodFailedException("do not run", methodName, null);
	}

	public Object callMethod(Map context, Object target, String methodName,
			Object[] args) throws MethodFailedException {
		// TODO Auto-generated method stub
		if(target!=null){
			System.out.println("拦截并拒绝敏感操作:"+target.getClass().getName()+"#"+methodName);
		}
		throw new MethodFailedException("do not run", methodName,null);
	}
}
