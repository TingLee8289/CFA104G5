package ezs.ren_location.model;

import java.util.List;
import java.util.Set;

import ezs.ren_listing.model.RenListingVO;

public interface RenLocationDAO_interface {
	public void insert(RenLocationVO locationVO);
    public void update(RenLocationVO locationVO);
    public void delete(Integer locID);
    public RenLocationVO findByPrimaryKey(Integer locID);
    public List<RenLocationVO> getAll();
    public Set<RenListingVO> getRenListingByLisAreaID(Integer lisAreaID);
}
