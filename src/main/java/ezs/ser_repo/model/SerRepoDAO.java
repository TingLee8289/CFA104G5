package ezs.ser_repo.model;

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

import ezs.member.model.MemberVO;
import util.Util;

public class SerRepoDAO implements SerRepoDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `ser_repo` (RP_ORD_ID,RP_MEM_ID,RP_TXT,RP_DATE,RP_STATUS) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `ser_repo` order by RP_ID";
	private static final String GET_ONE_STMT = "SELECT RP_ID,RP_ORD_ID,RP_MEM_ID,RP_TXT,RP_DATE,RP_STATUS FROM `ser_repo` where RP_ID = ?";
	private static final String DELETE = "DELETE FROM `ser_repo` where RP_ID = ?";
	private static final String UPDATE = "UPDATE `ser_repo` set RP_ORD_ID=?, RP_MEM_ID=?, RP_TXT=?, RP_DATE=?, RP_STATUS=? where RP_ID = ?";
	private static final String UPDATEMEMSUPREPORT = "UPDATE `member` SET mem_sup_reported = mem_sup_reported + 1 WHERE mem_id = ?";
	
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
	public void insert(SerRepVO serRepVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, serRepVO.getRpOrdID());
			pstmt.setInt(2, serRepVO.getRpMemID());
			pstmt.setString(3, serRepVO.getRpTxt());
			pstmt.setDate(4, serRepVO.getRpDate());
			pstmt.setInt(5, serRepVO.getRpStatus());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SerRepVO serRepVO) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, serRepVO.getRpOrdID());
			pstmt.setInt(2, serRepVO.getRpMemID());
			pstmt.setString(3, serRepVO.getRpTxt());
			pstmt.setDate(4, serRepVO.getRpDate());
			pstmt.setInt(5, serRepVO.getRpStatus());
			pstmt.setInt(6, serRepVO.getRpID());

			pstmt.executeUpdate();
			// Handle any driver errors

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer rpID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, rpID);
			pstmt.executeUpdate();
			System.out.println("已刪除該筆檢舉");

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SerRepVO findByPrimaryKey(Integer rpID) {
		SerRepVO serRepVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, rpID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				serRepVO = new SerRepVO();

				serRepVO.setRpID(rs.getInt("RP_ID"));
				serRepVO.setRpOrdID(rs.getInt("RP_ORD_ID"));
				serRepVO.setRpMemID(rs.getInt("RP_MEM_ID"));
				serRepVO.setRpTxt(rs.getString("RP_TXT"));
				serRepVO.setRpDate(rs.getDate("RP_DATE"));
				serRepVO.setRpStatus(rs.getInt("RP_STATUS"));

			}
		} catch (SQLException se) {

			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return serRepVO;
	}

	@Override
	public List<SerRepVO> getAll() {
		List<SerRepVO> list = new ArrayList<SerRepVO>();
		SerRepVO serRepVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				serRepVO = new SerRepVO();
				serRepVO.setRpID(rs.getInt("RP_ID"));
				serRepVO.setRpOrdID(rs.getInt("RP_ORD_ID"));
				serRepVO.setRpMemID(rs.getInt("RP_MEM_ID"));
				serRepVO.setRpTxt(rs.getString("RP_TXT"));
				serRepVO.setRpDate(rs.getDate("RP_DATE"));
				serRepVO.setRpStatus(rs.getInt("RP_STATUS"));
				list.add(serRepVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;

	}
	
	@Override
	public void updateMemSupReport(Integer memID) { //檢舉次數
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEMEMSUPREPORT);
			
			pstmt.setInt(1, memID);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}

	}
		
	}
	
	
	
	
	
	
	


