package ezs.ser_vdr.model;

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

public class SerVdrDAO implements SerVdrDAO_interface {
	public static final String INSERT = "INSERT INTO ser_vdr (vdr_id, vdr_status, vdr_name, vdr_tel ,vdr_vatno, vdr_county, vdr_dist, vdr_addr, vdr_open, vdr_intro, vdr_pic, vdr_rev_count, vdr_rev_score) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	public static final String UPDATE = "UPDATE ser_vdr SET vdr_status = ?, vdr_name = ?, vdr_tel = ?, vdr_vatno = ?, vdr_county = ?, vdr_dist = ?, vdr_addr = ?, vdr_open = ?, vdr_intro = ?, vdr_pic = ?, vdr_rev_count = ?, vdr_rev_score = ? WHERE vdr_id = ?";
	public static final String DELETE = "DELETE FROM ser_vdr WHERE vdr_id = ?";
	public static final String FIND_BY_PK = "SELECT * FROM ser_vdr WHERE vdr_id = ?";
	public static final String GET_ALL = "SELECT * FROM ser_vdr";

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
	public void insert(SerVdrVO serVdrVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, serVdrVO.getVdrID());
			pstmt.setInt(2, serVdrVO.getVdrStatus());
			pstmt.setString(3, serVdrVO.getVdrName());
			pstmt.setString(4, serVdrVO.getVdrTel());
			pstmt.setString(5, serVdrVO.getVdrVatno());
			pstmt.setString(6, serVdrVO.getVdrCounty());
			pstmt.setString(7, serVdrVO.getVdrDist());
			pstmt.setString(8, serVdrVO.getVdrAddr());
			pstmt.setString(9, serVdrVO.getVdrOpen());
			pstmt.setString(10, serVdrVO.getVdrIntro());
			pstmt.setBytes(11, serVdrVO.getVdrPic());
			pstmt.setInt(12, serVdrVO.getVdrRevCount());
			pstmt.setInt(13, serVdrVO.getVdrRevScore());

			pstmt.executeUpdate();
			
			

		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
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

	}

	@Override
	public void update(SerVdrVO serVdrVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, serVdrVO.getVdrStatus());
			pstmt.setString(2, serVdrVO.getVdrName());
			pstmt.setString(3, serVdrVO.getVdrTel());
			pstmt.setString(4, serVdrVO.getVdrVatno());
			pstmt.setString(5, serVdrVO.getVdrCounty());
			pstmt.setString(6, serVdrVO.getVdrDist());
			pstmt.setString(7, serVdrVO.getVdrAddr());
			pstmt.setString(8, serVdrVO.getVdrOpen());
			pstmt.setString(9, serVdrVO.getVdrIntro());
			pstmt.setBytes(10, serVdrVO.getVdrPic());
			pstmt.setInt(11, serVdrVO.getVdrRevCount());
			pstmt.setInt(12, serVdrVO.getVdrRevScore());
			pstmt.setInt(13, serVdrVO.getVdrID());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	}

	@Override
	public void delete(Integer vdrID) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, vdrID);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	}

	@Override
	public SerVdrVO findByPrimaryKey(Integer vdrID) {
		SerVdrVO serVdrVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, vdrID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				serVdrVO = new SerVdrVO();
				serVdrVO.setVdrID(vdrID);
				serVdrVO.setVdrStatus(rs.getByte("vdr_status"));
				serVdrVO.setVdrName(rs.getString("vdr_name"));
				serVdrVO.setVdrTel(rs.getString("vdr_tel"));
				serVdrVO.setVdrVatno(rs.getString("vdr_vatno"));
				serVdrVO.setVdrCounty(rs.getString("vdr_county"));
				serVdrVO.setVdrDist(rs.getString("vdr_dist"));
				serVdrVO.setVdrAddr(rs.getString("vdr_addr"));
				serVdrVO.setVdrOpen(rs.getString("vdr_open"));
				serVdrVO.setVdrIntro(rs.getString("vdr_intro"));
				serVdrVO.setVdrPic(rs.getBytes("vdr_pic"));
				serVdrVO.setVdrRevCount(rs.getInt("vdr_rev_count"));
				serVdrVO.setVdrRevScore(rs.getInt("vdr_rev_score"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
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

		return serVdrVO;
	}

	@Override
	public List<SerVdrVO> getAll() {
		List<SerVdrVO> serVdrVOList = new ArrayList<>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SerVdrVO serVdrVO = new SerVdrVO();

				serVdrVO.setVdrID(rs.getInt("vdr_id"));
				serVdrVO.setVdrStatus(rs.getByte("vdr_status"));
				serVdrVO.setVdrName(rs.getString("vdr_name"));
				serVdrVO.setVdrTel(rs.getString("vdr_tel"));
				serVdrVO.setVdrVatno(rs.getString("vdr_vatno"));
				serVdrVO.setVdrCounty(rs.getString("vdr_county"));
				serVdrVO.setVdrDist(rs.getString("vdr_dist"));
				serVdrVO.setVdrAddr(rs.getString("vdr_addr"));
				serVdrVO.setVdrOpen(rs.getString("vdr_open"));
				serVdrVO.setVdrIntro(rs.getString("vdr_intro"));
				serVdrVO.setVdrPic(rs.getBytes("vdr_pic"));
				serVdrVO.setVdrRevCount(rs.getInt("vdr_rev_count"));
				serVdrVO.setVdrRevScore(rs.getInt("vdr_rev_score"));

				serVdrVOList.add(serVdrVO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
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

		return serVdrVOList;
	}

}
