package ezs.admin_emp.model;

import java.util.List;


public interface AdminEmpDAO_interface {
		public void insert(AdminEmpVO adminEmpVO);
		public void update(AdminEmpVO adminEmpVO);
		public void delete(Integer admID);
		public AdminEmpVO findByPrimaryKey(Integer admID);
		public List<AdminEmpVO> getAll();
		public AdminEmpVO Search(String admUsername ,String admPassword);

}
