package kr.co.ccrent;

import java.util.List;

import org.junit.jupiter.api.Test;    
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.Criteria;
import kr.co.ccrent.domain.NoticeVO;
import kr.co.ccrent.mapper.NoticeMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeMapperTest {
	
//	@Autowired
//	private NoticeMapper noticeMapper; 
//
//	@Test
//	public void noticeMapperTest() {
//		System.out.println(noticeMapper.selectTime());
//	}
	
	@Autowired
	private NoticeMapper notice;
	
	@Test
	public void NoticeMapperTest() {
		System.out.println(notice);
//	System.out.println(notice);
	
	}	
	//공지사항 등록 테스트
	@Test
	public void testEnroll() {
		
		NoticeVO not = new NoticeVO();
		not.setTitle("mapper test");
		not.setContent("mapper test");
		not.setWriter("mapper test");
		
		notice.enroll(not);
		
		}
	//공지사항 목록 테스트
	@Test
	public void testGetList() {
		List list = notice.getList();
		
		list.forEach(notice ->System.out.println("" + notice));
	}
	//공지사항 조회
	@Test
	public void testGetPage() {
		//실제 존재하는 페이지
		int bno = 8;
		
		System.out.println(""+ notice.getPage(bno));
	}
	//공지사항 수정
	@Test
	public void testModify() {
		
		NoticeVO notice = new NoticeVO();
		notice.setBno(8);
		notice.setTitle("수정 제목");
		notice.setContent("수정 내용");
		
		int result = notice.modify(notice);
		System.out.println("result:" + result);
	}
	
	//공지사항 삭제
	@Test
	public void testDelete() {
		
		int result = notice.delete(21);
		System.out.println("result : " + result);
	}
	//공지사항 목록(페이징 적용)테스트
	@Test
	public void getGetListPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		
		List list = notice.getListPaging(cri);
		
		list.forEach(notice -> System.out.println("" + notice));
	}
	


}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	