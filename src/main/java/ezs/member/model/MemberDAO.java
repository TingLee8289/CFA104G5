package ezs.member.model;

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

public class MemberDAO implements MemberDAO_interface {



	private static final String INSERT_STMT = "INSERT INTO `MEMBER`(MEM_USERNAME,MEM_PASSWORD,MEM_NAME,MEM_LANDLORD,MEM_SUPPLIER,"
			+ "MEM_SELLER,MEM_PHONE,MEM_ADDRESS,MEM_EMAIL,MEM_PID,MEM_STATUS,MEM_HEADSHOT,"
			+ "MEM_REV_COUNT,MEM_REV_SCORE,MEM_RED_COUNT,MEM_Red_SCORE,MEM_REPORTED,"
			+ "MEM_LDD_REPORTED,MEM_SUP_REPORTED,MEM_SEL_REPORTED,MEM_VATNO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `MEMBER` ORDER BY MEM_ID";
	private static final String GET_ONE_STMT = "SELECT MEM_ID,MEM_USERNAME,MEM_PASSWORD,MEM_NAME,MEM_LANDLORD,MEM_SUPPLIER,"
			+ "MEM_SELLER,MEM_PHONE,MEM_ADDRESS,MEM_EMAIL,MEM_PID,MEM_STATUS,MEM_HEADSHOT,"
			+ "MEM_REV_COUNT,MEM_REV_SCORE,MEM_RED_COUNT,MEM_Red_SCORE,MEM_REPORTED,"
			+ "MEM_LDD_REPORTED,MEM_SUP_REPORTED,MEM_SEL_REPORTED,MEM_VATNO FROM `MEMBER` WHERE MEM_ID = ?";
	private static final String DELETE = "DELETE FROM `MEMBER` WHERE MEM_ID = ?";
	private static final String UPDATE = "UPDATE `MEMBER` SET MEM_USERNAME = ?,MEM_PASSWORD = ?,MEM_NAME =?,MEM_LANDLORD= ?,MEM_SUPPLIER=?,"
			+ "MEM_SELLER=?,MEM_PHONE=?,MEM_ADDRESS=?,MEM_EMAIL=?,MEM_PID=?,MEM_STATUS=?,MEM_HEADSHOT=?,"
			+ "MEM_REV_COUNT=?,MEM_REV_SCORE=?,MEM_RED_COUNT=?,MEM_RED_SCORE=?,MEM_REPORTED=?,"
			+ "MEM_LDD_REPORTED=?,MEM_SUP_REPORTED=?,MEM_SEL_REPORTED=?,MEM_VATNO=? WHERE MEM_ID = ?";
	private static final String Search = "SELECT MEM_USERNAME,MEM_PASSWORD FROM `CFA104G5`.`MEMBER` WHERE (MEM_USERNAME,MEM_PASSWORD) = (?,?)";
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
	public void insert(MemberVO memberVO) {

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getMemUsername());
			pstmt.setString(2, memberVO.getMemPassword());
			pstmt.setString(3, memberVO.getMemName());
			pstmt.setByte(4, memberVO.getMemLandlord());
			pstmt.setByte(5, memberVO.getMemSupplier());
			pstmt.setByte(6, memberVO.getMemSeller());
			pstmt.setString(7, memberVO.getMemPhone());
			pstmt.setString(8, memberVO.getMemAddress());
			pstmt.setString(9, memberVO.getMemEmail());
			pstmt.setString(10, memberVO.getMemPID());
			pstmt.setByte(11, memberVO.getMemStatus());
			pstmt.setBytes(12, memberVO.getMemHeadshot());
			pstmt.setInt(13, memberVO.getMemRevCount());
			pstmt.setInt(14, memberVO.getMemRevScore());
			pstmt.setInt(15, memberVO.getMemRedCount());
			pstmt.setInt(16, memberVO.getMemRedScore());
			pstmt.setInt(17, memberVO.getMemReported());
			pstmt.setInt(18, memberVO.getMemLddReported());
			pstmt.setInt(19, memberVO.getMemSupReported());
			pstmt.setInt(20, memberVO.getMemSelReported());
			pstmt.setString(21, memberVO.getMemVatno());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(MemberVO memberVO) {

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getMemUsername());
			pstmt.setString(2, memberVO.getMemPassword());
			pstmt.setString(3, memberVO.getMemName());
			pstmt.setByte(4, memberVO.getMemLandlord());
			pstmt.setByte(5, memberVO.getMemSupplier());
			pstmt.setByte(6, memberVO.getMemSeller());
			pstmt.setString(7, memberVO.getMemPhone());
			pstmt.setString(8, memberVO.getMemAddress());
			pstmt.setString(9, memberVO.getMemEmail());
			pstmt.setString(10, memberVO.getMemPID());
			pstmt.setByte(11, memberVO.getMemStatus());
			pstmt.setBytes(12, memberVO.getMemHeadshot());
			pstmt.setInt(13, memberVO.getMemRevCount());
			pstmt.setInt(14, memberVO.getMemRevScore());
			pstmt.setInt(15, memberVO.getMemRedCount());
			pstmt.setInt(16, memberVO.getMemRedScore());
			pstmt.setInt(17, memberVO.getMemReported());
			pstmt.setInt(18, memberVO.getMemLddReported());
			pstmt.setInt(19, memberVO.getMemSupReported());
			pstmt.setInt(20, memberVO.getMemSelReported());
			pstmt.setString(21, memberVO.getMemVatno());
			pstmt.setInt(22, memberVO.getMemID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer memID) {

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memID);

