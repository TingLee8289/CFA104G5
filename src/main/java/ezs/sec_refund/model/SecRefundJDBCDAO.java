package ezs.sec_refund.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SecRefundJDBCDAO implements SecRefundDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_REFUND` (sh_ord_id,sh_ref_content,sh_ref_applydate,sh_ref_status) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT sh_ref_id,sh_ord_id,sh_ref_content,sh_ref_applydate,sh_ref_status FROM `CFA104G5`.`SEC_REFUND` ORDER BY sh_ref_id";
	private static final String GET_ONE_STMT = "SELECT sh_ref_id,sh_ord_id,sh_ref_content,sh_ref_applydate,sh_ref_status FROM `CFA104G5`.`SEC_REFUND` WHERE sh_ref_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`SEC_REFUND` WHERE sh_ref_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`SEC_REFUND` SET sh_ord_id=?, sh_ref_content=?, sh_ref_applydate=?, sh_ref_status=? WHERE sh_ref_id = ?";

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
	public void insert(SecRefundVO refundVO) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, refundVO.getShOrdID());
			pstmt.setString(2, refundVO.getShRefContent());
			pstmt.setDate(3, refundVO.getShRefApplyDate());
			pstmt.setInt(4, refundVO.getShRefStatus());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SecRefundVO refundVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, refundVO.getShOrdID());
			pstmt.setString(2, refundVO.getShRefContent());
			pstmt.setDate(3, refundVO.getShRefApplyDate());
			pstmt.setInt(4, refundVO.getShRefStatus());
			pstmt.setDouble(5, refundVO.getShRefID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer shRefID) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, shRefID);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SecRefundVO findByPrimaryKey(Integer shRefID) {

		SecRefundVO refundVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, shRefID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				refundVO = new SecRefundVO();
				refundVO.setShRefID(rs.getInt("sh_ref_ID"));
				refundVO.setShOrdID(rs.getInt("sh_ord_ID"));
				refundVO.setShRefContent(rs.getString("sh_ref_content"));
				refundVO.setShRefApplyDate(rs.getDate("sh_ref_applydate"));
				refundVO.setShRefStatus(rs.getInt("sh_ref_status"));

			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return refundVO;

	}

	@Override
	public List<SecRefundVO> getAll() {

		List<SecRefundVO> list = new ArrayList<SecRefundVO>();
		SecRefundVO refundVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				refundVO = new SecRefundVO();
				refundVO.setShRefID(rs.getInt("sh_ref_id"));
				refundVO.setShOrdID(rs.getInt("sh_ord_id"));
				refundVO.setShRefContent(rs.getString("sh_ref_content"));
				refundVO.setShRefApplyDate(rs.getDate("sh_ref_applydate"));
				refundVO.setShRefStatus(rs.getInt("sh_ref_status"));
				list.add(refundVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
