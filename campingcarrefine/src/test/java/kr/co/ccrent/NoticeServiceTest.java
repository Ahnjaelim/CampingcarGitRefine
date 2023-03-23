package kr.co.ccrent;

import java.util.List; 

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.Criteria;
import kr.co.ccrent.domain.NoticeVO;
import kr.co.ccrent.service.NoticeService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTest {
	
	@Autowired
	private NoticeService service;
	
	//공지사항 등록
	@Test
	public void testEnroll() {
	NoticeVO not = new NoticeVO();
	
	not.setTitle("service test");
	not.setContent("service test");
	not.setWriter("service test");
	
	service.enroll(not);
	
	}
	//공지사항 목록 테스트
	@Test
	public void testGetList() {
		
		service.getList().forEach(notice -> System.out.println("" + notice));
	}
	//공지사항 조회
	@Test
	public void testGETPage() {
		
		int bno = 8;
		
		System.out.println("" + service.getPage(bno));
	}
	//공지사항 수정
	@Test
	public void testModify() {
		
		NoticeVO not = new NoticeVO();
		not.setBno(8);
		not.setTitle("수정 제목");
		not.setContent("수정 내용");
		
		int result = service.modify(not);
		System.out.println("result : " + result);
	}
	//공지사항 삭제
	@Test
	public void testDelete() {
		
		int result = service.delete(28);
		System.out.println("result:" +result);
	}
	//공지사항 조회(페이징 적용)
	@Test
	public void testGetListPaging() {
		
		Criteria cri = new Criteria();
		
		List list = service.getListPaging(cri);
		
		list.forEach(notice -> System.out.println(""+notice));
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	

