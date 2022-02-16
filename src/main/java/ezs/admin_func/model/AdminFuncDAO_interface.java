package ezs.admin_func.model;

import java.util.List;

public interface AdminFuncDAO_interface {
		public void insert(AdminFuncVO adminFuncVO);
		public void update(AdminFuncVO adminFuncVO);
		public void delete(Integer funID);
        public AdminFuncVO findByPrimaryKey(Integer funID);
        public List<AdminFuncVO> getAll();
}
