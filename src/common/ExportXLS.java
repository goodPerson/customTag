package common;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import module.CustTagAndGroupMonitorM;



public class ExportXLS<T> {
	protected   T t;
	/**下载渠道经理详细信息所需要的参数 */
	protected String contentType;//内容类型
	protected FileInputStream downloadFile;//
	protected String fileName;//文件名
   
	/*
	public ExportXLS(T t){
		this.t=t;
	}
	*/
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public  void exportMonthPiece( List l,String coluns,String title ) throws Exception{
		String  exportType = "xls";
		// 定义表头
//		String header ="日期 县区 姓名 员工编号 负责区域 渠道编码 渠道名称 计件项目大类名称 计件项目小类名称 月发展量 月发展积分 月发展薪酬  "
		String header = coluns;
		// 获取数据
//		List l = exportBasicInfoMList;
	//	List<TBMangerPieceSmallMonth> l=monthservice.findMagerPieceMonthNoPage(statisDate, countyName, name, 
	//			                                                               id, prncpChnlId, prncpChnlName);
		List<T> a=l;
		List<Object[]> datalist = new ArrayList<Object[]>();
		for (int i = 0; i < a.size(); i++) {
			T nt = (T) a.get(i);
			Gen<T> g=new Gen<T>(nt);
			
			
			Object[] obj =g.showTypeName() ;
			 
			datalist.add(obj);
		}
		FileInputStream result = PrintExcelUtil.getDownloadFile(exportType,
				title, title, header, datalist);
		contentType = "application/vnd.ms-excel;charset=utf-8";
		downloadFile = result;
		fileName = title+".xls";
		fileName = new String(fileName.getBytes(), "ISO8859-1");
		//return "monthDownLoad" ;		
	}
	/*
	public static void main(String[] args) throws Exception{
		System.out.println("dd");
		String header ="日期 县区 姓名 员工编号 负责区域 渠道编码 渠道名称 计件项目大类名称 计件项目小类名称 月发展量 月发展积分 月发展薪酬  ";
		String title="测试";
		CustTagAndGroupMonitorM ctagm=new CustTagAndGroupMonitorM();
		ctagm.setAccessCnt(25);
		List<CustTagAndGroupMonitorM> lc=new ArrayList<CustTagAndGroupMonitorM>();
		int i=0;
		while(i<3){
			lc.add(ctagm);
			i++;
		}
		//ExportXLS<CustTagAndGroupMonitorM> e=new ExportXLS<CustTagAndGroupMonitorM>(ctagm);
		ExportXLS<CustTagAndGroupMonitorM> e=new ExportXLS();
		e.exportMonthPiece( lc, header, title);
		
	}
	*/
	public T getT() {
		return t;
	}
	public void setT(T t) {
		this.t = t;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public FileInputStream getDownloadFile() {
		return downloadFile;
	}
	public void setDownloadFile(FileInputStream downloadFile) {
		this.downloadFile = downloadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
   
	
}
