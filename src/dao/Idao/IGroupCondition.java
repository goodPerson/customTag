package dao. Idao;

import java.util.List;

import module.GroupCondition;

public interface IGroupCondition {
	    /**
	     * 获取指定属性构成List
	     * @param groupId
	     * @return
	     */
        public List<GroupCondition> getGroupConditionList(String groupId);
}
