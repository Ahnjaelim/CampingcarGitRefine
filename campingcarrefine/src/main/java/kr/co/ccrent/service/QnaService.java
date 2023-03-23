// ★메소드는 pdf보고 작성완료후에 수정★
package kr.co.ccrent.service;

import java.util.List;

import kr.co.ccrent.domain.QnaVO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.QnaDTO;

public interface QnaService {
	// 문의글 작성
	public void regist(QnaVO qna) throws Exception;
	// 문의글 상세 페이지
	public QnaVO read(Integer qna_no) throws Exception;
	// 문의글 수정
	public int modify(QnaVO qna) throws Exception;
	// 문의글 삭제
	public int remove(Integer qna_no) throws Exception;
	// 문의글 총 갯수
	public int getTotal();
	// 문의 게시판 전체 조회 및 페이징 처리, 검색기능
	public List<QnaDTO> qna_get(Criteria cri) throws Exception;

	public int qna_get_Count(Criteria cri) throws Exception;
	
	

}
