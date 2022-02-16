package ezs.ren_landlord.model;

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

public class RenLandlordDAO implements RenLandlordDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LANDLORD` (ldd_mem_id,ldd_approval) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_LANDLORD`";
	private static final String GET_ONE_STMT = "SELECT ldd_id,ldd_mem_id,ldd_approval FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LANDLORD` WHERE ldd_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LANDLORD` set ldd_mem_id =?, ldd_approval=? WHERE ldd_id = ?";

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

	public void insert(RenLandlordVO renLandlordVO) {
		try {
			con = ds.getConnection();
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

	public void update(RenLandlordVO renLandlordVO) {
		try {
			con = ds.getConnection();
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

	public void delete(Integer lddId) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, lddId);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	public RenLandlordVO findByPrimaryKey(Integer lddId) {
		RenLandlordVO renLandlordVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, lddId);

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
		return renLandlordVO;
	}

	public List<RenLandlordVO> getAll() {
		List<RenLandlordVO> list = new ArrayList<RenLandlordVO>();
		RenLandlordVO renLandlordVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLandlordVO = new RenLandlordVO();
				renLandlordVO.setLddId(rs.getInt("ldd_id"));
				renLandlordVO.setLddMemId(rs.getInt("ldd_mem_Id"));
				renLandlordVO.setLddApproval(rs.getInt("ldd_approval"));
				list.add(renLandlordVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
