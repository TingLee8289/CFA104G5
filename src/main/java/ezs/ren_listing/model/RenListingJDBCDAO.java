package ezs.ren_listing.model;

import java.math.BigDecimal;
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

public class RenListingJDBCDAO implements RenListingDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LISTING` (LIS_LDD_ID, LIS_RT_ID, LIS_AREA_ID, LIS_TITLE, LIS_ABT, LIS_ADDRESS, LIS_RENT, LIS_MNG_FEE, LIS_PFEE, LIS_SQFT, LIS_FLR, LIS_RM_NO, LIS_CMN_AREA, LIS_BR_NO, LIS_ETHERNET, LIS_WIFI, LIS_WH, LIS_SHENC, LIS_AC, LIS_FRIDGE, LIS_TV, LIS_WASHER, LIS_DRYER, LIS_TC, LIS_BED, LIS_CABINET, LIS_SOFA, LIS_PARKING, LIS_COOK, LIS_PET, LIS_SMOKING, LIS_MONLY, LIS_FONLY, LIS_SONLY) VALUES (?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
//	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LISTING` (LIS_LDD_ID, LIS_RT_ID, LIS_AREA_ID, LIS_TITLE, LIS_ABT, LIS_ADDRESS, LIS_RENT, LIS_MNG_FEE, LIS_PFEE, LIS_SQFT, LIS_FLR, LIS_RM_NO, LIS_CMN_AREA, LIS_BR_NO, LIS_ETHERNET, LIS_WIFI, LIS_WH, LIS_SHENC, LIS_AC, LIS_FRIDGE, LIS_TV, LIS_WASHER, LIS_DRYER, LIS_TC, LIS_BED, LIS_CABINET, LIS_SOFA, LIS_PARKING, LIS_COOK, LIS_PET, LIS_SMOKING, LIS_MONLY, LIS_FONLY, LIS_SONLY, LIS_STATUS, LIS_APPROVAL) VALUES (?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?)";
	private static final String GET_ALL_STMT = "SELECT LIS_ID, LIS_LDD_ID, LIS_RT_ID, LIS_AREA_ID, LIS_TITLE, LIS_ABT, LIS_ADDRESS, LIS_RENT, LIS_MNG_FEE, LIS_PFEE, LIS_SQFT, LIS_FLR, LIS_RM_NO, LIS_CMN_AREA, LIS_BR_NO, LIS_ETHERNET, LIS_WIFI, LIS_WH, LIS_SHENC, LIS_AC, LIS_FRIDGE, LIS_TV, LIS_WASHER, LIS_DRYER, LIS_TC, LIS_BED, LIS_CABINET, LIS_SOFA, LIS_PARKING, LIS_COOK, LIS_PET, LIS_SMOKING, LIS_MONLY, LIS_FONLY, LIS_SONLY, LIS_STATUS, LIS_APPROVAL FROM `CFA104G5`.`REN_LISTING` order by LIS_ID";
	private static final String GET_ONE_STMT = "SELECT LIS_ID, LIS_LDD_ID, LIS_RT_ID, LIS_AREA_ID, LIS_TITLE, LIS_ABT, LIS_ADDRESS, LIS_RENT, LIS_MNG_FEE, LIS_PFEE, LIS_SQFT, LIS_FLR, LIS_RM_NO, LIS_CMN_AREA, LIS_BR_NO, LIS_ETHERNET, LIS_WIFI, LIS_WH, LIS_SHENC, LIS_AC, LIS_FRIDGE, LIS_TV, LIS_WASHER, LIS_DRYER, LIS_TC, LIS_BED, LIS_CABINET, LIS_SOFA, LIS_PARKING, LIS_COOK, LIS_PET, LIS_SMOKING, LIS_MONLY, LIS_FONLY, LIS_SONLY, LIS_STATUS, LIS_APPROVAL FROM `CFA104G5`.`REN_LISTING`where LIS_ID = ?";
	private static final String GET_ONE_STMT_BYLisLddID = "SELECT LIS_ID, LIS_LDD_ID, LIS_RT_ID, LIS_AREA_ID, LIS_TITLE, LIS_ABT, LIS_ADDRESS, LIS_RENT, LIS_MNG_FEE, LIS_PFEE, LIS_SQFT, LIS_FLR, LIS_RM_NO, LIS_CMN_AREA, LIS_BR_NO, LIS_ETHERNET, LIS_WIFI, LIS_WH, LIS_SHENC, LIS_AC, LIS_FRIDGE, LIS_TV, LIS_WASHER, LIS_DRYER, LIS_TC, LIS_BED, LIS_CABINET, LIS_SOFA, LIS_PARKING, LIS_COOK, LIS_PET, LIS_SMOKING, LIS_MONLY, LIS_FONLY, LIS_SONLY, LIS_STATUS, LIS_APPROVAL FROM `CFA104G5`.`REN_LISTING`where  LIS_LDD_ID= ? order by LIS_ID";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LISTING` where LIS_ID = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LISTING` set LIS_LDD_ID=?, LIS_RT_ID=?, LIS_AREA_ID=?, LIS_TITLE=?, LIS_ABT=?, LIS_ADDRESS=?, LIS_RENT=?, LIS_MNG_FEE=?, LIS_PFEE=?, LIS_SQFT=?, LIS_FLR=?, LIS_RM_NO=?, LIS_CMN_AREA=?, LIS_BR_NO=?, LIS_ETHERNET=?, LIS_WIFI=?, LIS_WH=?, LIS_SHENC=?, LIS_AC=?, LIS_FRIDGE=?, LIS_TV=?, LIS_WASHER=?, LIS_DRYER=?, LIS_TC=?, LIS_BED=?, LIS_CABINET=?, LIS_SOFA=?, LIS_PARKING=?, LIS_COOK=?, LIS_PET=?, LIS_SMOKING=?, LIS_MONLY=?, LIS_FONLY=?, LIS_SONLY=?, LIS_STATUS=?, LIS_APPROVAL=? where LIS_ID = ?";

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
	public Integer insert(RenListingVO renListingVO) {
		Integer key = 0;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, renListingVO.getLisLddID());
			pstmt.setInt(2, renListingVO.getLisRtID());
			pstmt.setInt(3, renListingVO.getLisAreaID());
			pstmt.setString(4, renListingVO.getLisTitle());
			pstmt.setString(5, renListingVO.getLisAbt());
			pstmt.setString(6, renListingVO.getLisAddress());
			pstmt.setBigDecimal(7, renListingVO.getLisRent());
			pstmt.setBigDecimal(8, renListingVO.getLisMngFee());
			pstmt.setBigDecimal(9, renListingVO.getLisPfee());
			pstmt.setDouble(10, renListingVO.getLisSqft());
			pstmt.setString(11, renListingVO.getLisFlr());
			pstmt.setInt(12, renListingVO.getLisRmNo());
			pstmt.setInt(13, renListingVO.getLisCmnArea());
			pstmt.setInt(14, renListingVO.getLisBrNo());
			pstmt.setInt(15, renListingVO.getLisEthernet());
			pstmt.setInt(16, renListingVO.getLisWifi());
			pstmt.setInt(17, renListingVO.getLisWh());
			pstmt.setInt(18, renListingVO.getLisShenc());
			pstmt.setInt(19, renListingVO.getLisAc());
			pstmt.setInt(20, renListingVO.getLisFridge());
			pstmt.setInt(21, renListingVO.getLisTv());
			pstmt.setInt(22, renListingVO.getLisWasher());
			pstmt.setInt(23, renListingVO.getLisDryer());
			pstmt.setInt(24, renListingVO.getLisTc());
			pstmt.setInt(25, renListingVO.getLisBed());
			pstmt.setInt(26, renListingVO.getLisCabinet());
			pstmt.setInt(27, renListingVO.getLisSofa());
			pstmt.setInt(28, renListingVO.getLisParking());
			pstmt.setInt(29, renListingVO.getLisCook());
			pstmt.setInt(30, renListingVO.getLisPet());
			pstmt.setInt(31, renListingVO.getLisSmoking());
			pstmt.setInt(32, renListingVO.getLisMonly());
			pstmt.setInt(33, renListingVO.getLisFonly());
			pstmt.setInt(34, renListingVO.getLisSonly());
