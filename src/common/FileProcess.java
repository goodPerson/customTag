package common;

import java.io.File;

public class FileProcess {
	public final static String EXPORT_PATH = "D:/custom";
	
	/**
	 * ĳ�ļ����µ��ļ�������һСʱδ�Ķ���ɾ��
	 * @param dirpath
	 */
	public static void deleteExpireFile(String dirpath){
		File dir = new File(dirpath);
		if(dir.exists()){
			File[] files = dir.listFiles();
			for(File file:files){
				long lastTime = file.lastModified();
				long currentTime = System.currentTimeMillis();
				if(lastTime!=0L){//�ļ����ڲ�����io����
					long gap = currentTime - lastTime;
					gap = gap/(1000*60*60); //Сʱ
					if(gap>=1L){
						file.delete();
					}
				}
			}
		}
	}
}