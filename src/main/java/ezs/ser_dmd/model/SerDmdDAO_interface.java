package ezs.ser_dmd.model;

import java.util.List;

public interface SerDmdDAO_interface {
	public void insert(SerDmdVO serDmdVO);

	public void update(SerDmdVO serDmdVO);

	public void delete(Integer dmdID);

	public SerDmdVO findByPrimaryKey(Integer dmdID);

	public List<SerDmdVO> findByMemID(Integer dmdMemID);

	public List<SerDmdVO> getAll();
	
	public void setDmdStatus(Integer dmdID);

}
