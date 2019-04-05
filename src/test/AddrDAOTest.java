package test;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import dao.Address1DAO;
import dao.Impl.Address1DAOImpl;
import service.Address1Service;
import service.Impl.Address1ServiceImpl;

public class AddrDAOTest {

	Address1DAO adao = new Address1DAOImpl();
	Address1Service as = new Address1ServiceImpl();
	@Test
	public void test() {
		Map<String,String> addr = new HashMap<>();
		addr.put("sNum","11");
		addr.put("lNum","20");
		List<Map<String,String>> addrList = adao.selectAddrList(addr);
		assertEquals(10, addrList.size());
	}
	
	@Test
	public void addrCountTest() {
//		int totalCnt = adao.selectTotalAddrCount();
//		assertEquals(358425,totalCnt);
	}
		
}