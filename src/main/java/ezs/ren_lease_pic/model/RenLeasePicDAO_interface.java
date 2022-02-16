package ezs.ren_lease_pic.model;

import java.util.List;


public interface RenLeasePicDAO_interface {
    public void insert(RenLeasePicVO lease_picVO);
    public void update(RenLeasePicVO lease_picVO);
    public void delete(Integer lp_id);
    public RenLeasePicVO findByPrimaryKey(Integer Lease_PicVO);
    public List<RenLeasePicVO> getAll();
}
