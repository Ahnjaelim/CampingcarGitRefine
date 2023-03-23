package kr.co.ccrent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.mapper.RentMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RentMapperTest {
	
	@Autowired
	private RentMapper rentMapper;
	
	// @Test
	public void selectDateRedundancyTest() {
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", 1);
		varmap.put("rent_startdate", "2023-02-01");
		varmap.put("rent_enddate", "2023-02-10");
		RentVO rentVO = rentMapper.selectDateRedundancy(varmap);
		System.out.println(rentVO);
	}
	
	// @Test
	public void selectGuestTest() {
		RentVO rentVO = RentVO.builder()
				.rent_name("아무개")
				.rent_password("0000")
				.rent_phone1("010-1111-2222")
				.build();
		List<RentVO> volist = rentMapper.selectGuest(rentVO);
		volist.forEach(vo -> System.out.println(vo));
	}
	// @Test
	public void selectMemberTest() {
		List<RentVO> volist = rentMapper.selectMember("user00");
		volist.forEach(vo -> System.out.println(vo));		
	}
	
	// @Test
	public void updateCancelTest() {
		RentVO rentVO = RentVO.builder()
				.rent_id(3)
				.rent_state(1)
				.build();
		rentMapper.updateCancel(rentVO);
	}
	
	// @Test
	public void selectBestCarTest() {
		List<RentVO> volist = rentMapper.selectBestCar();
		volist.forEach(vo -> System.out.println(vo));
	}
	
	//@Test
	public void selectDailyChart() {
		List<Map<Object, Object>> volist = rentMapper.selectDailyChart();
		volist.forEach(vo -> System.out.println(vo));
	}
	
	@Test
	public void selectAllTest() {
		List<RentVO> volist = rentMapper.selectAll("5");
		volist.forEach(vo -> System.out.println(vo));
		
	}
}
