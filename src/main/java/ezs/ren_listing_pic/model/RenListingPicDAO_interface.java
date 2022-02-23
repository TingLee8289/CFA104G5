package ezs.ren_listing_pic.model;

import java.util.List;

import ezs.ren_listing.model.RenListingVO;

public interface RenListingPicDAO_interface {
	public void insert(RenListingPicVO listingpicVO);
    public void update(RenListingPicVO listingpicVO);
    public void delete(Integer lspLisID);
    public RenListingPicVO findByPrimaryKey(Integer lspID);
    public List<RenListingPicVO> getAll();
    public List<RenListingPicVO> getEachListingFirstPic();
}
