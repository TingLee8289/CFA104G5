package ezs.sec_tran_record.model;

import java.sql.Connection;
import java.sql.DriverManager;
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

public class SecTranRecordDAO implements SecTranRecordDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_TRAN_RECORD` (sh_tran_mem_id, sh_tran_time, sh_tran_category,sh_tran_amount, sh_tran_ap, sh_tran_bal) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_TRAN_RECORD` ORDER BY sh_tran_id";
	private static final String GET_ALL_BY_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_TRAN_RECORD`  WHERE sh_tran_mem_id = ? ORDER BY sh_tran_time";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_TRAN_RECORD` WHERE sh_tran_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`SEC_TRAN_RECORD` WHERE sh_tran_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`SEC_TRAN_RECORD` SET sh_tran_mem_id=?, sh_tran_time=?, sh_tran_category=?, sh_tran_amount=?, sh_tran_ap=?, sh_tran_bal=? WHERE sh_tran_id = ?";

	private static DataSource ds = null;
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

	@Override
	public void insert(SecTranRecordVO secTranRecordVO) {
		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secTranRecordVO.getShTranMemID());
			pstmt.setDate(2, secTranRecordVO.getShTranTime());
			pstmt.setInt(3, secTranRecordVO.getShTranCategory());
			pstmt.setBigDecimal(4, secTranRecordVO.getShTranAmount());
			pstmt.setBigDecimal(5, secTranRecordVO.getShTranAP());
			pstmt.setBigDecimal(6, secTranRecordVO.getShTranBal());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecTranRecordVO secTranRecordVO) {
		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, secTranRecordVO.getShTranMemID());
			pstmt.setDate(2, secTranRecordVO.getShTranTime());
			pstmt.setInt(3, secTranRecordVO.getShTranCategory());
			pstmt.setBigDecimal(4, secTranRecordVO.getShTranAmount());
			pstmt.setBigDecimal(5, secTranRecordVO.getShTranAP());
			pstmt.setBigDecimal(6, secTranRecordVO.getShTranBal());
			pstmt.setInt(7, secTranRecordVO.getShTranID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer shTranID) {
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, shTranID);
			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SecTranRecordVO findByPrimaryKey(Integer shTranID) {
		SecTranRecordVO secTranRecordVO = null;

		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shTranID);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				secTranRecordVO = new SecTranRecordVO();
				secTranRecordVO.setShTranMemID(rs.getInt("sh_tran_mem_id"));
				secTranRecordVO.setShTranTime(rs.getDate("sh_tran_time"));
				secTranRecordVO.setShTranCategory(rs.getInt("sh_tran_category"));
				secTranRecordVO.setShTranAmount(rs.getBigDecimal("sh_tran_amount"));
				secTranRecordVO.setShTranAP(rs.getBigDecimal("sh_tran_ap"));
				secTranRecordVO.setShTranBal(rs.getBigDecimal("sh_tran_bal"));
				secTranRecordVO.setShTranID(rs.getInt("sh_tran_id"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return secTranRecordVO;
	}
	
	@Override
	public List<SecTranRecordVO> getAllformMemID(Integer shTranMemID) {
		List<SecTranRecordVO> list = new ArrayList<SecTranRecordVO>();
		SecTranRecordVO secTranRecordVO = null;
		
		try {
			
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_BY_ONE_STMT);
			pstmt.setInt(1, shTranMemID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				secTranRecordVO = new SecTranRecordVO();
				secTranRecordVO.setShTranMemID(rs.getInt("sh_tran_mem_id"));
				secTranRecordVO.setShTranTime(rs.getDate("sh_tran_time"));
				secTranRecordVO.setShTranCategory(rs.getInt("sh_tran_category"));
				secTranRecordVO.setShTranAmount(rs.getBigDecimal("sh_tran_amount"));
				secTranRecordVO.setShTranAP(rs.getBigDecimal("sh_tran_ap"));
				secTranRecordVO.setShTranBal(rs.getBigDecimal("sh_tran_bal"));
				secTranRecordVO.setShTranID(rs.getInt("sh_tran_id"));
				
				list.add(secTranRecordVO);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SecTranRecordVO> getAll() {
		List<SecTranRecordVO> list = new ArrayList<SecTranRecordVO>();
		SecTranRecordVO secTranRecordVO = null;

		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secTranRecordVO = new SecTranRecordVO();
				secTranRecordVO.setShTranID(rs.getInt("sh_tran_id"));
				secTranRecordVO.setShTranMemID(rs.getInt("sh_tran_mem_id"));
				secTranRecordVO.setShTranTime(rs.getDate("sh_tran_time"));
				secTranRecordVO.setShTranCategory(rs.getInt("sh_tran_category"));
				secTranRecordVO.setShTranAmount(rs.getBigDecimal("sh_tran_amount"));
				secTranRecordVO.setShTranAP(rs.getBigDecimal("sh_tran_ap"));
				secTranRecordVO.setShTranBal(rs.getBigDecimal("sh_tran_bal"));

				list.add(secTranRecordVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
