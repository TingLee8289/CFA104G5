package ezs.ser_quo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SerQuoJDBCDAO implements SerQuoDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `ser_quo` (QUO_STATUS,QUO_DMD_ID,QUO_VDR_ID,QUO_DATE,QUO_EXPIRYDATE,QUO_ITEM, QUO_TOTALPRICE) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `ser_quo` order by QUO_ID";
	private static final String GET_ONE_STMT = "SELECT QUO_ID,QUO_STATUS,QUO_DMD_ID,QUO_VDR_ID,QUO_DATE,QUO_EXPIRYDATE,QUO_ITEM, QUO_TOTALPRICE FROM `ser_quo` where QUO_ID = ?";
	private static final String DELETE = "DELETE FROM `ser_quo` where QUO_ID = ?";
	private static final String UPDATE = "UPDATE `ser_quo` set QUO_STATUS=?, QUO_DMD_ID=?, QUO_VDR_ID=?, QUO_DATE=?, QUO_EXPIRYDATE=?, QUO_ITEM=?, QUO_TOTALPRICE=? where QUO_ID = ?";
	public static final String FIND_BY_QUO_VDRID = "SELECT * FROM ser_quo WHERE quo_vdr_id = ?";
	public static final String FIND_QUO_BY_DMDID = "select * from  SER_DMD  d  join SER_QUO q on d.DMD_ID = q.QUO_DMD_ID where d.DMD_ID = ?";
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
	public void insert(SerQuoVO serQuoVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setByte(1, serQuoVO.getQuoStatus());
			pstmt.setInt(2, serQuoVO.getQuoDmdID());
			pstmt.setInt(3, serQuoVO.getQuoVdrID());
			pstmt.setDate(4, serQuoVO.getQuoDate());
			pstmt.setDate(5, serQuoVO.getQuoExpiryDate());
			pstmt.setString(6, serQuoVO.getQuoItem());
			pstmt.setBigDecimal(7, serQuoVO.getQuoTotalPrice());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SerQuoVO serQuoVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setByte(1, serQuoVO.getQuoStatus());
			pstmt.setInt(2, serQuoVO.getQuoDmdID());
			pstmt.setInt(3, serQuoVO.getQuoVdrID());
			pstmt.setDate(4, serQuoVO.getQuoDate());
			pstmt.setDate(5, serQuoVO.getQuoExpiryDate());
			pstmt.setString(6, serQuoVO.getQuoItem());
			pstmt.setBigDecimal(7, serQuoVO.getQuoTotalPrice());
			pstmt.setInt(8, serQuoVO.getQuoID());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer quoID) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, quoID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SerQuoVO findByPrimaryKey(Integer quoID) {
		SerQuoVO serQuoVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, quoID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				serQuoVO = new SerQuoVO();

				serQuoVO.setQuoID(rs.getInt("QUO_ID"));
				serQuoVO.setQuoStatus(rs.getByte("QUO_STATUS"));
				serQuoVO.setQuoDmdID(rs.getInt("QUO_DMD_ID"));
				serQuoVO.setQuoVdrID(rs.getInt("QUO_VDR_ID"));
				serQuoVO.setQuoDate(rs.getDate("QUO_DATE"));
				serQuoVO.setQuoExpiryDate(rs.getDate("QUO_EXPIRYDATE"));
				serQuoVO.setQuoItem(rs.getString("QUO_ITEM"));
				serQuoVO.setQuoTotalPrice(rs.getBigDecimal("QUO_TOTALPRICE"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return serQuoVO;
	}

	@Override
	public List<SerQuoVO> getAll() {
		List<SerQuoVO> list = new ArrayList<SerQuoVO>();
		SerQuoVO serQuoVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serQuoVO = new SerQuoVO();

				serQuoVO.setQuoID(rs.getInt("QUO_ID"));
				serQuoVO.setQuoStatus(rs.getByte("QUO_STATUS"));
				serQuoVO.setQuoDmdID(rs.getInt("QUO_DMD_ID"));
				serQuoVO.setQuoVdrID(rs.getInt("QUO_VDR_ID"));
				serQuoVO.setQuoDate(rs.getDate("QUO_DATE"));
				serQuoVO.setQuoExpiryDate(rs.getDate("QUO_EXPIRYDATE"));
				serQuoVO.setQuoItem(rs.getString("QUO_ITEM"));
				serQuoVO.setQuoTotalPrice(rs.getBigDecimal("QUO_TOTALPRICE"));
				list.add(serQuoVO);
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SerQuoVO> findByVdrID(Integer quoVdrID) {
		List<SerQuoVO> list = new ArrayList<SerQuoVO>();
		SerQuoVO serQuoVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_QUO_VDRID);
			pstmt.setInt(1, quoVdrID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serQuoVO = new SerQuoVO();

				serQuoVO.setQuoID(rs.getInt("QUO_ID"));
				serQuoVO.setQuoStatus(rs.getByte("QUO_STATUS"));
				serQuoVO.setQuoDmdID(rs.getInt("QUO_DMD_ID"));
				serQuoVO.setQuoVdrID(rs.getInt("QUO_VDR_ID"));
				serQuoVO.setQuoDate(rs.getDate("QUO_DATE"));
				serQuoVO.setQuoExpiryDate(rs.getDate("QUO_EXPIRYDATE"));
				serQuoVO.setQuoItem(rs.getString("QUO_ITEM"));
				serQuoVO.setQuoTotalPrice(rs.getBigDecimal("QUO_TOTALPRICE"));
				list.add(serQuoVO);
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SerQuoVO> findByDmdID(Integer dmdID) {
		List<SerQuoVO> list = new ArrayList<SerQuoVO>();
		SerQuoVO serQuoVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_QUO_BY_DMDID);
			pstmt.setInt(1, dmdID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serQuoVO = new SerQuoVO();

				serQuoVO.setQuoID(rs.getInt("QUO_ID"));
				serQuoVO.setQuoStatus(rs.getByte("QUO_STATUS"));
				serQuoVO.setQuoDmdID(rs.getInt("QUO_DMD_ID"));
				serQuoVO.setQuoVdrID(rs.getInt("QUO_VDR_ID"));
				serQuoVO.setQuoDate(rs.getDate("QUO_DATE"));
				serQuoVO.setQuoExpiryDate(rs.getDate("QUO_EXPIRYDATE"));
				serQuoVO.setQuoItem(rs.getString("QUO_ITEM"));
				serQuoVO.setQuoTotalPrice(rs.getBigDecimal("QUO_TOTALPRICE"));
				list.add(serQuoVO);
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	
}
