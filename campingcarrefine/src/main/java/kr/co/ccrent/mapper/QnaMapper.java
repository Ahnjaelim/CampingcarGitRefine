// ★메소드는 pdf보고 작성완료후에 수정★
package kr.co.ccrent.mapper;

import java.util.List;

import kr.co.ccrent.domain.QnaVO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.QnaDTO;

public interface QnaMapper {
	// 작성
	public void create(QnaVO qna);

	// 상세보기
	public QnaVO read(Integer qna_no);

	// 수정
	public int update(QnaVO qna);

	// 삭제
	public int delete(Integer qna_no);

	// 게시판 총 갯수
	public int getTotal();

	// 문의 게시판 페이징처리, 검색
	List<QnaDTO> qna_select(Criteria cri) throws Exception;

	public int qna_select_count(Criteria cri) throws Exception;
	
	

}
