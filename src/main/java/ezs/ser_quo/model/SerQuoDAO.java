package ezs.ser_quo.model;

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

public class SerQuoDAO implements SerQuoDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `ser_quo` (QUO_STATUS,QUO_DMD_ID,QUO_VDR_ID,QUO_DATE,QUO_EXPIRYDATE,QUO_ITEM, QUO_TOTALPRICE) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `ser_quo` order by QUO_ID";
	private static final String GET_ONE_STMT = "SELECT QUO_ID,QUO_STATUS,QUO_DMD_ID,QUO_VDR_ID,QUO_DATE,QUO_EXPIRYDATE,QUO_ITEM, QUO_TOTALPRICE FROM `ser_quo` where QUO_ID = ?";
	private static final String DELETE = "DELETE FROM `ser_quo` where QUO_ID = ?";
	private static final String UPDATE = "UPDATE `ser_quo` set QUO_STATUS=?, QUO_DMD_ID=?, QUO_VDR_ID=?, QUO_DATE=?, QUO_EXPIRYDATE=?, QUO_ITEM=?, QUO_TOTALPRICE=? where QUO_ID = ?";

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
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
	public void insert(SerQuoVO serQuoVO) {

		try {
			con = ds.getConnection();
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
			con = ds.getConnection();
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
			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, quoID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return serQuoVO;
	}

	@Override
	public List<SerQuoVO> getAll() {
		List<SerQuoVO> list = new ArrayList<SerQuoVO>();
		SerQuoVO serQuoVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	

}
