package kr.co.ccrent.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.domain.Criteria;
import kr.co.ccrent.domain.NoticeVO;
import kr.co.ccrent.domain.PageMaker;
import kr.co.ccrent.service.NoticeService;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
 
	@Autowired
	private NoticeService nservice;
	
//	//공지사항 목록 페이지 접속
//	@GetMapping("/list")
//	public void noticeListGET(Model model) {
//		
//		System.out.println("공지사항 목록 페이지 진입");
//		
//		model.addAttribute("list", nservice.getList());
//	}
	
	
	//공지사항 목록 페이지 접속(페이징 적용)
	  @GetMapping("/list")
	    public void noticeListGET(Model model, Criteria cri) {
	        
	        System.out.println("noticeListGET");
	        
	        model.addAttribute("list", nservice.getListPaging(cri));
	        
	        int total = nservice.getTotal(cri);
	        
	        PageMaker pageMake = new PageMaker(cri, total);
	        
	        model.addAttribute("pageMaker", pageMake);
	  }
	  
	//공지사항 등록 페이지 접속
		@GetMapping("/enroll")
		public void noticeEnrollGET() {
			
			System.out.println("공지사항 등록 페이지 진입");
			
		
		}
	
	
	
	//공지사항 조회
	@GetMapping("/get")
	public void noticeGetPage(int bno, Model model, Criteria cri) {

		
		model.addAttribute("pageInfo", nservice.getPage(bno));
		
		model.addAttribute("cri", cri);
		
	}
	
	//수정 페이지 이동
	  @GetMapping("/modify")
	    public void noticeModifyGET(int bno, Model model, Criteria cri ) {
	        
	    model.addAttribute("pageInfo", nservice.getPage(bno));
	    
	    model.addAttribute("cri" , cri);
	        
	    }
	//페이지 수정
	  @PostMapping("/modify")
	   public String noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
	        
	        nservice.modify(notice);
	        
	        rttr.addFlashAttribute("result", "modify success");
	        
	        return "redirect:/notice/list";
	        
	    }
	  //페이지 삭제
	  @PostMapping("/delete")
	  public String noticeDeletePOST(int bno, RedirectAttributes rttr) {
		  
		  nservice.delete(bno);
		  
		  rttr.addFlashAttribute("result", "delete success");
		  
		  return "redirect:/notice/list";
	  }
	 
	 
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  

}