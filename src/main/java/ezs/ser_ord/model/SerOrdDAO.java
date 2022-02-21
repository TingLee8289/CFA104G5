package ezs.ser_ord.model;

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

import ezs.ser_quo.model.SerQuoVO;
import util.Util;

public class SerOrdDAO implements SerOrdDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `ser_ord` (ORD_STATUS,ORD_PAY_STATUS,ORD_DMD_ID,ORD_QUO_ID,ORD_MEM_ID,ORD_VDR_ID,ORD_SER_CLA_ID,ORD_MEM_VATNO,ORD_VDR_VATNO,ORD_CLN_NAME,ORD_CLN_TEL,ORD_WORK_DATE,ORD_COUNTY,ORD_DIST,ORD_ADDR,ORD_ITEM,ORD_TOTALPRICE,ORD_PREPAY,ORD_PAYTYPE,ORD_PAY_DATE,ORD_FPAY,ORD_FPAYTYPE,ORD_FPAY_DATE,ORD_BUYER_SCORE,ORD_BUYER_TXT,ORD_VDR_SCORE,ORD_VDR_TXT,ORD_NOTE) VALUES (?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `ser_ord` order by ORD_ID";
	private static final String GET_ONE_STMT = "SELECT ORD_ID,ORD_STATUS,ORD_PAY_STATUS,ORD_DMD_ID,ORD_QUO_ID,ORD_MEM_ID,ORD_VDR_ID,ORD_SER_CLA_ID,ORD_MEM_VATNO,ORD_VDR_VATNO,ORD_CLN_NAME,ORD_CLN_TEL,ORD_WORK_DATE,ORD_COUNTY,ORD_DIST,ORD_ADDR,ORD_ITEM,ORD_TOTALPRICE,ORD_PREPAY,ORD_PAYTYPE,ORD_PAY_DATE,ORD_FPAY,ORD_FPAYTYPE,ORD_FPAY_DATE,ORD_BUYER_SCORE,ORD_BUYER_TXT,ORD_VDR_SCORE,ORD_VDR_TXT,ORD_NOTE FROM `ser_ord` where ORD_ID = ?";
	private static final String DELETE = "DELETE FROM `ser_ord` where ORD_ID = ?";
	private static final String UPDATE = "UPDATE `ser_ord` set ORD_STATUS=?,ORD_PAY_STATUS=?,ORD_DMD_ID=?,ORD_QUO_ID=?,ORD_MEM_ID=?,ORD_VDR_ID=?,ORD_SER_CLA_ID=?,ORD_MEM_VATNO=?,ORD_VDR_VATNO=?,ORD_CLN_NAME=?,ORD_CLN_TEL=?,ORD_WORK_DATE=?,ORD_COUNTY=?,ORD_DIST=?,ORD_ADDR=?,ORD_ITEM=?,ORD_TOTALPRICE=?,ORD_PREPAY=?,ORD_PAYTYPE=?,ORD_PAY_DATE=?,ORD_FPAY=?,ORD_FPAYTYPE=?,ORD_FPAY_DATE=?,ORD_BUYER_SCORE=?,ORD_BUYER_TXT=?,ORD_VDR_SCORE=?,ORD_VDR_TXT=?,ORD_NOTE=? where ORD_ID = ?";
	private static final String FIND_ORD_BY_VDRID = "SELECT * FROM CFA104G5.SER_ORD where ORD_VDR_ID = ?";
	private static final String FIND_ORD_BY_MEMID = "SELECT * FROM CFA104G5.SER_ORD where ORD_MEM_ID = ?";
	private static final String FINISH_ORD = "UPDATE `CFA104G5`.`SER_ORD` SET `ORD_STATUS` = '3' WHERE ORD_ID = ?";
	private static final String JOB_COMPLETED = "UPDATE `CFA104G5`.`SER_ORD` SET `ORD_STATUS` = '2' WHERE ORD_ID = ?";
	private static final String CREDIT_PAY="UPDATE `CFA104G5`.`SER_ORD` SET `ORD_PAY_STATUS` = '1', `ORD_PAYTYPE` = '2' WHERE `ORD_ID` = ?"; 
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
	public void insert(SerOrdVO serOrdVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setByte(1, serOrdVO.getOrdStatus());
			pstmt.setByte(2, serOrdVO.getOrdPayStatus());
			pstmt.setInt(3, serOrdVO.getOrdDmdID());
			pstmt.setInt(4, serOrdVO.getOrdQuoID());
			pstmt.setInt(5, serOrdVO.getOrdMemID());
			pstmt.setInt(6, serOrdVO.getOrdVdrID());
			pstmt.setInt(7, serOrdVO.getOrdSerClaID());
			pstmt.setString(8, serOrdVO.getOrdMemVatno());
			pstmt.setString(9, serOrdVO.getOrdVdrVatno());
			pstmt.setString(10, serOrdVO.getOrdClnName());
			pstmt.setString(11, serOrdVO.getOrdClnTel());
			pstmt.setDate(12, serOrdVO.getOrdWorkDate());
			pstmt.setString(13, serOrdVO.getOrdCounty());
			pstmt.setString(14, serOrdVO.getOrdDist());
			pstmt.setString(15, serOrdVO.getOrdAddr());
			pstmt.setString(16, serOrdVO.getOrdItem());
			pstmt.setBigDecimal(17, serOrdVO.getOrdTotalPrice());
			pstmt.setBigDecimal(18, serOrdVO.getOrdPrePay());
			pstmt.setByte(19, serOrdVO.getOrdPayType());
			pstmt.setDate(20, serOrdVO.getOrdPayDate());
			pstmt.setBigDecimal(21, serOrdVO.getOrdFpay());
			pstmt.setByte(22, serOrdVO.getOrdFpayType());
			pstmt.setDate(23, serOrdVO.getOrdFpayDate());
			pstmt.setInt(24, serOrdVO.getOrdBuyerScore());
			pstmt.setString(25, serOrdVO.getOrdBuyerTxt());
			pstmt.setInt(26, serOrdVO.getOrdVdrScore());
			pstmt.setString(27, serOrdVO.getOrdVdrTxt());
			pstmt.setString(28, serOrdVO.getOrdNote());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SerOrdVO serOrdVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setByte(1, serOrdVO.getOrdStatus());
			pstmt.setByte(2, serOrdVO.getOrdPayStatus());
			pstmt.setInt(3, serOrdVO.getOrdDmdID());
			pstmt.setInt(4, serOrdVO.getOrdQuoID());
			pstmt.setInt(5, serOrdVO.getOrdMemID());
			pstmt.setInt(6, serOrdVO.getOrdVdrID());
			pstmt.setInt(7, serOrdVO.getOrdSerClaID());
			pstmt.setString(8, serOrdVO.getOrdMemVatno());
			pstmt.setString(9, serOrdVO.getOrdVdrVatno());
			pstmt.setString(10, serOrdVO.getOrdClnName());
			pstmt.setString(11, serOrdVO.getOrdClnTel());
			pstmt.setDate(12, serOrdVO.getOrdWorkDate());
			pstmt.setString(13, serOrdVO.getOrdCounty());
			pstmt.setString(14, serOrdVO.getOrdDist());
			pstmt.setString(15, serOrdVO.getOrdAddr());
			pstmt.setString(16, serOrdVO.getOrdItem());
			pstmt.setBigDecimal(17, serOrdVO.getOrdTotalPrice());
			pstmt.setBigDecimal(18, serOrdVO.getOrdPrePay());
			pstmt.setByte(19, serOrdVO.getOrdPayType());
			pstmt.setDate(20, serOrdVO.getOrdPayDate());
			pstmt.setBigDecimal(21, serOrdVO.getOrdFpay());
			pstmt.setByte(22, serOrdVO.getOrdFpayType());
			pstmt.setDate(23, serOrdVO.getOrdFpayDate());
			pstmt.setInt(24, serOrdVO.getOrdBuyerScore());
			pstmt.setString(25, serOrdVO.getOrdBuyerTxt());
			pstmt.setInt(26, serOrdVO.getOrdVdrScore());
			pstmt.setString(27, serOrdVO.getOrdVdrTxt());
			pstmt.setString(28, serOrdVO.getOrdNote());
			pstmt.setInt(29, serOrdVO.getOrdID());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer ordID) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, ordID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SerOrdVO findByPrimaryKey(Integer ordID) {
		SerOrdVO serOrdVO= null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, ordID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				serOrdVO = new SerOrdVO();
				serOrdVO.setOrdID(rs.getInt("ORD_ID"));
				serOrdVO.setOrdStatus(rs.getByte("ORD_STATUS"));
				serOrdVO.setOrdPayStatus(rs.getByte("ORD_PAY_STATUS"));
				serOrdVO.setOrdDmdID(rs.getInt("ORD_DMD_ID"));
				serOrdVO.setOrdQuoID(rs.getInt("ORD_QUO_ID"));
				serOrdVO.setOrdMemID(rs.getInt("ORD_MEM_ID"));
				serOrdVO.setOrdVdrID(rs.getInt("ORD_VDR_ID"));
				serOrdVO.setOrdSerClaID(rs.getInt("ORD_SER_CLA_ID"));
				serOrdVO.setOrdMemVatno(rs.getString("ORD_MEM_VATNO"));
				serOrdVO.setOrdVdrVatno(rs.getString("ORD_VDR_VATNO"));
				serOrdVO.setOrdClnName(rs.getString("ORD_CLN_NAME"));
				serOrdVO.setOrdClnTel(rs.getString("ORD_CLN_TEL"));
				serOrdVO.setOrdWorkDate(rs.getDate("ORD_WORK_DATE"));
				serOrdVO.setOrdCounty(rs.getString("ORD_COUNTY"));
				serOrdVO.setOrdDist(rs.getString("ORD_DIST"));
				serOrdVO.setOrdAddr(rs.getString("ORD_ADDR"));
				serOrdVO.setOrdItem(rs.getString("ORD_ITEM"));
				serOrdVO.setOrdTotalPrice(rs.getBigDecimal("ORD_TOTALPRICE"));
				serOrdVO.setOrdPrePay(rs.getBigDecimal("ORD_PREPAY"));
				serOrdVO.setOrdPayType(rs.getByte("ORD_PAYTYPE"));
				serOrdVO.setOrdPayDate(rs.getDate("ORD_PAY_DATE"));
				serOrdVO.setOrdFpay(rs.getBigDecimal("ORD_FPAY"));
				serOrdVO.setOrdFpayType(rs.getByte("ORD_FPAYTYPE"));
				serOrdVO.setOrdFpayDate(rs.getDate("ORD_FPAY_DATE"));
				serOrdVO.setOrdBuyerScore(rs.getInt("ORD_BUYER_SCORE"));
				serOrdVO.setOrdBuyerTxt(rs.getString("ORD_BUYER_TXT"));
				serOrdVO.setOrdVdrScore(rs.getInt("ORD_VDR_SCORE"));
				serOrdVO.setOrdVdrTxt(rs.getString("ORD_VDR_TXT"));
				serOrdVO.setOrdNote(rs.getString("ORD_NOTE"));
				
				
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return serOrdVO;
	}

	@Override
	public List<SerOrdVO> getAll() {
		List<SerOrdVO> list= new ArrayList<SerOrdVO>();
		SerOrdVO serOrdVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serOrdVO = new SerOrdVO();
				
				serOrdVO.setOrdID(rs.getInt("ORD_ID"));
				serOrdVO.setOrdStatus(rs.getByte("ORD_STATUS"));
				serOrdVO.setOrdPayStatus(rs.getByte("ORD_PAY_STATUS"));
				serOrdVO.setOrdDmdID(rs.getInt("ORD_DMD_ID"));
				serOrdVO.setOrdQuoID(rs.getInt("ORD_QUO_ID"));
				serOrdVO.setOrdMemID(rs.getInt("ORD_MEM_ID"));
				serOrdVO.setOrdVdrID(rs.getInt("ORD_VDR_ID"));
				serOrdVO.setOrdSerClaID(rs.getInt("ORD_SER_CLA_ID"));
				serOrdVO.setOrdMemVatno(rs.getString("ORD_MEM_VATNO"));
				serOrdVO.setOrdVdrVatno(rs.getString("ORD_VDR_VATNO"));
				serOrdVO.setOrdClnName(rs.getString("ORD_CLN_NAME"));
				serOrdVO.setOrdClnTel(rs.getString("ORD_CLN_TEL"));
				serOrdVO.setOrdWorkDate(rs.getDate("ORD_WORK_DATE"));
				serOrdVO.setOrdCounty(rs.getString("ORD_COUNTY"));
				serOrdVO.setOrdDist(rs.getString("ORD_DIST"));
				serOrdVO.setOrdAddr(rs.getString("ORD_ADDR"));
				serOrdVO.setOrdItem(rs.getString("ORD_ITEM"));
				serOrdVO.setOrdTotalPrice(rs.getBigDecimal("ORD_TOTALPRICE"));
				serOrdVO.setOrdPrePay(rs.getBigDecimal("ORD_PREPAY"));
				serOrdVO.setOrdPayType(rs.getByte("ORD_PAYTYPE"));
				serOrdVO.setOrdPayDate(rs.getDate("ORD_PAY_DATE"));
				serOrdVO.setOrdFpay(rs.getBigDecimal("ORD_FPAY"));
				serOrdVO.setOrdFpayType(rs.getByte("ORD_FPAYTYPE"));
				serOrdVO.setOrdFpayDate(rs.getDate("ORD_FPAY_DATE"));
				serOrdVO.setOrdBuyerScore(rs.getInt("ORD_BUYER_SCORE"));
				serOrdVO.setOrdBuyerTxt(rs.getString("ORD_BUYER_TXT"));
				serOrdVO.setOrdVdrScore(rs.getInt("ORD_VDR_SCORE"));
				serOrdVO.setOrdVdrTxt(rs.getString("ORD_VDR_TXT"));
				serOrdVO.setOrdNote(rs.getString("ORD_NOTE"));
				list.add(serOrdVO);
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}



	@Override
	public List<SerOrdVO> findOrdByVdrID(Integer ordVdrID) {
		List<SerOrdVO> list= new ArrayList<SerOrdVO>();
		SerOrdVO serOrdVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_ORD_BY_VDRID);
			pstmt.setInt(1, ordVdrID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serOrdVO = new SerOrdVO();
				
				serOrdVO.setOrdID(rs.getInt("ORD_ID"));
				serOrdVO.setOrdStatus(rs.getByte("ORD_STATUS"));
				serOrdVO.setOrdPayStatus(rs.getByte("ORD_PAY_STATUS"));
				serOrdVO.setOrdDmdID(rs.getInt("ORD_DMD_ID"));
				serOrdVO.setOrdQuoID(rs.getInt("ORD_QUO_ID"));
				serOrdVO.setOrdMemID(rs.getInt("ORD_MEM_ID"));
				serOrdVO.setOrdVdrID(rs.getInt("ORD_VDR_ID"));
				serOrdVO.setOrdSerClaID(rs.getInt("ORD_SER_CLA_ID"));
				serOrdVO.setOrdMemVatno(rs.getString("ORD_MEM_VATNO"));
				serOrdVO.setOrdVdrVatno(rs.getString("ORD_VDR_VATNO"));
				serOrdVO.setOrdClnName(rs.getString("ORD_CLN_NAME"));
				serOrdVO.setOrdClnTel(rs.getString("ORD_CLN_TEL"));
				serOrdVO.setOrdWorkDate(rs.getDate("ORD_WORK_DATE"));
				serOrdVO.setOrdCounty(rs.getString("ORD_COUNTY"));
				serOrdVO.setOrdDist(rs.getString("ORD_DIST"));
				serOrdVO.setOrdAddr(rs.getString("ORD_ADDR"));
				serOrdVO.setOrdItem(rs.getString("ORD_ITEM"));
				serOrdVO.setOrdTotalPrice(rs.getBigDecimal("ORD_TOTALPRICE"));
				serOrdVO.setOrdPrePay(rs.getBigDecimal("ORD_PREPAY"));
				serOrdVO.setOrdPayType(rs.getByte("ORD_PAYTYPE"));
				serOrdVO.setOrdPayDate(rs.getDate("ORD_PAY_DATE"));
				serOrdVO.setOrdFpay(rs.getBigDecimal("ORD_FPAY"));
				serOrdVO.setOrdFpayType(rs.getByte("ORD_FPAYTYPE"));
				serOrdVO.setOrdFpayDate(rs.getDate("ORD_FPAY_DATE"));
				serOrdVO.setOrdBuyerScore(rs.getInt("ORD_BUYER_SCORE"));
				serOrdVO.setOrdBuyerTxt(rs.getString("ORD_BUYER_TXT"));
				serOrdVO.setOrdVdrScore(rs.getInt("ORD_VDR_SCORE"));
				serOrdVO.setOrdVdrTxt(rs.getString("ORD_VDR_TXT"));
				serOrdVO.setOrdNote(rs.getString("ORD_NOTE"));
				list.add(serOrdVO);
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SerOrdVO> findOrdByMemID(Integer ordMemID) {
		List<SerOrdVO> list= new ArrayList<SerOrdVO>();
		SerOrdVO serOrdVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_ORD_BY_MEMID);
			pstmt.setInt(1, ordMemID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// 每次進來迴圈裡，就代表一筆資料，我們就產生一個Bean，包裝著查詢的資料，最後再回傳給呼叫端
				serOrdVO = new SerOrdVO();
				
				serOrdVO.setOrdID(rs.getInt("ORD_ID"));
				serOrdVO.setOrdStatus(rs.getByte("ORD_STATUS"));
				serOrdVO.setOrdPayStatus(rs.getByte("ORD_PAY_STATUS"));
				serOrdVO.setOrdDmdID(rs.getInt("ORD_DMD_ID"));
				serOrdVO.setOrdQuoID(rs.getInt("ORD_QUO_ID"));
				serOrdVO.setOrdMemID(rs.getInt("ORD_MEM_ID"));
				serOrdVO.setOrdVdrID(rs.getInt("ORD_VDR_ID"));
				serOrdVO.setOrdSerClaID(rs.getInt("ORD_SER_CLA_ID"));
				serOrdVO.setOrdMemVatno(rs.getString("ORD_MEM_VATNO"));
				serOrdVO.setOrdVdrVatno(rs.getString("ORD_VDR_VATNO"));
				serOrdVO.setOrdClnName(rs.getString("ORD_CLN_NAME"));
				serOrdVO.setOrdClnTel(rs.getString("ORD_CLN_TEL"));
				serOrdVO.setOrdWorkDate(rs.getDate("ORD_WORK_DATE"));
				serOrdVO.setOrdCounty(rs.getString("ORD_COUNTY"));
				serOrdVO.setOrdDist(rs.getString("ORD_DIST"));
				serOrdVO.setOrdAddr(rs.getString("ORD_ADDR"));
				serOrdVO.setOrdItem(rs.getString("ORD_ITEM"));
				serOrdVO.setOrdTotalPrice(rs.getBigDecimal("ORD_TOTALPRICE"));
				serOrdVO.setOrdPrePay(rs.getBigDecimal("ORD_PREPAY"));
				serOrdVO.setOrdPayType(rs.getByte("ORD_PAYTYPE"));
				serOrdVO.setOrdPayDate(rs.getDate("ORD_PAY_DATE"));
				serOrdVO.setOrdFpay(rs.getBigDecimal("ORD_FPAY"));
				serOrdVO.setOrdFpayType(rs.getByte("ORD_FPAYTYPE"));
				serOrdVO.setOrdFpayDate(rs.getDate("ORD_FPAY_DATE"));
				serOrdVO.setOrdBuyerScore(rs.getInt("ORD_BUYER_SCORE"));
				serOrdVO.setOrdBuyerTxt(rs.getString("ORD_BUYER_TXT"));
				serOrdVO.setOrdVdrScore(rs.getInt("ORD_VDR_SCORE"));
				serOrdVO.setOrdVdrTxt(rs.getString("ORD_VDR_TXT"));
				serOrdVO.setOrdNote(rs.getString("ORD_NOTE"));
				list.add(serOrdVO);
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public void finishOrd(Integer ordID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINISH_ORD);

			pstmt.setInt(1, ordID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		
	}

	@Override
	public void jobCompleted(Integer ordID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(JOB_COMPLETED);

			pstmt.setInt(1, ordID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		
	}

	@Override
	public void creditPay(Integer ordID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CREDIT_PAY);

			pstmt.setInt(1, ordID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		
	}
	
}
