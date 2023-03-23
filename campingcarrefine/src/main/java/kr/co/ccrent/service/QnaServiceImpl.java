package kr.co.ccrent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.domain.QnaVO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.QnaDTO;
//import kr.co.ccrent.dto.SearchCriteria;
import kr.co.ccrent.mapper.QnaMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	// 문의글 작성
	@Override
	public void regist(QnaVO qna) throws Exception {

		log.info("register.........." + qna);

		mapper.create(qna);
	}

	// 문의글 상세페이지
	@Override
	public QnaVO read(Integer qna_no) throws Exception {

		log.info("read.........." + qna_no);

		return mapper.read(qna_no);
	}

	// 문의글 수정
	@Override
	public int modify(QnaVO qna) throws Exception {

		log.info("modify.........." + qna);

		return mapper.update(qna);
	}

	// 문의글 삭제
	@Override
	public int remove(Integer qna_no) throws Exception {

		log.info("remove.........." + qna_no);

		return mapper.delete(qna_no);
	}

	// 문의글 총 갯수
	@Override
	public int getTotal() {

		return mapper.getTotal();
	}

	// 문의글 페이징 처리, 검색기능
	@Override
	public List<QnaDTO> qna_get(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.qna_select(cri);
	}

	@Override
	public int qna_get_Count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.qna_select_count(cri);
	}



}
