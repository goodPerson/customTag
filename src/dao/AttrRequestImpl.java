package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.AttrRequest;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import dao.Idao.IAttrRequest;

public class AttrRequestImpl extends JdbcDaoSupport implements IAttrRequest {

	public boolean AddAttrRequest(AttrRequest attr) {
		// TODO Auto-generated method stub
		boolean boolFlag=false;
		try{
			String sql="insert into MK_VGOP.TB_ATTR_REQUEST ( ATTR_REQUEST_ID,ATTR_REQUEST_PERSON_ID,ATTR_REGION_NAME,ATTR_REGION_ID,"
			          +"ATTR_REQUEST_NAME,ATTR_NAME, ATTR_REASON, ATTR_APPORVER,ATTR_REMARK)  "
			          +" values ('"+attr.getAttrRequestIid()+"','"+attr.getAttrRequestPersonId()+"','"+attr.getAttrRegionName()+"',"+attr.getAttrRegionId()+","
			          +"'"+attr.getAttrRequestName()+"','"+attr.getAttrName()+"','"+attr.getAttrReason()+"','"+attr.getAttrApporver()+"','"+attr.getAttrRemark()+"') ";
			this.getJdbcTemplate().update(sql);
			boolFlag=true;
		}catch(Exception e){
			e.printStackTrace();
		}		
		return boolFlag;
	}
    
	public List<AttrRequest> listAttrR(AttrRequest attr) {
		// TODO Auto-generated method stub
		String sql = "select ATTR_REQUEST_ID,ATTR_REQUEST_PERSON_ID,ATTR_REGION_NAME,ATTR_REGION_ID"
				+ " ATTR_REQUEST_NAME,ATTR_NAME, ATTR_REASON, ATTR_APPORVER,ATTR_REMARK,ATTR_REQUEST_NAME,ATTR_STATE"
				+ "  from MK_VGOP.TB_ATTR_REQUEST where ATTR_REQUEST_PERSON_ID='"
				+ attr.getAttrRequestPersonId() + "' order by ATTR_REQUEST_ID desc with ur";
		return addList( sql);
	}

	public List<AttrRequest> listAttrRWait(AttrRequest attr) {
		// TODO Auto-generated method stub
		String sql = "select ATTR_REQUEST_ID,ATTR_REQUEST_PERSON_ID,ATTR_REGION_NAME,ATTR_REGION_ID"
				+ " ATTR_REQUEST_NAME,ATTR_NAME, ATTR_REASON, ATTR_APPORVER,ATTR_REMARK,ATTR_REQUEST_NAME,ATTR_STATE"
				+ "  from MK_VGOP.TB_ATTR_REQUEST where ATTR_APPORVER='"
				+ attr.getAttrApporver() + "' and ATTR_STATE=0 order by ATTR_REQUEST_ID desc with ur";
		return addList( sql);
	}

	public List<AttrRequest> listAttrRalready(AttrRequest attr) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String sql = "select ATTR_REQUEST_ID,ATTR_REQUEST_PERSON_ID,ATTR_REGION_NAME,ATTR_REGION_ID"
				+ " ATTR_REQUEST_NAME,ATTR_NAME, ATTR_REASON, ATTR_APPORVER,ATTR_REMARK,ATTR_REQUEST_NAME,ATTR_STATE"
				+ "  from MK_VGOP.TB_ATTR_REQUEST where ATTR_APPORVER='"
				+ attr.getAttrApporver() + "' and ATTR_STATE!=0 order by ATTR_REQUEST_ID desc with ur";
		return addList( sql);
	}
	
	public AttrRequest findAttrReq(String reqId) {
		// TODO Auto-generated method stub
		String sql="select ATTR_REQUEST_ID,ATTR_REQUEST_PERSON_ID,ATTR_REGION_NAME,ATTR_REGION_ID"
				+ " ATTR_REQUEST_NAME,ATTR_NAME, ATTR_REASON, ATTR_APPORVER,ATTR_REMARK,ATTR_REQUEST_NAME,ATTR_STATE"
				+ "  from MK_VGOP.TB_ATTR_REQUEST where ATTR_REQUEST_ID='"+reqId+"'";
		List<AttrRequest> listAttrReq=addList(sql);
		AttrRequest attrReq;
		if(listAttrReq.size()>=1){
			 attrReq=listAttrReq.get(0);			
		}else{
			attrReq=null;
		}
		return attrReq;
	}
	
	public boolean updateAttr(AttrRequest attr) {
		// TODO Auto-generated method stub
		boolean boolFlag=false;
		try{
			String sql="update MK_VGOP.TB_ATTR_REQUEST set ATTR_STATE="+attr.getAttrState()+" where ATTR_REQUEST_ID='"+attr.getAttrRequestIid()+"'";
			this.getJdbcTemplate().update(sql);
			boolFlag=true;
		}catch(Exception e){
			e.printStackTrace();
		}		
		return boolFlag;
	}
	
	private List<AttrRequest> addList(String sql){
		List<Map<String, Object>> tempList = this.getJdbcTemplate()
				.queryForList(sql);
		List<AttrRequest> listAttrReq = new ArrayList<AttrRequest>();
		for (Map<String, Object> obj : tempList) {
			AttrRequest attrReq = new AttrRequest();
			attrReq.setAttrApporver((String) obj.get("ATTR_APPORVER"));
			attrReq.setAttrName((String) obj.get("ATTR_NAME"));
			attrReq.setAttrReason((String) obj.get("ATTR_REASON"));
			attrReq.setAttrRegionId((Integer) obj.get("ATTR_REGION_ID"));
			attrReq.setAttrRegionName((String) obj.get("ATTR_REQUEST_NAME"));
			attrReq.setAttrRemark((String) obj.get("ATTR_REMARK"));
			attrReq.setAttrRequestIid((String) obj.get("ATTR_REQUEST_ID"));
			attrReq.setAttrRequestName((String) obj.get("ATTR_REGION_NAME"));
			attrReq.setAttrRequestPersonId((String) obj.get("ATTR_REQUEST_PERSON_ID"));
			attrReq.setAttrState((Integer) obj.get("ATTR_STATE"));
			listAttrReq.add(attrReq);
		}
		return listAttrReq;
	}



   

	
}
