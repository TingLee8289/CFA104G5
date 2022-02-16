package ezs.ren_favorites.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.Util;
import util.jdbcUtil_CompositeQuery_RenFav;

public class RenFavoritesDAO implements RenFavoritesDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_FAVORITES` (fav_lis_id, fav_mem_id, fav_add_time) VALUES (?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`REN_FAVORITES` SET fav_add_time = ? WHERE (fav_lis_id = ? AND fav_mem_id = ?)";	
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`REN_FAVORITES` WHERE (fav_lis_id = ? AND fav_mem_id = ?)";
	private static final String FIND_BY_PK = "SELECT * FROM `CFA104G5`.`REN_FAVORITES` WHERE (fav_lis_id = ? AND fav_mem_id = ?)";
	private static final String GET_ALL = "SELECT * FROM `CFA104G5`.`REN_FAVORITES` ORDER BY fav_add_time DESC";
	private static final String FIND_BY_MEM = "SELECT * FROM `CFA104G5`.`REN_FAVORITES` WHERE (fav_mem_id = ?) ORDER BY fav_add_time DESC";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(RenFavoritesVO favoritesVO) {
		
		try {			
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);		
			
			pstmt.setInt(1, favoritesVO.getFavLisId());
			pstmt.setInt(2, favoritesVO.getFavMemId());
			pstmt.setTimestamp(3, favoritesVO.getFavAddTime());		
			
			pstmt.executeUpdate();
		
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}		
	}
	
	@Override
	public void update(RenFavoritesVO favoritesVO) {
		
		try {			
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);			
			
			pstmt.setTimestamp(1, favoritesVO.getFavAddTime());
			pstmt.setInt(2, favoritesVO.getFavLisId());
			pstmt.setInt(3, favoritesVO.getFavMemId());			
			
			pstmt.executeUpdate();
		
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}	
	}	

	@Override
	public void delete(Integer favLisId, Integer favMemId) {
	
		try {
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setInt(1, favLisId);
			pstmt.setInt(2, favMemId);
			
			pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}	
	}

	@Override
	public RenFavoritesVO findByPK(Integer favLisId, Integer favMemId) {
		RenFavoritesVO fav = null;

		try {
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			
			pstmt.setInt(1, favLisId);
			pstmt.setInt(2, favMemId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				fav = new RenFavoritesVO();
				fav.setFavLisId(rs.getInt("fav_lis_id"));
				fav.setFavMemId(rs.getInt("fav_mem_id"));
				fav.setFavAddTime(rs.getTimestamp("fav_add_time"));
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return fav;
	}

	@Override
	public List<RenFavoritesVO> getAll(Integer favMemId) {
		List<RenFavoritesVO> favList = new ArrayList<>();
		RenFavoritesVO fav = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_MEM);
			pstmt.setInt(1, favMemId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				fav = new RenFavoritesVO();
				fav.setFavLisId(rs.getInt("fav_lis_id"));
				fav.setFavMemId(rs.getInt("fav_mem_id"));
				fav.setFavAddTime(rs.getTimestamp("fav_add_time"));
				favList.add(fav);
			}	
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return favList;
	}
	
	@Override
	public List<RenFavoritesVO> getAll() {
		List<RenFavoritesVO> favList = new ArrayList<>();
		RenFavoritesVO fav = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				fav = new RenFavoritesVO();
				fav.setFavLisId(rs.getInt("fav_lis_id"));
				fav.setFavMemId(rs.getInt("fav_mem_id"));
				fav.setFavAddTime(rs.getTimestamp("fav_add_time"));
				favList.add(fav);
			}	
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return favList;
	}
	
	@Override
	public List<RenFavoritesVO> getAll(Map<String, String[]> map){
		List<RenFavoritesVO> list = new ArrayList<RenFavoritesVO>();
		RenFavoritesVO renFavoritesVO = null;
	
		try {
			
			con = ds.getConnection();
			String finalSQL = "select * from `CFA104G5`.`REN_FAVORITES` "
		          + jdbcUtil_CompositeQuery_RenFav.get_WhereCondition(map)
		          + "order by fav_add_time DESC";
			pstmt = con.prepareStatement(finalSQL);
//			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				renFavoritesVO = new RenFavoritesVO();
				renFavoritesVO.setFavLisId(rs.getInt("fav_lis_id"));
				renFavoritesVO.setFavMemId(rs.getInt("fav_mem_id"));
				renFavoritesVO.setFavAddTime(rs.getTimestamp("fav_add_time"));
				list.add(renFavoritesVO); // Store the row in the List
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
		

}
