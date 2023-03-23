package kr.co.ccrent.service;

import java.util.List; 

import kr.co.ccrent.domain.Criteria;
import kr.co.ccrent.domain.NoticeVO;

public interface NoticeService {
	
	//공지사항 등록
	public void enroll(NoticeVO notice);
	
	//공지사항 목록
	public List<NoticeVO> getList();
	
	//공지사항 목록(페이징 적용)
	public List<NoticeVO> getListPaging(Criteria cri);
	
	//공지사항 조회
	public NoticeVO getPage(int bno);
	
	//공지사항 수정
	public int modify(NoticeVO notice);
	
	//공지사항 삭제
	public int delete(int bno);
	
	//공지사항 총 개수
	public int getTotal(Criteria cri);
	
	
	
	}
