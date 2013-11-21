package dao.push;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.push.product;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class TestImpl extends JdbcDaoSupport{
	public List<product> findAllPrivilege(String creat_unit,String type,String name,String combo_region,String Operate_type,String spname,String spcode) {
		String sql="";
		String unit="";
		if("1".equals(Operate_type)){
			if ("HB".equals(creat_unit)) {
				unit="CREAT_UNIT in ('HB') and ";
			}else {
				//				unit="CREAT_UNIT in ('"+creat_unit+"','HB') and ";
				unit="CREAT_UNIT in ('HB') and ";
			}
		}else{
			unit="CREAT_UNIT ='"+combo_region+"'and ";
		}
		if ("".equals(spcode)) {
			spcode="";
		}else {
			spcode="AND SP_CODE = '"+spcode+"'";
		}
		if("prevelige".equals(type)){
			sql="SELECT MARKT_SOLUTION_NAME as PRODUCT,MARKT_SOLUTION_ID as VALUE1,MARKT_SOLUTION_TYPE as VALUE2 FROM MK_VGOP.TB_DIM_MARKT_PRIVILEGE_INFO   WHERE "+unit+" (MARKT_SOLUTION_NAME like '%"+name+"%' or MARKT_SOLUTION_ID='"+name+"')  order by MARKT_SOLUTION_ID fetch first 500 rows only";//and MARKT_SOLUTION_ID not in (select  MARKT_SOLUTION_ID from MK_VGOP.TB_DIM_MARKT_PRODUCT_PRIVILEGE_INFO)
		}else if("product".equals(type)){
			//sql="SELECT PRD_NAME AS PRODUCT,PRODUCT_CD AS VALUE1,PRD_TYPE AS VALUE2 FROM MK_VGOP.TB_DIM_MARKT_PRODUCT_INFO WHERE "+unit+" (PRD_NAME like '%"+name+"%' or PRODUCT_CD='"+name+"') and PRODUCT_CD not in (select PRODUCT_CD from MK_VGOP.TB_DIM_MARKT_PRODUCT_PRIVILEGE_INFO group by PRODUCT_CD) order by  PRODUCT_CD fetch first 300 rows only";	
			sql="SELECT PRD_NAME AS PRODUCT,PRODUCT_CD AS VALUE1,case when (PRODUCT_CD in (select PRODUCT_CD from MK_VGOP.TB_DIM_MARKT_PRODUCT_PRIVILEGE_INFO group by PRODUCT_CD)) then '1' else '0' end as VALUE2 FROM MK_VGOP.TB_DIM_MARKT_PRODUCT_INFO WHERE "+unit+" (PRD_NAME like '%"+name+"%' or PRODUCT_CD='"+name+"') order by  PRODUCT_CD fetch first 500 rows only"; 
		}else if ("pre_product".equals(type)){
			sql="SELECT PRD_NAME AS PRODUCT,PRODUCT_CD AS VALUE1,PRD_TYPE AS VALUE2 FROM MK_VGOP.TB_DIM_MARKT_PRODUCT_INFO WHERE "+unit+" (PRD_NAME like '%"+name+"%' or PRODUCT_CD='"+name+"') and PRODUCT_CD in (select PRODUCT_CD from MK_VGOP.TB_DIM_MARKT_PRODUCT_PRIVILEGE_INFO group by PRODUCT_CD) order by  PRODUCT_CD fetch first 500 rows only";
		}else{
			//sql="SELECT VC_BIZNAME AS PRODUCT,SP_BIZ_CODE AS VALUE1,SP_CODE AS VALUE2 FROM MK_VGOP.TB_DIM_MARKT_SP_BIZ_INFO where (VC_BIZNAME like'"+name+"%' OR SP_BIZ_CODE ='"+name+"')  order by SP_CODE fetch first 300 rows only";
			// OR A.SP_NAME LIKE '"+spname+"%'
			sql="SELECT VC_BIZNAME AS PRODUCT,SP_BIZ_CODE AS VALUE1,SP_CODE AS VALUE2 FROM MK_VGOP.TB_DIM_MARKT_SP_BIZ_INFO " +
				"where (VC_BIZNAME LIKE '%"+name+"%' OR SP_BIZ_CODE = '"+name+"') "
				+spcode +
				" GROUP BY VC_BIZNAME,SP_BIZ_CODE,SP_CODE order by SP_BIZ_CODE fetch first 300 rows only";
			}
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<product> productList= new ArrayList<product>();
		for(Map<String,Object> row:list){
			product cust= new product();
			cust.setProduct((String)row.get("PRODUCT"));
			cust.setFvalue((String)row.get("VALUE1"));
			cust.setSvalue((String)row.get("VALUE2"));
			productList.add(cust);
		}

		return productList;
	}

	public List<Object[]> spnameList(String sp_code) {
		String sql="SELECT A.SP_CODE,A.SP_NAME FROM DW.TD_STL_SP_CODE_D A INNER JOIN MK_VGOP.TB_DIM_MARKT_SP_BIZ_INFO B ON A.SP_CODE=B.SP_CODE WHERE A.SP_CODE='"+sp_code+"' OR A.SP_NAME LIKE '%"+sp_code+"%' GROUP BY A.SP_CODE,A.SP_NAME ORDER BY A.SP_CODE";
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<Object[]> tmp=new ArrayList<Object[]>();
		for (Map<String,Object>row:list) {
			Object[] objects={(String)row.get("sp_code"),(String)row.get("sp_name")};
			tmp.add(objects);
		}
		return tmp;
	}

	public List<product> findpreproduct(String productcd,String name){
		String sql="select distinct a.MARKT_SOLUTION_ID AS VALUE1,b.MARKT_SOLUTION_NAME AS PRODUCT from MK_VGOP.TB_DIM_MARKT_PRODUCT_PRIVILEGE_INFO a inner join MK_VGOP.TB_DIM_MARKT_PRIVILEGE_INFO b on a.MARKT_SOLUTION_ID=b.MARKT_SOLUTION_ID where a.PRODUCT_CD='"+productcd+"' and (b.MARKT_SOLUTION_NAME like '%"+name+"%' or a.MARKT_SOLUTION_ID ='"+name+"')";
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<product> productList= new ArrayList<product>();
		for(Map<String,Object> row:list){
			product cust= new product();
			cust.setProduct((String)row.get("PRODUCT"));
			cust.setFvalue((String)row.get("VALUE1"));
			cust.setSvalue((String)row.get("VALUE1"));
			productList.add(cust);
		}

		return productList;
	}

	public List<Object[]> getsp_nameList() {
		String sql="SELECT A.SP_CODE,A.SP_NAME FROM DW.TD_STL_SP_CODE_D A LEFT JOIN MK_VGOP.TB_DIM_MARKT_SP_BIZ_INFO B ON A.SP_CODE=B.SP_CODE GROUP BY A.SP_CODE,A.SP_NAME ";//FETCH FIRST 100 ROWS ONLY
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<Object[]> tmp=new ArrayList<Object[]>();
		for(Map<String,Object> row:list){
			Object[] object={(String)row.get("SP_CODE"),(String)row.get("SP_NAME")};	
			tmp.add(object);
		}
		return tmp;
	}

}
