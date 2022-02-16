package ezs.ren_location.model;

import java.util.List;

public interface RenLocationDAO_interface {
	public void insert(RenLocationVO locationVO);
    public void update(RenLocationVO locationVO);
    public void delete(Integer locID);
    public RenLocationVO findByPrimaryKey(Integer locID);
    public List<RenLocationVO> getAll();

}
