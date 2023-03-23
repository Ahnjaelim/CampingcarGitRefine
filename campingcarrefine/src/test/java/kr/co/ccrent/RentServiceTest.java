package kr.co.ccrent;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.service.RentService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RentServiceTest {

	@Autowired
	private RentService rentService;
	
	// @Test
	public void getDateRedundancyTest() {
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", 1);
		varmap.put("rent_startdate", "2023-02-01");
		varmap.put("rent_enddate", "2023-02-10");
		RentDTO rentDTO = rentService.getDateRedundancy(varmap);
		System.out.println(rentDTO);
	}

	// @Test
	public void getGuestTest() {
		RentDTO rentDTO = RentDTO.builder()
				.rent_name("아무개")
				.rent_password("0000")
				.rent_phone1("010-1111-2222")
				.build();
		List<RentDTO> dtolist = rentService.getGuest(rentDTO);
		dtolist.forEach(dto -> System.out.println(dto));
		
	}
	//@Test
	public void getMemberTest() {
		List<RentDTO> dtolist = rentService.getMember("user00");
		dtolist.forEach(dto -> System.out.println(dto));		
	}
	
	//@Test
	public void updateCancelTest() {
		RentDTO rentDTO = RentDTO.builder()
				.rent_id(3)
				.rent_state(2)
				.build();
		rentService.modifyCancel(rentDTO);
	}
	
	// @Test
	public void getBestCarTest() {
		List<RentDTO> dtolist = rentService.getBestCar();
		dtolist.forEach(dto -> System.out.println(dto));		
	}	
	
	@Test
	public void getAllTest() {
		List<RentDTO> dtolist = rentService.getAll("5");
		dtolist.forEach(dto -> System.out.println(dto));		
	}
}
