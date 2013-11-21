package dao.Idao;

import java.util.List;

import module.AttrRequest;

public interface IAttrRequest {
    /**
     * 添加属性申请
     * @param attr
     * @return
     */
	public boolean AddAttrRequest(AttrRequest  attr);
	
	/**
	 * 我的申请列表
	 * @param attr
	 * @return
	 */
	public List<AttrRequest> listAttrR(AttrRequest  attr);
	
	/**
	 * 待处理申请列表
	 * @param attr
	 * @return
	 */
	public List<AttrRequest> listAttrRWait(AttrRequest  attr);
	
	/**
	 * 已经处理申请列表
	 * @param attr
	 * @return
	 */
	public List<AttrRequest> listAttrRalready(AttrRequest  attr);
	
	/**
	 * 查找审批属性申请
	 * @param attr
	 * @return
	 */
	public AttrRequest findAttrReq(String reqId);
	/**
	 * 审批属性申请
	 * @param attr
	 * @return
	 */
	public boolean updateAttr(AttrRequest  attr);
}
