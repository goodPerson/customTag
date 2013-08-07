package common;


import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class Pagination extends JdbcDaoSupport {
	public static final int NUMBERS_PER_PAGE = 10;

  //一页显示的记录数
	private int numPerPage;
	//记录总数
	private int totalRows;
	//总页数
	private int totalPages;
	//当前页码
	private int currentPage;
	//起始行数
	private int startIndex;
	//结束行数
	private int lastIndex;
	//结果集存放List
	private List resultList;
	//JdbcTemplate jTemplate
	private JdbcTemplate jTemplate;

     /**
	　　* 每页显示10条记录的构造函数,使用该函数必须先给Pagination设置currentPage，jTemplate初值
	　　* @param sql oracle语句
	　　*/

	public Pagination(String sql){

		if( jTemplate==null){
			throw new IllegalArgumentException("com.deity.ranking.util.Pagination.jTemplate is null,please initial it first. ");

		}else if(sql.equals("")){

			throw new IllegalArgumentException("com.deity.ranking.util.Pagination.sql is empty,please initial it first. ");
		}

		new Pagination(sql,currentPage,NUMBERS_PER_PAGE,jTemplate);
	}

	/**分页构造函数
	　　* @param sql 根据传入的sql语句得到一些基本分页信息
	　　* @param currentPage 当前页
	　　* @param numPerPage 每页记录数
	　　* @param jTemplate JdbcTemplate实例
	　　*/

	public Pagination(String sql,int currentPage,int numPerPage,JdbcTemplate jTemplate){

	if(jTemplate == null){

	throw new IllegalArgumentException("com.deity.ranking.util.Pagination.jTemplate is null,please initial it first. ");

	}else if(sql == null || sql.equals("")){

	throw new IllegalArgumentException("com.deity.ranking.util.Pagination.sql is empty,please initial it first. ");

	}

	//设置每页显示记录数
	setNumPerPage(numPerPage);
	//设置要显示的页数
	setCurrentPage(currentPage);
	//计算总记录数
	StringBuffer totalSQL = new StringBuffer(" SELECT count(*) FROM ( ");
	totalSQL.append(sql);
	totalSQL.append(" ) totalTable ");
	//给JdbcTemplate赋值
	setJdbcTemplate(jTemplate);
	//总记录数
	setTotalRows(getJdbcTemplate().queryForInt(totalSQL.toString()));
	//计算总页数
	setTotalPages();
	//计算起始行数
	setStartIndex();
	//计算结束行数
	setLastIndex();
	//System.out.println("lastIndex="+lastIndex);//////////////////
	//构造oracle数据库的分页语句
	
	/*SELECT * FROM (
			select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state ,rownumber() over(ORDER BY tag_state desc) AS rn 
			from mk_vgop.tb_tag_approve where (tag_applyer_id ='008' or tag_examiner_id='008') and tag_state in('0','1')
			) as a1 where rn BETWEEN 10 AND 15
			*/
	StringBuffer paginationSQL = new StringBuffer(" SELECT * FROM ( ");
	//paginationSQL.append(" SELECT temp.*  FROM ( ");
	paginationSQL.append(sql);
	//paginationSQL.append(" ) as a1 where a1.rn BETWEEN "+startIndex+" AND "+lastIndex+"");
	paginationSQL.append(" ) as a1 where a1.rn > "+startIndex+" AND  a1.rn <="+lastIndex+"");
	//paginationSQL.append(" fetch first "+ numPerPage +" rows only");

	//paginationSQL.append(" ) WHERE	　　num > " + startIndex);
	//装入结果集
	setResultList(getJdbcTemplate().queryForList(paginationSQL.toString()));
	}
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumPerPage() {
	return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
	this.numPerPage = numPerPage;
	}

	public List getResultList() {
	return resultList;
	}

	public void setResultList(List resultList) {
	this.resultList = resultList;
	}

	public int getTotalPages() {
	return totalPages;
	}

	//计算总页数

	public void setTotalPages() {

		if(totalRows % numPerPage == 0){	
			this.totalPages = totalRows / numPerPage;	
		}else{	
			this.totalPages	= (totalRows / numPerPage)+1;
		}
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex() {
		this.startIndex = (currentPage - 1) * numPerPage;
	}

	public int getLastIndex() {
	return lastIndex;
	}

	public JdbcTemplate getJTemplate() {
	return jTemplate;
	}

	public void setJTemplate(JdbcTemplate template) {
	jTemplate = template;
	}

	//计算结束时候的索引

	public void setLastIndex(){
		if( totalRows < numPerPage){
			this.lastIndex = totalRows;
		}else if((totalRows % numPerPage == 0) || (totalRows % numPerPage != 0 && currentPage < totalPages)){
			this.lastIndex = currentPage * numPerPage;
		}else if(totalRows % numPerPage != 0 && currentPage == totalPages){//最后一页
			this.lastIndex = totalRows;
		}
	}
//在我的业务逻辑代码中：

/**
	　　* find season ranking list from DC
	　　* @param areaId 选手区域id
	　　* @param rankDate 赛季
	　　* @param category 类别
	　　* @param characterName 角色名
	　　* @return List

	　　*/

public List findSeasonRankingList(Long areaId, int rankYear,int rankMonth,
			Long categoryId,String characterName) {
	//SQL语句
	StringBuffer sql = new StringBuffer(" SELECT C.USERID userid,D.POSNAME posname,C.GAMEID gameid,C.AMOUNT amount,C.RANK rank FROM ");
	//表
	sql.append(" (SELECT B.USERID USERID,");
	sql.append(" B.POSID POSID,");	
	sql.append(" A.DISTRICT_CODE DISTRICTCODE,");
	sql.append(" A.GAMEID GAMEID,");
	sql.append(" AMOUNT AMOUNT,");
	sql.append(" RANK RANK ");
	sql.append(" FROM TB_FS_RANK A ");
	sql.append(" LEFT JOIN TB_CHARACTER_INFO B ");
	sql.append(" ON A.DISTRICT_CODE = B.DISTRICT_CODE ");
	sql.append(" AND A.GAMEID = B.GAMEID ");
	//附加条件
	if(areaId != null && areaId.intValue() != 0){
	sql.append(" and A.DISTRICT_CODE = " + areaId.intValue());
	}
//	if( rankYear > 1Array70 && rankMonth > 0){
	if( rankYear > 1 && rankMonth > 0){
	//hql.append(" and sas.id.dt >= to_date(’" + rankYear + "-" + rankMonth + "-01 00:00:00’," + "YYYY-MM-DD HH24:MI:SS");
	//hql.append(" and sas.id.dt <= to_date(’" + rankYear + "-" + rankMonth + "-" + TimeTool.findMaxDateInMonth(rankYear,rankMonth) + " 23:5Array:5Array’," + "YYYY-MM-DD HH24:MI:SS");
	sql.append(" and A.DT = fn_time_convert(to_date(’" + rankYear + "-" + rankMonth + "’," + "’YYYY-MM’)) ");
	}
	if(categoryId != null && categoryId.intValue() != 0){
	sql.append(" and A.CID = " + categoryId.intValue());
	}
	if(characterName != null && !characterName.trim().equals("")){
	sql.append(" and A.GAMEID = ’" + characterName.trim()+"’ ");
	}
	sql.append(" ORDER BY RANK ASC) C ");
	sql.append(" LEFT JOIN TB_FS_POSITION D ");
	sql.append(" ON C.POSID = D.POSID ");
	sql.append(" ORDER BY C.RANK ");
	//System.out.println("hql="+sql.toString());////////////////
	//使用自己的分页程序控制结果集
	Pagination pageInfo = new Pagination(sql.toString(),1,10,getJdbcTemplate());
	return pageInfo.getResultList();
}}
