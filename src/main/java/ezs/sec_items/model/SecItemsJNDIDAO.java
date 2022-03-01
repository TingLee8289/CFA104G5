package ezs.sec_items.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.Util;

public class SecItemsJNDIDAO implements SecItemsDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_ITEMS` (sh_cate_id, sh_sellerid, sh_name, sh_price, sh_qty, "
			+ "sh_size, sh_description, sh_condition, sh_time, sh_guarantee, sh_status, sh_county, sh_dist) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_ITEMS` SET sh_cate_id=?, sh_name=?, sh_price=?, sh_qty=?, sh_size=?, sh_description=?, sh_condition=?, sh_time=?, sh_guarantee=?, sh_county=?, sh_dist=? WHERE sh_id = ?";

	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_sellerid =?";

	private static final String GET_ONE_STMT2 = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_id = ?";

	private static final String GET_ALL_STMT2 = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_sellerid = ? ORDER BY sh_id DESC";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` ORDER BY sh_id DESC";
	private static final String GET_BY_CATE_STMT = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_sellerid =? AND sh_cate_id=?";
	private static final String GET_BY_CATE_STMT2 = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_cate_id=?";
	private static final String GET_STATUS_STMT = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_sellerid =? AND sh_status = ?";

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
	public Integer insert(SecItemsVO secItemsVO) {
		Integer key = 0;
		try {
//			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, secItemsVO.getShCateID());
			pstmt.setInt(2, secItemsVO.getShSellerID());
			System.out.println("JDBCDAO" + secItemsVO.getShSellerID());
			pstmt.setString(3, secItemsVO.getShName());
			pstmt.setBigDecimal(4, secItemsVO.getShPrice());
			pstmt.setInt(5, secItemsVO.getShQTY());
			pstmt.setString(6, secItemsVO.getShSize());
			pstmt.setString(7, secItemsVO.getShDescription());
			pstmt.setString(8, secItemsVO.getShCondition());
			pstmt.setString(9, secItemsVO.getShTime());
			pstmt.setString(10, secItemsVO.getShGuarantee());
			pstmt.setInt(11, secItemsVO.getShStatus());
			pstmt.setString(12, secItemsVO.getShCounty());
			pstmt.setString(13, secItemsVO.getShDist());
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				key = rs.getInt(1); // 只支援欄位索引值取得自增主鍵值
				System.out.println("自增主鍵值 = " + key + "(剛新增成功的商品編號)");
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}

			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return key;
	}

	@Override
	public void delete(Integer shID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecItemsVO secItemsVO) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, secItemsVO.getShCateID());
			pstmt.setString(2, secItemsVO.getShName());
			pstmt.setBigDecimal(3, secItemsVO.getShPrice());
			pstmt.setInt(4, secItemsVO.getShQTY());
			pstmt.setString(5, secItemsVO.getShSize());
			pstmt.setString(6, secItemsVO.getShDescription());
			pstmt.setString(7, secItemsVO.getShCondition());
			pstmt.setString(8, secItemsVO.getShTime());
			pstmt.setString(9, secItemsVO.getShGuarantee());
			pstmt.setString(10, secItemsVO.getShCounty());
			pstmt.setString(11, secItemsVO.getShDist());
			pstmt.setInt(12, secItemsVO.getShID());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecItemsVO findByPrimaryKey(Integer shSellerID, Integer shID) {

		SecItemsVO secItemsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shSellerID);
			
			System.out.println(shSellerID);
			System.out.println(shID);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return secItemsVO;
	}

	@Override
	public List<SecItemsVO> getAll() {
		List<SecItemsVO> list = new ArrayList<SecItemsVO>();
		SecItemsVO secItemsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
				list.add(secItemsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
	@Override
	public List<SecItemsVO> getAll2(Integer shSellerID) {
		List<SecItemsVO> list = new ArrayList<SecItemsVO>();
		SecItemsVO secItemsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT2);
			pstmt.setInt(1, shSellerID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
				list.add(secItemsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SecItemsVO> findByShCategory(Integer shSellerID,Integer shCateID) {
		List<SecItemsVO> list = new ArrayList<SecItemsVO>();
		SecItemsVO secItemsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_CATE_STMT);
			pstmt.setInt(1, shSellerID);
			pstmt.setInt(2, shCateID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
				list.add(secItemsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
		
	}
	
	@Override
	public List<SecItemsVO> findByShCategory2(Integer shCateID) {
		List<SecItemsVO> list = new ArrayList<SecItemsVO>();
		SecItemsVO secItemsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_CATE_STMT2);
			pstmt.setInt(1, shCateID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
				list.add(secItemsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
		
	}
	@Override
	public List<SecItemsVO> findByStatus(Integer shSellerID,Integer shStatus) {
		List<SecItemsVO> list = new ArrayList<SecItemsVO>();
		SecItemsVO secItemsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STATUS_STMT);
			pstmt.setInt(1, shSellerID);
			pstmt.setInt(2, shStatus);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
				list.add(secItemsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
		
	}

	@Override
	public SecItemsVO getOneSecItemsByShID(Integer shID) {
		SecItemsVO secItemsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT2);
			pstmt.setInt(1, shID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secItemsVO = new SecItemsVO();
				secItemsVO.setShID(rs.getInt("sh_id"));
				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
				secItemsVO.setShName(rs.getString("sh_name"));
				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
				secItemsVO.setShQTY(rs.getInt("sh_qty"));
				secItemsVO.setShSize(rs.getString("sh_size"));
				secItemsVO.setShDescription(rs.getString("sh_description"));
				secItemsVO.setShCondition(rs.getString("sh_condition"));
				secItemsVO.setShTime(rs.getString("sh_time"));
				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
				secItemsVO.setShStatus(rs.getInt("sh_status"));
				secItemsVO.setShCounty(rs.getString("sh_county"));
				secItemsVO.setShDist(rs.getString("sh_dist"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return secItemsVO;
	}

//	@Override
//	public SecItemsVO getShStatusAll(Integer shStatus) {
//	
//		SecItemsVO secItemsVO = null;
//
//		try {
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(GET_STATUS_STMT);
//			pstmt.setInt(1, shStatus);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				secItemsVO = new SecItemsVO();
//				secItemsVO.setShStatus(rs.getInt("sh_status"));
//				secItemsVO.setShID(rs.getInt("sh_id"));
//				secItemsVO.setShCateID(rs.getInt("sh_cate_id"));
//				secItemsVO.setShSellerID(rs.getInt("sh_sellerid"));
//				secItemsVO.setShName(rs.getString("sh_name"));
//				secItemsVO.setShPrice(rs.getBigDecimal("sh_price"));
//				secItemsVO.setShQTY(rs.getInt("sh_qty"));
//				secItemsVO.setShSize(rs.getString("sh_size"));
//				secItemsVO.setShDescription(rs.getString("sh_description"));
//				secItemsVO.setShCondition(rs.getString("sh_condition"));
//				secItemsVO.setShTime(rs.getString("sh_time"));
//				secItemsVO.setShGuarantee(rs.getString("sh_guarantee"));
//				secItemsVO.setShCounty(rs.getString("sh_county"));
//				secItemsVO.setShDist(rs.getString("sh_dist"));
//				
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			Util.closeResource(con, pstmt, rs);
//		}
//		return null;
//	}

}