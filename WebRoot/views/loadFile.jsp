  <%@   page   contentType="text/html;   charset=gbk"   %>  
  <%@   page   import="java.io.*"%>   
  <%@   page   import="java.net.*"%>  
   
  <%
  	File file = null;
	try{
  	   	String urlload =(String)request.getParameter("url");  
	    String filename="";
	    urlload = URLDecoder.decode(urlload,"UTF-8");
		urlload = urlload.replace(";;","&");
		System.out.println("附件下载，文件名为："+urlload);
	    String[] urlarray=urlload.split("/");
		    for(int i=0;i<urlarray.length;i++){
			    if(i==urlarray.length-1){
			    	filename=urlarray[i];
			    }
		    }
	  	//URL   url   =   new   URL(urlload);   
	    //URLConnection   conn   =   url.openConnection();
	    file =new File(urlload);
	    if(file.exists()){
		 // InputStream   inStream   =   conn.getInputStream();
		    FileInputStream inStream = new FileInputStream(file);
		   	// PrintWriter   out=new  PrintWriter(response.getOutputStream());    
		      OutputStream   output=response.getOutputStream();   
		      response.reset();     
		      response.setContentType("bin");   
		      if(file.getName()!=null||!"".equals(file.getName())){
		      	filename=file.getName();
		      }
		      response.addHeader("Content-Disposition","attachment;   filename=\""   + new String(filename.getBytes("gbk"),"ISO-8859-1")   +   "\"");   
		  	
		      //循环取出流中的数据     
		      byte[] b = new byte[2048];     
		      int len;     
		      while((len=inStream.read(b))>0) 
		      {    
		    	  output.write(b,0,len); 
		      }
		      inStream.close();
		      output.flush();
		      output.close();
		      
	    }
     }catch(Exception e){
     	e.printStackTrace();
     }

  %>