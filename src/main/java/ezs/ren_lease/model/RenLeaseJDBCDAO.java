package ezs.ren_lease.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ezs.ren_landlord.model.RenLandlordJDBCDAO;
import util.Util;

public class RenLeaseJDBCDAO implements RenLeaseDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LEASE` (lse_mem_id,lse_lis_id,lse_ldd_id,lse_ldd_score,lse_ldd_txt,lse_tnt_score,lse_tnt_txt,lse_status,lse_timestamp,lse_start,lse_end) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_LEASE`";
	private static final String GET_ONE_STMT = "SELECT lse_id,lse_mem_id,lse_lis_id,lse_ldd_id,lse_ldd_score,lse_ldd_txt,lse_tnt_score,lse_tnt_txt,lse_status,lse_timestamp,lse_start,lse_end FROM `CFA104G5`.`REN_LEASE` WHERE lse_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LEASE` WHERE lse_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LEASE` SET lse_mem_id=?, lse_lis_id=?, lse_ldd_id=?, lse_ldd_score=?, lse_ldd_txt=?, lse_tnt_score=?,lse_tnt_txt =?,lse_status =?,lse_timestamp=?,lse_start =?,lse_end =? WHERE lse_id = ?";
	
	private static final String GET_ONE_MEM = "SELECT * FROM `CFA104G5`.`REN_LEASE` WHERE lse_leasememid = ?";

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
	public void insert(RenLeaseVO leaseVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, leaseVO.getLseMemId());
			pstmt.setInt(2, leaseVO.getLseLisId());
			pstmt.setInt(3, leaseVO.getLseLddId());
			pstmt.setInt(4, leaseVO.getLseLddScore());
			pstmt.setString(5, leaseVO.getLseLddTxt());
			pstmt.setInt(6, leaseVO.getLseTntScore());
			pstmt.setString(7, leaseVO.getLseTntTxt());
			pstmt.setInt(8, leaseVO.getLseStatus());
			pstmt.setTimestamp(9, leaseVO.getLseTimestamp());
			pstmt.setDate(10, leaseVO.getLseStart());
			pstmt.setDate(11, leaseVO.getLseEnd());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenLeaseVO leaseVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, leaseVO.getLseMemId());
			pstmt.setInt(2, leaseVO.getLseLisId());
			pstmt.setInt(3, leaseVO.getLseLddId());
			pstmt.setInt(4, leaseVO.getLseLddScore());
			pstmt.setString(5, leaseVO.getLseLddTxt());
			pstmt.setInt(6, leaseVO.getLseTntScore());
			pstmt.setString(7, leaseVO.getLseTntTxt());
			pstmt.setInt(8, leaseVO.getLseStatus());
			pstmt.setTimestamp(9, leaseVO.getLseTimestamp());
			pstmt.setDate(10, leaseVO.getLseStart());
			pstmt.setDate(11, leaseVO.getLseEnd());
			pstmt.setInt(12, leaseVO.getLseId());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer lse_id) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, lse_id);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenLeaseVO findByPrimaryKey(Integer lse_id) {
		RenLeaseVO leaseVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, lse_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				leaseVO = new RenLeaseVO();
				leaseVO.setLseId(rs.getInt("lse_id"));
				leaseVO.setLseMemId(rs.getInt("lse_mem_id"));
				leaseVO.setLseLisId(rs.getInt("lse_lis_id"));
				leaseVO.setLseLddId(rs.getInt("lse_ldd_id"));
				leaseVO.setLseLddScore(rs.getInt("lse_ldd_score"));
				leaseVO.setLseLddTxt(rs.getString("lse_ldd_txt"));
				leaseVO.setLseTntScore(rs.getInt("lse_tnt_score"));
				leaseVO.setLseTntTxt(rs.getString("lse_tnt_txt"));
				leaseVO.setLseStatus(rs.getInt("lse_status"));
				leaseVO.setLseTimestamp(rs.getTimestamp("lse_timestamp"));
				leaseVO.setLseStart(rs.getDate("lse_start"));
				leaseVO.setLseEnd(rs.getDate("lse_end"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return leaseVO;
	}

	@Override
	public List<RenLeaseVO> getAll() {
		List<RenLeaseVO> list = new ArrayList<RenLeaseVO>();
		RenLeaseVO leaseVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				leaseVO = new RenLeaseVO();
				leaseVO.setLseId(rs.getInt("lse_id"));
				leaseVO.setLseMemId(rs.getInt("lse_mem_id"));
				leaseVO.setLseLisId(rs.getInt("lse_lis_id"));
				leaseVO.setLseLddId(rs.getInt("lse_ldd_id"));
				leaseVO.setLseLddScore(rs.getInt("lse_ldd_score"));
				leaseVO.setLseLddTxt(rs.getString("lse_ldd_txt"));
				leaseVO.setLseTntScore(rs.getInt("lse_tnt_score"));
				leaseVO.setLseTntTxt(rs.getString("lse_tnt_txt"));
				leaseVO.setLseStatus(rs.getInt("lse_status"));
				leaseVO.setLseTimestamp(rs.getTimestamp("lse_timestamp"));
				leaseVO.setLseStart(rs.getDate("lse_start"));
				leaseVO.setLseEnd(rs.getDate("lse_end"));
				list.add(leaseVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<RenLeaseVO> getAllLease(Integer lse_mem_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<RenLeaseVO> getAllMEM(Integer lseLeaseMemId) {
		List<RenLeaseVO> list = new ArrayList<RenLeaseVO>();
		RenLeaseVO renLeaseVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_MEM);
			pstmt.setInt(1, lseLeaseMemId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				renLeaseVO = new RenLeaseVO();
				renLeaseVO.setLseId(rs.getInt("lse_id"));
				renLeaseVO.setLseMemId(rs.getInt("lse_mem_id"));
				renLeaseVO.setLseLisId(rs.getInt("lse_lis_id"));
				renLeaseVO.setLseLddId(rs.getInt("lse_ldd_id"));
				renLeaseVO.setLseStatus(rs.getInt("lse_status"));
				renLeaseVO.setLseTimestamp(rs.getTimestamp("lse_timestamp"));
				renLeaseVO.setLseStart(rs.getDate("lse_start"));
				renLeaseVO.setLseEnd(rs.getDate("lse_end"));
				renLeaseVO.setLsePrice(rs.getInt("lse_price"));
				renLeaseVO.setLseLeaseMemId(rs.getInt("lse_leasememid"));

				list.add(renLeaseVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
	

}
