package ezs.ren_liating_pic.model;

import java.util.List;



public interface RenListingPicDAO_interface {
	public void insert(RenListingPicVO renListingPicVO);
    public void update(RenListingPicVO renListingPicVO);
    public void delete(Integer lspID);
    public RenListingPicVO findByPrimaryKey(Integer lspID);
    public List<RenListingPicVO> getAll();
    
}
