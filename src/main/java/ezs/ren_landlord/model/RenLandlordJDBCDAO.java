package ezs.ren_landlord.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class RenLandlordJDBCDAO implements RenLandlordDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LANDLORD` (ldd_mem_id,ldd_approval) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_LANDLORD`";
	private static final String GET_ONE_STMT = "SELECT ldd_id,ldd_mem_id,ldd_approval FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_id = ?";
	private static final String GET_ONE_STMT_by_memid= "SELECT ldd_id,ldd_mem_id,ldd_approval FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_mem_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LANDLORD` set ldd_mem_id =?, ldd_approval=? WHERE ldd_id = ?";
	private static final String UPDATESTATUS = "UPDATE `member` set mem_landlord = ? where mem_id =?";

	private static final String GET_BY_MEMID = "SELECT * FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_mem_id = ?";
	
	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(RenLandlordVO renLandlordVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, renLandlordVO.getLddMemId());
			pstmt.setInt(2, renLandlordVO.getLddApproval());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenLandlordVO renLandlordVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, renLandlordVO.getLddMemId());
			pstmt.setInt(2, renLandlordVO.getLddApproval());
			pstmt.setInt(3, renLandlordVO.getLddId());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}
	
	
	

	@Override
	public void delete(Integer ldd_id) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, ldd_id);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenLandlordVO findByPrimaryKey(Integer ldd_id) {
		RenLandlordVO renLandlordVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, ldd_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLandlordVO = new RenLandlordVO();

				renLandlordVO.setLddMemId(rs.getInt("ldd_mem_id"));
				renLandlordVO.setLddApproval(rs.getInt("ldd_approval"));
				renLandlordVO.setLddId(rs.getInt("ldd_id"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return renLandlordVO;
	}

	public List<RenLandlordVO> getAll() {
		List<RenLandlordVO> list = new ArrayList<RenLandlordVO>();
		RenLandlordVO renLandlordVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLandlordVO = new RenLandlordVO();
				renLandlordVO.setLddId(rs.getInt("ldd_id"));
				renLandlordVO.setLddMemId(rs.getInt("ldd_mem_id"));
				renLandlordVO.setLddApproval(rs.getInt("ldd_approval"));
				list.add(renLandlordVO); // Store the row in the list
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public void updatestatus(RenLandlordVO renLandlordVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATESTATUS);
			rs = pstmt.executeQuery();

			pstmt.setInt(1, renLandlordVO.getLddApproval());
			pstmt.setInt(2, renLandlordVO.getLddMemId());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}		
	}
	
	public Integer findByMEM(Integer lddMemId) {
		RenLandlordVO renLandlordVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_BY_MEMID);

			pstmt.setInt(1, lddMemId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLandlordVO = new RenLandlordVO();
				renLandlordVO.setLddMemId(rs.getInt("ldd_mem_Id"));
				renLandlordVO.setLddApproval(rs.getInt("ldd_approval"));
				renLandlordVO.setLddId(rs.getInt("ldd_id"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return renLandlordVO.getLddId();
	}

	@Override
	public List<RenLandlordVO> findByMemID(Integer lddmemid) {
		List<RenLandlordVO> list = new ArrayList<RenLandlordVO>();
			RenLandlordVO renLandlordVO = null;
			try {
				con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					renLandlordVO = new RenLandlordVO();
					renLandlordVO.setLddId(rs.getInt("ldd_id"));
					renLandlordVO.setLddMemId(rs.getInt("ldd_mem_id"));
					renLandlordVO.setLddApproval(rs.getInt("ldd_approval"));
					list.add(renLandlordVO); // Store the row in the list
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				Util.closeResource(con, pstmt, rs);
			}
			return list;
		
	}

}
