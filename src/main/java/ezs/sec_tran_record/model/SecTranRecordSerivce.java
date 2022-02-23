package ezs.sec_tran_record.model;

import java.math.BigDecimal;
import java.sql.Date;

public class SecTranRecordSerivce {
	
	private SecTranRecordDAO_interface dao;
	
	public SecTranRecordSerivce () {
		dao = new SecTranRecordDAO();
	}
		
	public  SecTranRecordVO addSecTranRecord(Date shTranTime,Integer shTranID,Integer shTranMemID,Integer shTranCategory,BigDecimal shTranAmount,BigDecimal shTranAP,BigDecimal shTranBal ) {
	
	SecTranRecordVO sectranrecordVO = new SecTranRecordVO();
	
	sectranrecordVO.setShTranMemID(shTranMemID);
	sectranrecordVO.setShTranAmount(shTranAmount);
	sectranrecordVO.setShTranAP(shTranAP);
	sectranrecordVO.setShTranBal(shTranBal);
	sectranrecordVO.setShTranCategory(shTranCategory);
	sectranrecordVO.setShTranID(shTranID);
	sectranrecordVO.setShTranTime(shTranTime);
	dao.insert(sectranrecordVO);
	
	return sectranrecordVO;
	}
	
//	public 
	
	
	

}
