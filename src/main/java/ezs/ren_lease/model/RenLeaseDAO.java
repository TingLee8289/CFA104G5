package ezs.ren_lease.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import util.Util;

public class RenLeaseDAO implements RenLeaseDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LEASE` (lse_mem_id,lse_lis_id,lse_ldd_id,lse_price,lse_start,lse_end,lse_pic,lse_leasememid) VALUES (?, ?, ?, ?, ?,?, ?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_LEASE`";
	private static final String GET_ONE_STMT = "SELECT lse_id,lse_mem_id,lse_lis_id,lse_ldd_id,lse_status,lse_timestamp,lse_start,lse_end,lse_price,lse_leasememid FROM `CFA104G5`.`REN_LEASE` WHERE lse_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LEASE` WHERE lse_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LEASE` SET lse_mem_id=?, lse_lis_id=?, lse_ldd_id=?, lse_ldd_score=?, lse_ldd_txt=?, lse_tnt_score=?,lse_tnt_txt =?,lse_status =?,lse_timestamp=?,lse_start =?,lse_end =? WHERE lse_id = ?";
	private static final String GET_ALL_LEASE = "SELECT lse_id,lse_mem_id,lse_lis_id,lse_ldd_id,lse_status,lse_timestamp,lse_start,lse_end,lse_price,lse_leasememid FROM `CFA104G5`.`REN_LEASE` WHERE lse_mem_id = ?";

	private static final String GET_ONE_MEM = "SELECT * FROM `CFA104G5`.`REN_LEASE` WHERE lse_leasememid = ?";

	private static  DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void insert(RenLeaseVO leaseVO) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, leaseVO.getLseMemId());
			pstmt.setInt(2, leaseVO.getLseLisId());
			pstmt.setInt(3, leaseVO.getLseLddId());
			pstmt.setInt(4, leaseVO.getLsePrice());
			pstmt.setDate(5, leaseVO.getLseStart());
			pstmt.setDate(6, leaseVO.getLseEnd());
			pstmt.setBytes(7, leaseVO.getLsePic());
			pstmt.setInt(8, leaseVO.getLseLeaseMemId());


			

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, leaseVO.getLseMemId());
			pstmt.setInt(2, leaseVO.getLseLisId());
			pstmt.setInt(3, leaseVO.getLseLddId());
			pstmt.setInt(8, leaseVO.getLseStatus());
			pstmt.setTimestamp(9, leaseVO.getLseTimestamp());
			pstmt.setDate(10, leaseVO.getLseStart());
			pstmt.setDate(11, leaseVO.getLseEnd());
			pstmt.setInt(12, leaseVO.getLsePrice());
			pstmt.setInt(13, leaseVO.getLseId());

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
			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, lse_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				leaseVO = new RenLeaseVO();
				leaseVO.setLseId(rs.getInt("lse_id"));
				leaseVO.setLseMemId(rs.getInt("lse_mem_id"));
				leaseVO.setLseLisId(rs.getInt("lse_lis_id"));
				leaseVO.setLseLddId(rs.getInt("lse_ldd_id"));
				leaseVO.setLseTimestamp(rs.getTimestamp("lse_timestamp"));
				leaseVO.setLseStart(rs.getDate("lse_start"));
				leaseVO.setLseEnd(rs.getDate("lse_end"));
				leaseVO.setLsePrice(rs.getInt("lse_price"));
				leaseVO.setLseLeaseMemId(rs.getInt("lse_leasememid"));

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
		RenLeaseVO renLeaseVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
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
	
	
	@Override
	public List<RenLeaseVO> getAllMEM(Integer lseLeaseMemId) {
		List<RenLeaseVO> list = new ArrayList<RenLeaseVO>();
		RenLeaseVO renLeaseVO = null;
		try {
			con = ds.getConnection();
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

	public List<RenLeaseVO> getAllLease(Integer lse_mem_id) {
		List<RenLeaseVO> list = new ArrayList<RenLeaseVO>();
		RenLeaseVO renLeaseVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_LEASE);
			pstmt.setInt(1,lse_mem_id);

			
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
