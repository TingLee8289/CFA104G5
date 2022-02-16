package ezs.chat.model;

import java.io.FileInputStream;
import java.io.IOException;
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

public class ChatDAO implements ChatDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`CHAT` (chat_from_mem_id, chat_to_mem_id, chat_content, chat_time, chat_images) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`CHAT` SET chat_from_mem_id = ?, chat_to_mem_id = ?, chat_content = ?, chat_time = ?, chat_images = ? WHERE chat_msg_id = ?";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`CHAT` WHERE chat_msg_id =?";
	private static final String FIND_BY_PK = "SELECT * FROM `CFA104G5`.`CHAT` WHERE chat_msg_id = ?";
	private static final String GET_ALL = "SELECT * FROM `CFA104G5`.`CHAT`";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(ChatVO chatVO) {
		
		try {
		
			con = ds.getConnection();
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
		
			con = ds.getConnection();
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
		
			con = ds.getConnection();
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
		
			con = ds.getConnection();
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
				chat.setChatImages(rs.getBytes("chat_images")); 
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
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				chat = new ChatVO();
				chat.setChatMsgId(rs.getInt("chat_msg_id"));
				chat.setChatFromMemId(rs.getInt("chat_from_mem_id"));
				chat.setChatToMemId(rs.getInt("chat_to_mem_id"));
				chat.setChatContent(rs.getString("chat_content"));
				chat.setChatTime(rs.getTimestamp("chat_time"));
				chat.setChatImages(rs.getBytes("chat_images"));
				
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
		

}
