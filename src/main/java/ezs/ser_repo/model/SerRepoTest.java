package ezs.ser_repo.model;

public class SerRepoTest {
	public static void main(String[] args) {
		SerRepoJBDCDAO dao = new SerRepoJBDCDAO();
//		insert 
//		SerRepVO r1 = new SerRepVO();
//		r1.setRpOrdID(4);
//		r1.setRpMemID(3);
//		r1.setRpTxt("龜剛欸");
//		r1.setRpDate(java.sql.Date.valueOf("2022-01-01"));
//		r1.setRpStatus((byte)0);
//		dao.insert(r1);

		// update
//		SerRepVO r2 = new SerRepVO();
//		r2.setRpOrdID(2);
//		r2.setRpMemID(7);
//		r2.setRpTxt("龜剛欸");
//		r2.setRpDate(java.sql.Date.valueOf("2022-01-01"));
//		r2.setRpStatus((byte)1);
//		r2.setRpID(2);
//		dao.update(r2);

		// delete
//		dao.delete(2);
//		 findOne
//		SerRepVO aRp = dao.findByPrimaryKey(1);
//		System.out.println(aRp.getRpTxt());
//		//findAll
//		List<SerRepVO> list = dao.getAll();
//		for(SerRepVO Rp:list) {
//			System.out.println(Rp.getRpTxt());
//		}
		
		//檢舉次數
		dao.updateMemSupReport(1);
//		
	}
}
