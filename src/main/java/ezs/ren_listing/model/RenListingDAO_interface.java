package ezs.ren_listing.model;

import java.util.List;


public interface RenListingDAO_interface {
	public Integer insert(RenListingVO renListingVO);
    public void update(RenListingVO renListingVO);
    public void delete(Integer lisID);
    public RenListingVO findByPrimaryKey(Integer lisID);
    public List<RenListingVO> getAll();

}
