package ezs.sec_ord.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import util.Util;

public class SecOrdJDBCDAO implements SecOrdDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO " + "`CFA104G5`.`SEC_ORD` "
			+ "(sh_buyerid, sh_sellerid, sh_postcode, sh_county, sh_dist, "
			+ "sh_road, sh_payment, sh_ord_status, sh_price, sh_date, "
			+ "sh_buyer_score, sh_buyer_txt, sh_seller_score, sh_seller_txt, sh_appdate, " + "sh_notes) " + "VALUES "
			+ "(?, ?, ?, ?, ?" + ", ?, ?, ?, ?, ?" + ", ?, ?, ?, ?, ?" + ", ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_ORD` WHERE sh_ord_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_ORD` "
			+ "set sh_buyerid=?, sh_sellerid=?, sh_postcode=?, sh_county=?, sh_dist=?, "
			+ "sh_road=?, sh_payment=?, sh_ord_status=?, sh_price=?, sh_date=?, "
			+ "sh_buyer_score=?, sh_buyer_txt=?, sh_seller_score=?, sh_seller_txt=?, sh_appdate=?, " + "sh_notes=?"
			+ "WHERE sh_ord_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` WHERE sh_ord_id = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` ORDER BY sh_ord_id";
	private static final String GET_ALL_BY_MEMID_STMT = "SELECT * FROM `CFA104G5`.`SEC_ORD` WHERE sh_buyerid = ? ORDER BY sh_date desc;";

	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(SecOrdVO secOrdVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
//			pstmt.setInt(1, secOrdVO.getShOrdID());
			pstmt.setInt(1, secOrdVO.getShBuyerID());
			pstmt.setInt(2, secOrdVO.getShSellerID());
			pstmt.setInt(3, secOrdVO.getShPostcode());
			pstmt.setString(4, secOrdVO.getShCounty());
			pstmt.setString(5, secOrdVO.getShDist());
			pstmt.setString(6, secOrdVO.getShRoad());
			pstmt.setInt(7, secOrdVO.getShPayment());
			pstmt.setInt(8, secOrdVO.getShOrdStatus());
			pstmt.setBigDecimal(9, secOrdVO.getShPrice());
			pstmt.setDate(10, secOrdVO.getShDate());
			pstmt.setInt(11, secOrdVO.getShBuyerScore());
			pstmt.setString(12, secOrdVO.getShBuyerTXT());
			pstmt.setInt(13, secOrdVO.getShSellerScore());
			pstmt.setString(14, secOrdVO.getShSellerTXT());
			pstmt.setDate(15, secOrdVO.getShAPPDate());
			pstmt.setString(16, secOrdVO.getShNotes());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer shOrdID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shOrdID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecOrdVO secOrdVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, secOrdVO.getShBuyerID());
			pstmt.setInt(2, secOrdVO.getShSellerID());
			pstmt.setInt(3, secOrdVO.getShPostcode());
			pstmt.setString(4, secOrdVO.getShCounty());
			pstmt.setString(5, secOrdVO.getShDist());
			pstmt.setString(6, secOrdVO.getShRoad());
			pstmt.setInt(7, secOrdVO.getShPayment());
			pstmt.setInt(8, secOrdVO.getShOrdStatus());
			pstmt.setBigDecimal(9, secOrdVO.getShPrice());
			pstmt.setDate(10, secOrdVO.getShDate());
			pstmt.setInt(11, secOrdVO.getShBuyerScore());
			pstmt.setString(12, secOrdVO.getShBuyerTXT());
			pstmt.setInt(13, secOrdVO.getShSellerScore());
			pstmt.setString(14, secOrdVO.getShSellerTXT());
			pstmt.setDate(15, secOrdVO.getShAPPDate());
			pstmt.setString(16, secOrdVO.getShNotes());
			pstmt.setInt(17, secOrdVO.getShOrdID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecOrdVO findByPrimaryKey(Integer shOrdID) {

		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shOrdID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
			}
			return secOrdVO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<SecOrdVO> getAll() {
		List<SecOrdVO> list = new ArrayList<SecOrdVO>();
		SecOrdVO secOrdVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
				list.add(secOrdVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public Set<SecOrdVO> getSecOrdByShBuyerID(Integer shBuyerID) {
		Set<SecOrdVO> set = new LinkedHashSet<SecOrdVO>();
		SecOrdVO secOrdVO = null;
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_MEMID_STMT);
			pstmt.setInt(1, shBuyerID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(rs.getInt("sh_ord_id"));
				secOrdVO.setShBuyerID(rs.getInt("sh_buyerid"));
				secOrdVO.setShSellerID(rs.getInt("sh_sellerid"));
				secOrdVO.setShPostcode(rs.getInt("sh_postcode"));
				secOrdVO.setShCounty(rs.getString("sh_county"));
				secOrdVO.setShDist(rs.getString("sh_dist"));
				secOrdVO.setShRoad(rs.getString("sh_road"));
				secOrdVO.setShPayment(rs.getInt("sh_payment"));
				secOrdVO.setShOrdStatus(rs.getInt("sh_ord_status"));
				secOrdVO.setShPrice(rs.getBigDecimal("sh_price"));
				secOrdVO.setShDate(rs.getDate("sh_date"));
				secOrdVO.setShBuyerScore(rs.getInt("sh_buyer_score"));
				secOrdVO.setShBuyerTXT(rs.getString("sh_buyer_txt"));
				secOrdVO.setShSellerScore(rs.getInt("sh_seller_score"));
				secOrdVO.setShSellerTXT(rs.getString("sh_seller_txt"));
				secOrdVO.setShAPPDate(rs.getDate("sh_appdate"));
				secOrdVO.setShNotes(rs.getString("sh_notes"));
				set.add(secOrdVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return set;
	}

}
