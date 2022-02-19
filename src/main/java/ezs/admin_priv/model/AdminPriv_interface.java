package ezs.admin_priv.model;

import java.util.List;

public interface AdminPriv_interface {
		public void insert(AdminPrivVO adminFUNCTIONVO);
		public void delete(Integer admID);
		public AdminPrivVO findByPrimaryKey(Integer admID,Integer funID);
		public List<AdminPrivVO> getAllFromID (Integer admID);
		public List<AdminPrivVO> getAll();
}