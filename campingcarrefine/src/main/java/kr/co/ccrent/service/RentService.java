package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.dto.RentDTO;

public interface RentService {
	String getTime();
	void register(RentDTO rentDTO);
	List<RentDTO> getAll();
	List<RentDTO> getAll(String limit);
	PageResponseDTO<RentDTO> getList(PageRequestDTO pageRequestDTO);
	HashMap<String, RentDTO> getByCarId(HashMap<String,Object> varmap);
	RentDTO getOne(int rent_id);
	void modifyState(RentDTO rentDTO);
	void remove(int rent_id);
	
	// 오늘의 출고, 반납
	List<RentDTO> getTodayStart(String today);
	List<RentDTO> getTodayEnd(String today);
	
	// 예약 날짜 중복 체크
	RentDTO getDateRedundancy(HashMap<String,Object> varmap);
	
	// 예약 확인
	List<RentDTO> getGuest(RentDTO rentDTO);
	List<RentDTO> getMember(String car_uid);
	
	// 예약 취소
	void modifyCancel(RentDTO rentDTO);
	
	/* ================================================================================ 통계 */
	
	List<RentDTO> getBestCar();
	
	List<Map<Object, Object>> getDailyChart();
	
}
