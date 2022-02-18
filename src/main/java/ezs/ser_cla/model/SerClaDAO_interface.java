package ezs.ser_cla.model;

import java.util.List;

public interface SerClaDAO_interface {
	public void insert(SerClaVO serClaVO);
	public void update(SerClaVO serClaVO);
	public void delete(Integer serClaID);
	public SerClaVO findByPrimaryKey(Integer serClaID);
	public List<SerClaVO> getAll();

}
