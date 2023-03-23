package kr.co.ccrent.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.ccrent.dto.FaqBoardDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.mapper.FaqBoardMapper;
import lombok.AllArgsConstructor;



@Service
@AllArgsConstructor
public class FaqBoardServiceImpl implements FaqBoardService {
	
	private FaqBoardMapper boardMapper;
	
	@Override
	public void register(FaqBoardDTO boardDTO) {
		
		boardMapper.create(boardDTO);
	}

	@Override
	public FaqBoardDTO read(int bno) {
		
		return boardMapper.read(bno);
	}

	@Override
	public void modify(FaqBoardDTO boardDTO) {		
		boardMapper.update(boardDTO);	
		
		
	}

	@Override
	public int remove(int bno) {
		
		return boardMapper.delete(bno);
		
	}


//	@Override
//	public List<FaqBoardDTO> getList() {
//		
//		log.info("getList.........");
//		
//			log.info("getAll..........");
//			
//		return boardMapper.getAll();
//	}

	@Override
	public List<FaqBoardDTO> getAll(Criteria cri) throws Exception {
		
		return boardMapper.listCriteria(cri);
	}

	@Override
	public int getAll_Count(Criteria cri) throws Exception {
		
		return boardMapper.getAll_Count(cri);
	}

	@Override
	public List<FaqBoardDTO> faq_get(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.faq_select(cri);
	}

	@Override
	public int faq_get_count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.faq_select_count(cri);
	}

	
	
	

}