//			pstmt.setInt(35, renListingVO.getLisStatus());
//			pstmt.setInt(36, renListingVO.getLisApproval());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				key = rs.getInt(1); // 只支援欄位索引值取得自增主鍵值
				System.out.println("自增主鍵值 = " + key + "(剛新增成功的商品編號)");
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return key;
	}

	@Override
	public void update(RenListingVO renListingVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, renListingVO.getLisLddID());
			pstmt.setInt(2, renListingVO.getLisRtID());
			pstmt.setInt(3, renListingVO.getLisAreaID());
			pstmt.setString(4, renListingVO.getLisTitle());
			pstmt.setString(5, renListingVO.getLisAbt());
			pstmt.setString(6, renListingVO.getLisAddress());
			pstmt.setBigDecimal(7, renListingVO.getLisRent());
			pstmt.setBigDecimal(8, renListingVO.getLisMngFee());
			pstmt.setBigDecimal(9, renListingVO.getLisPfee());
			pstmt.setDouble(10, renListingVO.getLisSqft());
			pstmt.setString(11, renListingVO.getLisFlr());
			pstmt.setInt(12, renListingVO.getLisRmNo());
			pstmt.setInt(13, renListingVO.getLisCmnArea());
			pstmt.setInt(14, renListingVO.getLisBrNo());
			pstmt.setInt(15, renListingVO.getLisEthernet());
			pstmt.setInt(16, renListingVO.getLisWifi());
			pstmt.setInt(17, renListingVO.getLisWh());
			pstmt.setInt(18, renListingVO.getLisShenc());
			pstmt.setInt(19, renListingVO.getLisAc());
			pstmt.setInt(20, renListingVO.getLisFridge());
			pstmt.setInt(21, renListingVO.getLisTv());
			pstmt.setInt(22, renListingVO.getLisWasher());
			pstmt.setInt(23, renListingVO.getLisDryer());
			pstmt.setInt(24, renListingVO.getLisTc());
			pstmt.setInt(25, renListingVO.getLisBed());
			pstmt.setInt(26, renListingVO.getLisCabinet());
			pstmt.setInt(27, renListingVO.getLisSofa());
			pstmt.setInt(28, renListingVO.getLisParking());
			pstmt.setInt(29, renListingVO.getLisCook());
			pstmt.setInt(30, renListingVO.getLisPet());
			pstmt.setInt(31, renListingVO.getLisSmoking());
			pstmt.setInt(32, renListingVO.getLisMonly());
			pstmt.setInt(33, renListingVO.getLisFonly());
			pstmt.setInt(34, renListingVO.getLisSonly());
			pstmt.setInt(35, renListingVO.getLisStatus());
			pstmt.setInt(36, renListingVO.getLisApproval());
			pstmt.setInt(37, renListingVO.getLisID());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer lisID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, lisID);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenListingVO findByPrimaryKey(Integer lisID) {
		RenListingVO renListingVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, lisID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renListingVO = new RenListingVO();
				renListingVO.setLisID(rs.getInt("LIS_ID"));
				renListingVO.setLisLddID(rs.getInt("LIS_LDD_ID"));
				renListingVO.setLisRtID(rs.getInt("LIS_RT_ID"));
				renListingVO.setLisAreaID(rs.getInt("LIS_AREA_ID"));
				renListingVO.setLisTitle(rs.getString("LIS_TITLE"));
				renListingVO.setLisAbt(rs.getString("LIS_ABT"));
				renListingVO.setLisAddress(rs.getString("LIS_ADDRESS"));
				renListingVO.setLisRent(rs.getBigDecimal("LIS_RENT"));
				renListingVO.setLisMngFee(rs.getBigDecimal("LIS_MNG_FEE"));
				renListingVO.setLisPfee(rs.getBigDecimal("LIS_PFEE"));
				renListingVO.setLisSqft(rs.getDouble("LIS_SQFT"));
				renListingVO.setLisFlr(rs.getString("LIS_FLR"));
				renListingVO.setLisRmNo(rs.getInt("LIS_RM_NO"));
				renListingVO.setLisCmnArea(rs.getInt("LIS_CMN_AREA"));
				renListingVO.setLisBrNo(rs.getInt("LIS_BR_NO"));
				renListingVO.setLisEthernet(rs.getInt("LIS_ETHERNET"));
				renListingVO.setLisWifi(rs.getInt("LIS_WIFI"));
				renListingVO.setLisWh(rs.getInt("LIS_WH"));
				renListingVO.setLisShenc(rs.getInt("LIS_SHENC"));
				renListingVO.setLisAc(rs.getInt("LIS_AC"));
				renListingVO.setLisFridge(rs.getInt("LIS_FRIDGE"));
				renListingVO.setLisTv(rs.getInt("LIS_TV"));
				renListingVO.setLisWasher(rs.getInt("LIS_WASHER"));
				renListingVO.setLisDryer(rs.getInt("LIS_DRYER"));
				renListingVO.setLisTc(rs.getInt("LIS_TC"));
				renListingVO.setLisBed(rs.getInt("LIS_BED"));
				renListingVO.setLisCabinet(rs.getInt("LIS_CABINET"));
				renListingVO.setLisSofa(rs.getInt("LIS_SOFA"));
				renListingVO.setLisParking(rs.getInt("LIS_PARKING"));
				renListingVO.setLisCook(rs.getInt("LIS_COOK"));
				renListingVO.setLisPet(rs.getInt("LIS_PET"));
				renListingVO.setLisSmoking(rs.getInt("LIS_SMOKING"));
				renListingVO.setLisMonly(rs.getInt("LIS_MONLY"));
				renListingVO.setLisFonly(rs.getInt("LIS_FONLY"));
				renListingVO.setLisSonly(rs.getInt("LIS_SONLY"));
				renListingVO.setLisStatus(rs.getInt("LIS_STATUS"));
				renListingVO.setLisApproval(rs.getInt("LIS_APPROVAL"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return renListingVO;
	}
	@Override
	public Set<RenListingVO>getRenListingByLisLddID(Integer lisLddID) {
		Set<RenListingVO> set = new LinkedHashSet<RenListingVO>();
		RenListingVO renListingVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT_BYLisLddID);
			pstmt.setInt(1, lisLddID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renListingVO = new RenListingVO();
				renListingVO.setLisID(rs.getInt("LIS_ID"));
				renListingVO.setLisLddID(rs.getInt("LIS_LDD_ID"));
				renListingVO.setLisRtID(rs.getInt("LIS_RT_ID"));
				renListingVO.setLisAreaID(rs.getInt("LIS_AREA_ID"));
				renListingVO.setLisTitle(rs.getString("LIS_TITLE"));
				renListingVO.setLisAbt(rs.getString("LIS_ABT"));
				renListingVO.setLisAddress(rs.getString("LIS_ADDRESS"));
				renListingVO.setLisRent(rs.getBigDecimal("LIS_RENT"));
				renListingVO.setLisMngFee(rs.getBigDecimal("LIS_MNG_FEE"));
				renListingVO.setLisPfee(rs.getBigDecimal("LIS_PFEE"));
				renListingVO.setLisSqft(rs.getDouble("LIS_SQFT"));
				renListingVO.setLisFlr(rs.getString("LIS_FLR"));
				renListingVO.setLisRmNo(rs.getInt("LIS_RM_NO"));
				renListingVO.setLisCmnArea(rs.getInt("LIS_CMN_AREA"));
				renListingVO.setLisBrNo(rs.getInt("LIS_BR_NO"));
				renListingVO.setLisEthernet(rs.getInt("LIS_ETHERNET"));
				renListingVO.setLisWifi(rs.getInt("LIS_WIFI"));
				renListingVO.setLisWh(rs.getInt("LIS_WH"));
				renListingVO.setLisShenc(rs.getInt("LIS_SHENC"));
				renListingVO.setLisAc(rs.getInt("LIS_AC"));
				renListingVO.setLisFridge(rs.getInt("LIS_FRIDGE"));
				renListingVO.setLisTv(rs.getInt("LIS_TV"));
				renListingVO.setLisWasher(rs.getInt("LIS_WASHER"));
				renListingVO.setLisDryer(rs.getInt("LIS_DRYER"));
				renListingVO.setLisTc(rs.getInt("LIS_TC"));
				renListingVO.setLisBed(rs.getInt("LIS_BED"));
				renListingVO.setLisCabinet(rs.getInt("LIS_CABINET"));
				renListingVO.setLisSofa(rs.getInt("LIS_SOFA"));
				renListingVO.setLisParking(rs.getInt("LIS_PARKING"));
				renListingVO.setLisCook(rs.getInt("LIS_COOK"));
				renListingVO.setLisPet(rs.getInt("LIS_PET"));
				renListingVO.setLisSmoking(rs.getInt("LIS_SMOKING"));
				renListingVO.setLisMonly(rs.getInt("LIS_MONLY"));
				renListingVO.setLisFonly(rs.getInt("LIS_FONLY"));
				renListingVO.setLisSonly(rs.getInt("LIS_SONLY"));
				renListingVO.setLisStatus(rs.getInt("LIS_STATUS"));
				renListingVO.setLisApproval(rs.getInt("LIS_APPROVAL"));
				set.add(renListingVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return set;
	}

	@Override
	public List<RenListingVO> getAll() {
		List<RenListingVO> list = new ArrayList<RenListingVO>();
		RenListingVO renListingVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renListingVO = new RenListingVO();
				renListingVO.setLisID(rs.getInt("LIS_ID"));
				renListingVO.setLisLddID(rs.getInt("LIS_LDD_ID"));
				renListingVO.setLisRtID(rs.getInt("LIS_RT_ID"));
				renListingVO.setLisAreaID(rs.getInt("LIS_AREA_ID"));
				renListingVO.setLisTitle(rs.getString("LIS_TITLE"));
				renListingVO.setLisAbt(rs.getString("LIS_ABT"));
				renListingVO.setLisAddress(rs.getString("LIS_ADDRESS"));
				renListingVO.setLisRent(rs.getBigDecimal("LIS_RENT"));
				renListingVO.setLisMngFee(rs.getBigDecimal("LIS_MNG_FEE"));
				renListingVO.setLisPfee(rs.getBigDecimal("LIS_PFEE"));
				renListingVO.setLisSqft(rs.getDouble("LIS_SQFT"));
				renListingVO.setLisFlr(rs.getString("LIS_FLR"));
				renListingVO.setLisRmNo(rs.getInt("LIS_RM_NO"));
				renListingVO.setLisCmnArea(rs.getInt("LIS_CMN_AREA"));
				renListingVO.setLisBrNo(rs.getInt("LIS_BR_NO"));
				renListingVO.setLisEthernet(rs.getInt("LIS_ETHERNET"));
				renListingVO.setLisWifi(rs.getInt("LIS_WIFI"));
				renListingVO.setLisWh(rs.getInt("LIS_WH"));
				renListingVO.setLisShenc(rs.getInt("LIS_SHENC"));
				renListingVO.setLisAc(rs.getInt("LIS_AC"));
				renListingVO.setLisFridge(rs.getInt("LIS_FRIDGE"));
				renListingVO.setLisTv(rs.getInt("LIS_TV"));
				renListingVO.setLisWasher(rs.getInt("LIS_WASHER"));
				renListingVO.setLisDryer(rs.getInt("LIS_DRYER"));
				renListingVO.setLisTc(rs.getInt("LIS_TC"));
				renListingVO.setLisBed(rs.getInt("LIS_BED"));
				renListingVO.setLisCabinet(rs.getInt("LIS_CABINET"));
				renListingVO.setLisSofa(rs.getInt("LIS_SOFA"));
				renListingVO.setLisParking(rs.getInt("LIS_PARKING"));
				renListingVO.setLisCook(rs.getInt("LIS_COOK"));
				renListingVO.setLisPet(rs.getInt("LIS_PET"));
				renListingVO.setLisSmoking(rs.getInt("LIS_SMOKING"));
				renListingVO.setLisMonly(rs.getInt("LIS_MONLY"));
				renListingVO.setLisFonly(rs.getInt("LIS_FONLY"));
				renListingVO.setLisSonly(rs.getInt("LIS_SONLY"));
				renListingVO.setLisStatus(rs.getInt("LIS_STATUS"));
				renListingVO.setLisApproval(rs.getInt("LIS_APPROVAL"));
				list.add(renListingVO); // Store the row in the list
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}//test
		return list;
	}

}
