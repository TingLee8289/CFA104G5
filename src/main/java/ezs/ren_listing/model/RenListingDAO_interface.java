package ezs.ren_listing.model;

import java.util.List;


public interface RenListingDAO_interface {
//<<<<<<< HEAD
//	public void insert(RenListingVO renListingVO);
//    public void update(RenListingVO renListingVO);
//=======
	public void insert(RenListingVO listingVO);
    public void update(RenListingVO listingVO);
//>>>>>>> refs/heads/master
    public void delete(Integer lisID);
    public RenListingVO findByPrimaryKey(Integer lisID);
    public List<RenListingVO> getAll();

}
