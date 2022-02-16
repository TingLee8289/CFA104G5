package ezs.chat.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class ChatJDBCDAO implements ChatDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`CHAT` (chat_from_mem_id, chat_to_mem_id, chat_content, chat_time, chat_images) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`CHAT` SET chat_from_mem_id = ?, chat_to_mem_id = ?, chat_content = ?, chat_time = ?, chat_images = ? WHERE chat_msg_id = ?";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`CHAT` WHERE chat_msg_id =?";
	private static final String FIND_BY_PK = "SELECT * FROM `CFA104G5`.`CHAT` WHERE chat_msg_id = ?";
	private static final String GET_ALL = "SELECT * FROM `CFA104G5`.`CHAT`";

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
	public void insert(ChatVO chatVO) {
		
		try {
	
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
		
			pstmt.setInt(1, chatVO.getChatFromMemId());
			pstmt.setInt(2, chatVO.getChatToMemId());
			pstmt.setString(3, chatVO.getChatContent());
			pstmt.setTimestamp(4, chatVO.getChatTime());
			pstmt.setBytes(5, chatVO.getChatImages());
			
			pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(ChatVO chatVO) {
	
		try {
		
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, chatVO.getChatFromMemId());
			pstmt.setInt(2, chatVO.getChatToMemId());
			pstmt.setString(3, chatVO.getChatContent());
			pstmt.setTimestamp(4, chatVO.getChatTime());
			pstmt.setBytes(5, chatVO.getChatImages());
			pstmt.setInt(6, chatVO.getChatMsgId());
		
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer chatMsgId) {
		
		try {
		
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setInt(1, chatMsgId);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public ChatVO findByPK(Integer chatMsgId) {
		ChatVO chat = null;
		
		try {
		
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_PK);
			
			pstmt.setInt(1, chatMsgId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				chat = new ChatVO();
				chat.setChatMsgId(rs.getInt("chat_msg_id"));
				chat.setChatFromMemId(rs.getInt("chat_from_mem_id"));
				chat.setChatToMemId(rs.getInt("chat_to_mem_id"));
				chat.setChatContent(rs.getString("chat_content"));
				chat.setChatTime(rs.getTimestamp("chat_time"));
				chat.setChatImages(rs.getBytes("chat_images")); // byte資料

//				chat.setChatImagesOut(rs.getBytes("chat_images")); //byte資料
//				// 測試儲存到專案資料夾		
//				try {
//					byte[] pic = rs.getBytes("chat_images");
//					if(pic != null) {
//						int id = rs.getInt("chat_msg_id");
//						readPicture(pic, id);
//					}		
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return chat;
	}

	@Override
	public List<ChatVO> getAll() {
		List<ChatVO> chatList = new ArrayList<>();
		ChatVO chat = null;

		try {
		
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				chat = new ChatVO();
				chat.setChatMsgId(rs.getInt("chat_msg_id"));
				chat.setChatFromMemId(rs.getInt("chat_from_mem_id"));
				chat.setChatToMemId(rs.getInt("chat_to_mem_id"));
				chat.setChatContent(rs.getString("chat_content"));
				chat.setChatTime(rs.getTimestamp("chat_time"));
				chat.setChatImages(rs.getBytes("chat_images")); // byte資料

//				chat.setChatImagesOut(rs.getBytes("chat_images")); //byte資料			
//				// 測試儲存到專案資料夾		
//				try {
//					byte[] pic = rs.getBytes("chat_images");
//					if(pic != null) {
//						int id = rs.getInt("chat_msg_id");
//						readPicture(pic, id);
//					}		
//				} catch (IOException e) {
//					e.printStackTrace();
//				}

				chatList.add(chat);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return chatList;
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}

//	public static void readPicture(byte[] bytes, int id) throws IOException {
//		FileOutputStream fos = new FileOutputStream("items/REN/test" + id + ".jpg");
//		fos.write(bytes);
//		fos.flush();
//		fos.close();
//	}

}
