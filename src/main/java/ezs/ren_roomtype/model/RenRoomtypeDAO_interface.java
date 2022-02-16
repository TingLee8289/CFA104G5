package ezs.ren_roomtype.model;

import java.util.List;

public interface RenRoomtypeDAO_interface {
	public void insert(RenRoomtypeVO roomtypeVO);
    public void update(RenRoomtypeVO roomtypeVO);
    public void delete(Integer rtID);
    public RenRoomtypeVO findByPrimaryKey(Integer rtID);
    public List<RenRoomtypeVO> getAll();
}
