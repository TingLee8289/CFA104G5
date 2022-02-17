package ezs.ser_ad.model;

import java.util.List;

public interface SerAdDAO_interface {
	public void insert(SerAdVO serAdVO);

	public void update(SerAdVO serAdVO);

	public void delete(Integer adVdrID, Integer adSerClaID);

	public SerAdVO findByPrimartKey(Integer adVdrID, Integer adSerClaID);

	public List<SerAdVO> getAll();
}
