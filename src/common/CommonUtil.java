package common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class CommonUtil {
	/**
	 * 接受字符格式化
	 * 去空格
	 * @param reqString
	 * @throws UnsupportedEncodingException 
	 */
	public static String requestFormat(String reqString) throws UnsupportedEncodingException{
		String str=reqString;
		str=URLDecoder.decode(str, "utf-8").trim();		
		return str;
	}

}
