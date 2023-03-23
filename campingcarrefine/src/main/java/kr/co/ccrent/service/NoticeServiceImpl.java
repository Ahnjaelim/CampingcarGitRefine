package kr.co.ccrent.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.domain.Criteria;
import kr.co.ccrent.domain.NoticeVO;
import kr.co.ccrent.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper not;
	
	//공지사항 등록
	@Override
	public void enroll(NoticeVO notice) {
		
		not.enroll(notice);
	}
	//공지사항 목록
	@Override
	public List<NoticeVO> getList() {
		
		return not.getList();
	}
	//공지사항 목록(페이지 적용)
	@Override
	public List<NoticeVO> getListPaging(Criteria cri) {
			
		return not.getListPaging(cri);
	//공지사항 조회
	}
	@Override
	public NoticeVO getPage(int bno) {
		
		return not.getPage(bno);
	}
	//공지사항 수정
	@Override
	public int modify(NoticeVO notice) {
		
		return not.modify(notice);
	}
	//공지사항 삭제
	@Override
	public int delete(int bno) {
		
		return not.delete(bno);
	}
	//공지사항 총 개수
	@Override
	public int getTotal(Criteria cri) {
		
		return not.getTotal(cri);
	}
	

	}
	




		


	













