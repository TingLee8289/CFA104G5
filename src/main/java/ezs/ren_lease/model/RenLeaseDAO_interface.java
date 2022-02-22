package ezs.ren_lease.model;

import java.util.List;

public interface RenLeaseDAO_interface {
    public void insert(RenLeaseVO leaseVO);
    public void update(RenLeaseVO leaseVO);
    public void delete(Integer lse_id);
    public RenLeaseVO findByPrimaryKey(Integer leaseVO);
    public List<RenLeaseVO> getAll();
    
    // **** 房客租賃單 ***
    public List<RenLeaseVO> getLse(Integer lseMemId);
		
}
