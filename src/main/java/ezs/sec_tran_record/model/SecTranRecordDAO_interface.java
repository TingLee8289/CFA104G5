package ezs.sec_tran_record.model;

import java.util.List;



public interface SecTranRecordDAO_interface {
	public void insert(SecTranRecordVO secTranRecordVO);
    public void update(SecTranRecordVO secTranRecordVO);
    public void delete(Integer shTranID);
    public SecTranRecordVO findByPrimaryKey(Integer shTranID);
    public List<SecTranRecordVO> getAll();
    public List<SecTranRecordVO> getAllformMemID(Integer shTranMemID);
}
