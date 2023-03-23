package kr.co.ccrent.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.domain.RentVO;
import kr.co.ccrent.dto.PageRequestDTO;

public interface RentMapper {
	String selectTime();
	void insert(RentVO rentVO);
	List<RentVO> selectAll();
	List<RentVO> selectAll(String limit);
	List<RentVO> selectList(PageRequestDTO pageRequestDTO);
	List<RentVO> selectByCarId(HashMap<String, Object> varmap);
	int selectCount(PageRequestDTO pageRequestDTO);
	RentVO selectOne(int rent_id);
	void updateState(RentVO rentVO);
	void delete(int rent_id);
	
	// 오늘의 출고, 반납
	List<RentVO> selectTodayStart(String today);
	List<RentVO> selectTodayEnd(String today);
	
	// 예약 날짜 중복 확인
	RentVO selectDateRedundancy(HashMap<String, Object> varmap);
	
	// 예약 확인
	List<RentVO> selectGuest(RentVO rentVO);
	List<RentVO> selectMember(String car_uid);
	
	// 예약 취소
	void updateCancel(RentVO rentVO);
	
	/* ================================================================================ 통계 */
	
	// 최다 예약 차량 통계
	List<RentVO> selectBestCar();
	
	// 일별 예약 통계
	List<Map<Object, Object>> selectDailyChart();
	
}
