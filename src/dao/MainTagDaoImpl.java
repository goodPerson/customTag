package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import module.Attr;
import module.CustomTag;
import module.MainTag;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class MainTagDaoImpl extends JdbcDaoSupport{
	
	public List<MainTag> listTag(int serv_type,String serv_name){
		
		String sql="select tag_id,tag_name,tag_type,tag_serv_type,tag_class,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,tag_status,tag_url  from MK_VGOP.TB_CUSTOMTAG_INFO  ";		
		switch(serv_type)
		{
		case 0: //ҵ����
			//if(serv_name.equals("GPRS����")){
            // sql+=" where tag_type='GPRS�ײ�'  order by tag_class,is_share";}
			//else{sql+=" where tag_type='��ֵҵ����' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";}
			sql+=" where tag_type='��ֵҵ����' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";
			break;
		case 1://ƫ����
			sql+="where TAG_TYPE='ƫ����' order by TAG_SERV_TYPE,is_share";
			break;
		case 2://�¼���
			sql+="where TAG_TYPE='�¼�' order by TAG_SERV_TYPE,is_share";
			break;
		case 3://�ն���
			sql+="where TAG_TYPE='�ն���'  order by TAG_SERV_TYPE,is_share";
			break;
		case 4://�����
			sql+="where TAG_TYPE='�ͻ����'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 5://��ֵ��
			sql+="where TAG_TYPE='��ֵ��'  order by TAG_SERV_TYPE,is_share";
			break;			
		case 6://����Ȧ��
			sql+="where TAG_TYPE='����Ȧ'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 7://������
			sql+="where TAG_TYPE='����ҵ����'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 8://λ����
			sql+="where TAG_TYPE='λ����'  order by TAG_SERV_TYPE,is_share";
			break;				
			
		}
			List<Map<String,Object>> list= this.getJdbcTemplate().queryForList(sql);
			List<MainTag> tagList= new ArrayList<MainTag>();
			for(Map<String,Object> row:list){
				MainTag tag= new MainTag();
				tag.setTag_id((String)row.get("tag_id"));
				tag.setTag_name((String)row.get("tag_name"));
				tag.setTag_type((String)row.get("tag_type"));
				tag.setTag_serv_type((String)row.get("tag_serv_type"));
				tag.setTag_class((String)row.get("tag_class"));
				tag.setCreate_time((String)row.get("create_time"));
				tag.setEnd_time((String)row.get("end_time"));
				tag.setProfile((String)row.get("profile"));
				tag.setCount_subs((Integer)row.get("count_subs")); 
				tag.setTag_creator((String)row.get("tag_creator"));
				tag.setTag_statement((String)row.get("tag_statement"));
				tag.setTag_region((String)row.get("tag_region"));
				tag.setIs_share((String)row.get("is_share"));
				tag.setTag_url((String)row.get("tag_url"));
				tagList.add(tag);
		}
			return tagList;
	}
		
		


}
