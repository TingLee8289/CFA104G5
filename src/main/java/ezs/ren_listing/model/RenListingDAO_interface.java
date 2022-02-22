package ezs.ren_listing.model;

import java.util.List;
import java.util.Set;


public interface RenListingDAO_interface {
	public Integer insert(RenListingVO renListingVO);
    public void update(RenListingVO renListingVO);
    public void delete(Integer lisID);
    public RenListingVO findByPrimaryKey(Integer lisID);
    public Set<RenListingVO>getRenListingByLisLddID(Integer lisLddID);
    public List<RenListingVO> getAll();

}
