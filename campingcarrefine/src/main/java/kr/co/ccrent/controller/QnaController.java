package kr.co.ccrent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.domain.QnaVO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.service.QnaService;


@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService service;

	// 문의글 작성페이지
	@RequestMapping(value = "/qna/register", method = RequestMethod.GET)
	public void qna_registerGET() throws Exception {
		logger.info("register get..........");
	}

	@RequestMapping(value = "/qna/register", method = RequestMethod.POST)
	public String qna_registPOST(QnaVO qna, RedirectAttributes rttr) throws Exception {

		logger.info("regist post..........");
		logger.info(qna.toString());

		service.regist(qna);

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/qna/qnalist?keyword=";
	}

//  페이징 처리 전 listAll
//	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
//	public void listAll(Model model) throws Exception {
//		
//		logger.info("show all list..........");
//		
//		model.addAttribute("list", service.listAll());
//	} 

//  문의 게시판 listAll 페이징처리
	@GetMapping(value = "/qna/qnalist")
	public void qna_list(Criteria cri, Model model) throws Exception {
		System.out.println(cri.toString());
		model.addAttribute("list", service.qna_get(cri));

		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.qna_get_Count(cri));

		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
	}

	// 문의글 상세페이지
	@RequestMapping(value = "/qna/read", method = RequestMethod.GET)
	public void qna_read(@RequestParam("qna_no") int qna_no, Model model) throws Exception {

		model.addAttribute(service.read(qna_no));
	}

	@RequestMapping(value = "/qna/remove", method = RequestMethod.GET)
	public String qna_remove(int qna_no) throws Exception {

		service.remove(qna_no);
		return "redirect:/qna/qnalist?keyword=";
	}

	// 문의글 수정페이지
	@RequestMapping(value = "/qna/modifyForm", method = RequestMethod.GET)
	public void qna_modifyGET(@RequestParam("qna_no") int qna_no, @ModelAttribute("cri") 
	Criteria cri, Model model) throws Exception {

		model.addAttribute(service.read(qna_no));
	}

	@RequestMapping(value = "/qna/modify", method = RequestMethod.POST)
	public String qna_modifyPOST(QnaVO qna, Criteria cri, 
			RedirectAttributes rttr, Model model) throws Exception {
		
		service.modify(qna);
		System.out.println(cri.toString());
		model.addAttribute("list", service.qna_get(cri));
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.qna_get_Count(cri));

		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);

		return "redirect:/qna/qnalist?keyword=";
	}

}
