package util;

import java.util.*;

public class jdbcUtil_CompositeQuery_RenFav {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;

		if ("fav_lis_id".equals(columnName) || "fav_mem_id".equals(columnName)) 
			aCondition = columnName + "=" + value;
		
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

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("fav_lis_id", new String[] { "1" });
		map.put("fav_mem_id", new String[] { "2" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from `CFA104G5`.`REN_FAVORITES` "
				          + jdbcUtil_CompositeQuery_RenFav.get_WhereCondition(map)
				          + "order by fav_add_time";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
