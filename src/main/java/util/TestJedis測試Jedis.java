package util;
import redis.clients.jedis.Jedis;

public class TestJedis測試Jedis {

	public static void main(String[] args) {
		Jedis jedis = new Jedis("localhost", 6379);
		System.out.println(jedis.ping());
		jedis.close();
	}
}
