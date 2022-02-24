package ezs.ren_landlord.model;

import java.util.List;

public interface RenLandlordDAO_interface {
    public void insert(RenLandlordVO renLandlordVO);
    public void update(RenLandlordVO renLandlordVO);
    public void updatestatus(RenLandlordVO renLandlordVO);
    public void delete(Integer lddId);
    public RenLandlordVO findByPrimaryKey(Integer lddId);
    public List<RenLandlordVO> findByMemID(Integer lddMemId);
    public List<RenLandlordVO> getAll();
    
    public Integer findByMEM(Integer lddMemId);
}

