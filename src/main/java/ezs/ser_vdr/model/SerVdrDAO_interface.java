package ezs.ser_vdr.model;

import java.util.List;

public interface SerVdrDAO_interface {
	public void insert(SerVdrVO vendorVO);

	public void update(SerVdrVO vendorVO);

	public void delete(Integer vdrID);

	public SerVdrVO findByPrimaryKey(Integer vdrID);

	public List<SerVdrVO> getAll();

}
