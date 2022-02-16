package ezs.chat.model;

import java.util.List;

public class ChatTest {

	public static void main(String[] args) {

		ChatJDBCDAO dao = new ChatJDBCDAO();

		// Insert plain text only
//		ChatVO chat1 = new ChatVO();
//		chat1.setChatFromMemId(4);
//		chat1.setChatToMemId(9);
//		chat1.setChatContent("您一萬塊尾款還沒付喔!");
//		chat1.setChatTime(java.sql.Timestamp.valueOf("2022-01-18 09:11:12"));
//		chat1.setChatImages(null);
//		dao.insert(chat1);

		// Insert image only
//		ChatVO chat2 = new ChatVO();
//		chat2.setChatFromMemId(2);
//		chat2.setChatToMemId(1);
//		chat2.setChatContent(null);
//		chat2.setChatTime(java.sql.Timestamp.valueOf("2022-01-22 09:11:12"));
//		chat2.setChatImages("items/logo.JPG");
//		dao.insert(chat2);

		// Insert text and image 
//		ChatVO chat5 = new ChatVO();
//		chat5.setChatFromMemId(4);
//		chat5.setChatToMemId(1);
//		chat5.setChatContent("hiiii");
//		chat5.setChatTime(java.sql.Timestamp.valueOf("2022-01-31 12:22:12"));
//		chat5.setChatImages("items/roompic.jpg");
//		dao.insert(chat5);

		// Update
//		ChatVO chat4 = new ChatVO();		
//		chat4.setChatMsgId(10);
//		chat4.setChatFromMemId(4);
//		chat4.setChatToMemId(12);
//		chat4.setChatContent("hello");
//		chat4.setChatTime(java.sql.Timestamp.valueOf("2022-01-18 19:22:33"));
//		chat4.setChatImages(null);		
//		dao.update(chat4);

		// Delete
//		dao.delete(10);

		// Find by PK
//		System.out.println("--PK查詢-------------------");
//		ChatVO chat3 = dao.findByPK(5);
//		System.out.print(chat3.getChatMsgId() + ",");
//		System.out.print(chat3.getChatFromMemId() + ",");
//		System.out.print(chat3.getChatToMemId() + ",");
//		System.out.print(chat3.getChatContent() + ",");
//		System.out.print(chat3.getChatTime() + ",");
//		System.out.print(chat3.getChatImages());
//		System.out.println();

		// Find All
		System.out.println("--全部查詢-------------------");
		List<ChatVO> chatList = dao.getAll();
		for (ChatVO cList : chatList) {
			System.out.print(cList.getChatMsgId() + ",");
			System.out.print(cList.getChatFromMemId() + ",");
			System.out.print(cList.getChatToMemId() + ",");
			System.out.print(cList.getChatContent() + ",");
			System.out.print(cList.getChatTime() + ",");
			System.out.print(cList.getChatImages());
			System.out.println();
		}
	}

}
