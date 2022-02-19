package ezs.ren_location.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import ezs.ren_listing.model.RenListingVO;
import util.Util;

public class RenLocationJDBCDAO implements RenLocationDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LOCATION` (loc_city, loc_dist) VALUES(?,?)";
	private static final String GET_ALL_STMT = "SELECT loc_id, loc_city, loc_dist FROM `CFA104G5`.`REN_LOCATION` ORDER BY loc_id";
	private static final String GET_ONE_STMT = "SELECT loc_id, loc_city, loc_dist FROM `CFA104G5`.`REN_LOCATION` WHERE loc_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LOCATION` WHERE loc_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LOCATION` SET  loc_city=?, loc_dist=? WHERE loc_id = ?";
	private static final String GET_RenListing_BylisAreaID_STMT = "SELECT LIS_ID, LIS_LDD_ID, LIS_RT_ID, LIS_TITLE,LIS_AREA_ID FROM `CFA104G5`.`REN_LISTING` where LIS_AREA_ID = ? order by LIS_ID";

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
	public void insert(RenLocationVO renLocationVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, renLocationVO.getLocCity());
			pstmt.setString(2, renLocationVO.getLocDist());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenLocationVO renLocationVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, renLocationVO.getLocCity());
			pstmt.setString(2, renLocationVO.getLocDist());
			pstmt.setInt(3, renLocationVO.getLocID());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer locID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, locID);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenLocationVO findByPrimaryKey(Integer locID) {
		RenLocationVO renLocationVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, locID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLocationVO = new RenLocationVO();
				renLocationVO.setLocID(rs.getInt("LOC_ID"));
				renLocationVO.setLocCity(rs.getString("LOC_CITY"));
				renLocationVO.setLocDist(rs.getString("LOC_DIST"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return renLocationVO;
	}

	@Override
	public List<RenLocationVO> getAll() {
		List<RenLocationVO> list = new ArrayList<RenLocationVO>();
		RenLocationVO renLocationVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLocationVO = new RenLocationVO();
				renLocationVO.setLocID(rs.getInt("LOC_ID"));
				renLocationVO.setLocCity(rs.getString("LOC_CITY"));
				renLocationVO.setLocDist(rs.getString("LOC_DIST"));
				list.add(renLocationVO); // Store the row in the list
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
	@Override
	public Set<RenListingVO> getRenListingByLisAreaID(Integer lisAreaID) {
		Set<RenListingVO> set = new LinkedHashSet<RenListingVO>();
		RenListingVO renListingVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_RenListing_BylisAreaID_STMT);

			pstmt.setInt(1, lisAreaID);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				renListingVO = new RenListingVO();
				
				renListingVO.setLisID(rs.getInt("LIS_ID"));
				renListingVO.setLisLddID(rs.getInt("LIS_LDD_ID"));
				renListingVO.setLisRtID(rs.getInt("LIS_RT_ID"));
				renListingVO.setLisAreaID(rs.getInt("LIS_AREA_ID"));
				renListingVO.setLisTitle(rs.getString("LIS_TITLE"));
				set.add(renListingVO); // Store the row in the vector
			}
			}catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return set;
			
		}

}
