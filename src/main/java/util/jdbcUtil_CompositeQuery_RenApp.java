package util;

import java.util.*;

public class jdbcUtil_CompositeQuery_RenApp {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		if ("apt_id".equals(columnName) || "apt_mem_id".equals(columnName) || "apt_ldd_id".equals(columnName)) 
			aCondition = columnName + "=" + value;
		else if ("aptTimestamp".equals(columnName))                       
			aCondition = columnName + "=" + "'"+ value +"'";                         
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);
//				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("apt_mem_id", new String[] { "2" });
		map.put("apt_ldd_id", new String[] { "3" }); 
		map.put("action", new String[] { "getXXX" });// 注意Map裡面會含有action的key

		String finalSQL = "select * from `CFA104G5`.`REN_APPOINTMENT` "
				          + jdbcUtil_CompositeQuery_RenApp.get_WhereCondition(map)
				          + "order by apt_id desc";
//		System.out.println("●●finalSQL = " + finalSQL);

	}
}