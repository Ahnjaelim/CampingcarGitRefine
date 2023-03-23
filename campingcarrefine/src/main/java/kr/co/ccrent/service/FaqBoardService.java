package kr.co.ccrent.service;

import java.util.List;

import kr.co.ccrent.dto.FaqBoardDTO;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.Criteria;


public interface FaqBoardService {

	public void register(FaqBoardDTO boardDTO);
	
	public FaqBoardDTO read(int bno);
	
	public void modify(FaqBoardDTO boardDTO);
	
	public int remove(int bno);
	
	//public List<FaqBoardDTO> getList();
	
	public List<FaqBoardDTO> getAll(Criteria cri) throws Exception;
	  
	public int getAll_Count(Criteria cri) throws Exception;
	
	public List<FaqBoardDTO> faq_get(Criteria cri)throws Exception;
	public int faq_get_count(Criteria cri)throws Exception;
	
}
