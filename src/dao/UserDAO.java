package dao;

import java.util.Map;

public interface UserDAO {

	public int insertUser(Map<String,String> user);
	public boolean compareUser(Map<String,String> user);
}
