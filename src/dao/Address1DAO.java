package dao;

import java.util.List;
import java.util.Map;

public interface Address1DAO {

	public List<Map<String,String>> selectAddrList(Map<String,String> addr);
	
}