			pstmt.executeUpdate();
			System.out.println("true");
			// Handle any driver errors

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public MemberVO findByPrimaryKey(Integer memID) {
		MemberVO memberVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, memID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memberVo 也稱為 Domain objects
				memberVO = new MemberVO();
				memberVO.setMemID(rs.getInt("MEM_ID"));
				memberVO.setMemUsername(rs.getString("MEM_USERNAME"));
				memberVO.setMemPassword(rs.getString("MEM_PASSWORD"));
				memberVO.setMemName(rs.getString("MEM_NAME"));
				memberVO.setMemLandlord(rs.getByte("MEM_LANDLORD"));
				memberVO.setMemSupplier(rs.getByte("MEM_SUPPLIER"));
				memberVO.setMemSeller(rs.getByte("MEM_SELLER"));
				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
				memberVO.setMemAddress(rs.getString("MEM_ADDRESS"));
				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
				memberVO.setMemPID(rs.getString("MEM_PID"));
				memberVO.setMemStatus(rs.getByte("MEM_STATUS"));
				memberVO.setMemHeadshot(null);
				memberVO.setMemRevCount(rs.getInt("MEM_REV_COUNT"));
				memberVO.setMemRevScore(rs.getInt("MEM_REV_SCORE"));
				memberVO.setMemRedCount(rs.getInt("MEM_RED_COUNT"));
				memberVO.setMemRedScore(rs.getInt("MEM_RED_SCORE"));
				memberVO.setMemReported(rs.getInt("MEM_REPORTED"));
				memberVO.setMemLddReported(rs.getInt("MEM_LDD_REPORTED"));
				memberVO.setMemSupReported(rs.getInt("MEM_SUP_REPORTED"));
				memberVO.setMemSelReported(rs.getInt("MEM_SEL_REPORTED"));
				memberVO.setMemVatno(rs.getString("MEM_VATNO"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);

		}
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemID(rs.getInt("MEM_ID"));
				memberVO.setMemUsername(rs.getString("MEM_USERNAME"));
				memberVO.setMemPassword(rs.getString("MEM_PASSWORD"));
				memberVO.setMemName(rs.getString("MEM_NAME"));
				memberVO.setMemLandlord(rs.getByte("MEM_LANDLORD"));
				memberVO.setMemSupplier(rs.getByte("MEM_SUPPLIER"));
				memberVO.setMemSeller(rs.getByte("MEM_SELLER"));
				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
				memberVO.setMemAddress(rs.getString("MEM_ADDRESS"));
				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
				memberVO.setMemPID(rs.getString("MEM_PID"));
				memberVO.setMemStatus(rs.getByte("MEM_STATUS"));
				memberVO.setMemHeadshot(null);
				memberVO.setMemRevCount(rs.getInt("MEM_REV_COUNT"));
				memberVO.setMemRevScore(rs.getInt("MEM_REV_SCORE"));
				memberVO.setMemRedCount(rs.getInt("MEM_RED_COUNT"));
				memberVO.setMemRedScore(rs.getInt("MEM_RED_SCORE"));
				memberVO.setMemReported(rs.getInt("MEM_REPORTED"));
				memberVO.setMemLddReported(rs.getInt("MEM_LDD_REPORTED"));
				memberVO.setMemSupReported(rs.getInt("MEM_SUP_REPORTED"));
				memberVO.setMemSelReported(rs.getInt("MEM_SEL_REPORTED"));
				memberVO.setMemVatno(null);
				list.add(memberVO);
			}

		}

		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);

		}
		return list;
	}

	@Override
	public MemberVO Search(String memUsername, String memPassword) {
		MemberVO memberVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(Search);

			pstmt.setString(1, memUsername);
			pstmt.setString(2, memPassword);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memberVo 也稱為 Domain objects
				memberVO = new MemberVO();
//				memberVO.setMemID(rs.getInt("MEM_ID"));
				memberVO.setMemUsername(rs.getString("MEM_USERNAME"));
				memberVO.setMemPassword(rs.getString("MEM_PASSWORD"));
//				memberVO.setMemName(rs.getString("MEM_NAME"));
//				memberVO.setMemLandlord(rs.getByte("MEM_LANDLORD"));
//				memberVO.setMemSupplier(rs.getByte("MEM_SUPPLIER"));
//				memberVO.setMemSeller(rs.getByte("MEM_SELLER"));
//				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
//				memberVO.setMemAddress(rs.getString("MEM_ADDRESS"));
//				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
//				memberVO.setMemPID(rs.getString("MEM_PID"));
//				memberVO.setMemStatus(rs.getByte("MEM_STATUS"));
//				memberVO.setMemHeadshot(null);
//				memberVO.setMemRevCount(rs.getInt("MEM_REV_COUNT"));
//				memberVO.setMemRevScore(rs.getInt("MEM_REV_SCORE"));
//				memberVO.setMemRedCount(rs.getInt("MEM_RED_COUNT"));
//				memberVO.setMemRedScore(rs.getInt("MEM_RED_SCORE"));
//				memberVO.setMemReported(rs.getInt("MEM_REPORTED"));
//				memberVO.setMemLddReported(rs.getInt("MEM_LDD_REPORTED"));
//				memberVO.setMemSupReported(rs.getInt("MEM_SUP_REPORTED"));
//				memberVO.setMemSelReported(rs.getInt("MEM_SEL_REPORTED"));
//				memberVO.setMemVatno(rs.getString("MEM_VATNO"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);

		}
		return memberVO;

	}

}
