package dao.Idao;

import java.util.List;

import module.Right;

public interface IRight {
    /**
     * 权限列表
     * @param right
     * @return
     */
	List<Right> listRight(Right  right);
}
