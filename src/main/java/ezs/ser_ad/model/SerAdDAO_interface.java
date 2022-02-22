package ezs.ser_ad.model;

import java.util.List;

import ezs.ser_cla.model.SerClaVO;

public interface SerAdDAO_interface {
	public void insert(SerAdVO serAdVO);

	public void update(SerAdVO serAdVO);

	public void delete(Integer adVdrID, Integer adSerClaID);

	public SerAdVO findByPrimartKey(Integer adVdrID, Integer adSerClaID);

	public List<SerAdVO> getAll();
	public List<SerAdVO> getAdBySerClaID(Integer adSerClaID);
}
