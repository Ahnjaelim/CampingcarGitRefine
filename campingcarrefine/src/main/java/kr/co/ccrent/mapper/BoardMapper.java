package kr.co.ccrent.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.ccrent.domain.BoardConfigVO;
import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.dto.PageRequestDTO;

public interface BoardMapper {
	int selectTableCheck(String bo_table);						// 테이블 확인
	BoardConfigVO selectBoardConfig(String bo_table);			// 테이블 설정 불러오기
	void insert(BoardVO boardVO);
	List<BoardVO> selectAll(String bo_table);
	List<BoardVO> selectList(PageRequestDTO pageRequestDTO);
	int selectCount(PageRequestDTO pageRequestDTO);
	int selectMaxId(String bo_table);
	BoardVO selectOne(HashMap<String, Object> varmap);
}
