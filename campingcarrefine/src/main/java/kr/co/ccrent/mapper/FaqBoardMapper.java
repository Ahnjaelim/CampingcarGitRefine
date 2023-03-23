package kr.co.ccrent.mapper;

import java.util.List;


import kr.co.ccrent.dto.FaqBoardDTO;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.Criteria;


public interface FaqBoardMapper {
	
	//public List<FaqBoardDTO> getAll();
	
	public List<FaqBoardDTO> listCriteria(Criteria cri) throws Exception;
	
	public int getAll_Count(Criteria cri) throws Exception;
			
	public void create(FaqBoardDTO boardDTO);
	
//	public void createSelectKey (BoardDTO boardDTO);
	
	public FaqBoardDTO read(int bno);
	
	public int update(FaqBoardDTO boardDTO);
	
	public int delete(int bno);
	
	public List<FaqBoardDTO> faq_select(Criteria cri)throws Exception;
	public int faq_select_count(Criteria cri)throws Exception;


	
	

}
