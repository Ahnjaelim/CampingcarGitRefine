package kr.co.ccrent.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.config.DateProcess;
import kr.co.ccrent.domain.NoticeVO;
import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.FaqBoardDTO;
import kr.co.ccrent.dto.GarageDTO;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.dto.RepairDTO;
import kr.co.ccrent.service.BoardFileService;
import kr.co.ccrent.service.CarService;
import kr.co.ccrent.service.CompanyService;
import kr.co.ccrent.service.FaqBoardService;
import kr.co.ccrent.service.GarageService;
import kr.co.ccrent.service.NoticeService;
import kr.co.ccrent.service.RentService;
import kr.co.ccrent.service.RepairService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final CarService carService;
	private final RentService rentService;
	private final BoardFileService boardFileService;
	private final DateProcess dateProcess;
	private final RepairService repairService;
	private final GarageService garageService;
	private final CompanyService companyService;
	private final FaqBoardService faqBoardService;
	private final NoticeService nservice;

	@GetMapping(value = { "/", "" })
	public String indexGET(Model model) {
		System.out.println("<Admin Controller> index GET");
		model.addAttribute("bestcarlist", rentService.getBestCar());
		model.addAttribute("dailychart", rentService.getDailyChart());
		model.addAttribute("latestrentlist", rentService.getAll("5"));
		return "/admin/index";
	}

	@GetMapping("/car/register")
	public void registerGET(Model model, String car_regid) {
		// 정비회사 리스트 전부 가져오기
		List<CompanyDTO> list3 = companyService.getAll3();
		model.addAttribute("list", list3);
		if (car_regid != null) {
			System.out.println("<Controller> modify GET ==============================");
			model.addAttribute("dto", carService.getOne(Integer.parseInt(car_regid)));
			HashMap<String, Object> fieldmap = new HashMap<>();
			fieldmap.put("bo_table", "car");
			fieldmap.put("wr_id", car_regid);
			model.addAttribute("filelist", boardFileService.getFileList(fieldmap));
		} else {
			System.out.println("<Controller> register GET ==============================");
		}
	}

	@PostMapping("/car/register")
	public String registerPOST(CarDTO carDTO, @RequestParam("file") MultipartFile[] file,
			RedirectAttributes redirectAttributes, HttpServletRequest request, int comp_id, Model model) {
		System.out.println("<Admin Controller> register POST");
		System.out.println(carDTO);
		// carService.register(carDTO, file, request, request.getParameter("order"));
		carService.register(carDTO, request);
		return "redirect:/admin/car/list";
	}

	@PostMapping("/car/modify")
	public String modifyPOST(CarDTO carDTO, HttpServletRequest request) {
		System.out.println("<Controller> modify POST ==============================");
		System.out.println(carDTO);
		carService.modify(carDTO, request);
		return "redirect:/admin/car/list";
	}

	@GetMapping("/car/list")
	public void carListGET(Model model, PageRequestDTO pageRequestDTO) {
		System.out.println("<Admin Controller> car list GET");
		System.out.println(pageRequestDTO);
		// model.addAttribute("dtolist", carService.getAll());
		model.addAttribute("responseDTO", carService.getList(pageRequestDTO));

		List<CompanyDTO> companylist = companyService.getAll3();
		HashMap<Integer, Object> companymap = new HashMap<>();
		for(int i=0; i<companylist.size(); i++) {
			companymap.put(companylist.get(i).getComp_id(), companylist.get(i));
		}

		model.addAttribute("companymap", companymap);		

		model.addAttribute("companymap", companymap);
		System.out.println(companymap);
	}

	@GetMapping("/car/read")
	public void carReadGET(Model model, int car_regid, int comp_id) {
		System.out.println("<Controller> read GET ==============================");
		model.addAttribute("dto", carService.getOne(car_regid));
		HashMap<String, Object> fieldmap = new HashMap<>();
		fieldmap.put("bo_table", "car");
		fieldmap.put("wr_id", car_regid);
		model.addAttribute("filelist", boardFileService.getFileList(fieldmap));
		// repair접근(등록/조회/수정가능하게 DTO접근)
		// 정비내역 확인하기
		System.out.println("==<admin Controller> repairData = read");
		RepairDTO dto = repairService.repair_getOne(car_regid);
		model.addAttribute("repair", dto);

		// 정비회사id 가져오기
		CompanyDTO companyDTO = companyService.get(comp_id);
		model.addAttribute("companyDTO", companyDTO);


	}

	// 정비내역 등록 form
	@PostMapping(value = "/car/repair/register")
	public String repair_register(Model model, RepairDTO dto, HttpServletRequest req, int car_regid, int comp_id)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("==<admin Controller> repairData = register");
		repairService.repair_register(dto);
		// 정비회사id 가져오기
		CompanyDTO companyDTO = companyService.get(comp_id);
		model.addAttribute("companyDTO", companyDTO);

		return "redirect:/admin/car/read?car_regid=" + car_regid + "&comp_id=" + comp_id;
	}

	// 정비소 정보수정 실행
	@PostMapping(value = "/car/read")
	public String repair_update(RepairDTO dto, int car_regid, int comp_id) throws Exception {

		repairService.repair_modify(dto);
		System.out.println("==<admin Controller> repairData = update");

		return "redirect:/admin/car/read?car_regid=" + car_regid + "&comp_id=" + comp_id;
	}

	// 캠핑카 정비내역 삭제
	@GetMapping(value = "/car/repair/remove")
	public String repair_remove(Model model, int car_regid, int comp_id) {
		repairService.repair_remove(car_regid);

		// 정비회사id 가져오기
		CompanyDTO companyDTO = companyService.get(comp_id);
		model.addAttribute("companyDTO", companyDTO);

		System.out.println("==<admin Controller> repairData = remove");

		return "redirect:/admin/car/read?car_regid=" + car_regid + "&comp_id=" + comp_id;
	}

	@PostMapping("/car/remove")
	public String removePOST(int car_regid) {
		System.out.println("<Controller> remove POST ==============================");
		carService.remove(car_regid);
		return "redirect:/admin/car/list";
	}

	/* ============================================================================= 예약 관리 */ 

	@GetMapping("/rent/today")
	public void rentTodayGET(Model model) {
		System.out.println("<Admin Controller> rent today GET");
		model.addAttribute("startlist", rentService.getTodayStart(dateProcess.today()));
		model.addAttribute("endlist", rentService.getTodayEnd(dateProcess.today()));
	}

	@GetMapping("/rent/calendar")
	public void rentCalendarGET(Model model, String curYear, String curMon) {
		System.out.println("<Admin Controller> rent list GET");
		model.addAttribute("carlist", carService.getAll());
		HashMap<String, Object> datemap = dateProcess.dateCalculate(curYear, curMon, 0);
		HashMap<Integer, Object> maplist = new HashMap<>();
		HashMap<String, Object> varmap = new HashMap<>();
		List<CarDTO> carlist = carService.getAll();
		System.out.println(datemap.get("firstday"));
		System.out.println(datemap.get("lastday"));
		for (int i = 0; i < carlist.size(); i++) {
			varmap.clear();
			varmap.put("car_regid", carlist.get(i).getCar_regid());
			varmap.put("firstday", datemap.get("firstday"));
			varmap.put("lastday", datemap.get("lastday"));
			varmap.put("dummy", "1");
			maplist.put(carlist.get(i).getCar_regid(), rentService.getByCarId(varmap));
		}
		model.addAttribute("maplist", maplist);
	}

	@GetMapping("/rent/list")
	public void rentListGET(Model model, PageRequestDTO pageRequestDTO) {
		System.out.println("<Admin Controller> list GET");
		System.out.println(pageRequestDTO);
		model.addAttribute("responseDTO", rentService.getList(pageRequestDTO));
	}

	@GetMapping("/rent/read")
	public void rentReadGET(Model model, int rent_id) {
		model.addAttribute("dto", rentService.getOne(rent_id));
	}

	@PostMapping("/rent/read")
	public String rentReadPost(RentDTO rentDTO, String listtype) {
		System.out.println("<Admin Controller> rent read POST");
		System.out.println(rentDTO);
		rentService.modifyState(rentDTO);
		return "redirect:/admin/rent/read?rent_id=" + rentDTO.getRent_id() + "&listtype=" + listtype;
	}

	@PostMapping("/rent/remove")
	public String rentRemovePOST(String listtype, int rent_id) {
		System.out.println("<Admin Controller> rent remove POST");
		rentService.remove(rent_id);
		return "redirect:/admin/rent/" + listtype;
	}

	@GetMapping("/rent/register")
	public void rentRegisterGET(Model model, int car_regid) {
		System.out.println("<Admin Controller> rent register GET");
		System.out.println("car_regid : " + car_regid);
		model.addAttribute("carlist", carService.getAll());
		model.addAttribute("car", carService.getOne(car_regid));
		HashMap<String, Object> datemap = dateProcess.dateCalculate(null, null, 1);
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", car_regid);
		varmap.put("firstday", datemap.get("firstday"));
		varmap.put("lastday", datemap.get("lastday"));
		varmap.put("dummy", "1");
		HashMap<String, RentDTO> map = rentService.getByCarId(varmap);
		model.addAttribute("rentlist", map);
	}

	@PostMapping("/rent/register")
	public String rentRegisterPOST(RentDTO rentDTO) {
		rentService.register(rentDTO);
		return "redirect:/admin/rent/calendar";
	}
	
	@PostMapping("/rent/cancel")
	public String rentCancelPOST(RentDTO rentDTO, String listtype) {
		System.out.println("<Admin Controller> rent cancel POST");
		System.out.println(rentDTO);
		rentService.modifyCancel(rentDTO);
		return "redirect:/admin/rent/read?rent_id=" + rentDTO.getRent_id() + "&listtype=" + listtype;
	}

	// =======================================garage / 정비소

//	정비소 등록 신청 리스트 전체목록 
	@GetMapping(value = "/garage/register")
	public ModelAndView garage_reglistAll(Criteria cri, Model model) throws Exception {

		System.out.println("==<admin Controller> garage = registerlist");
		ModelAndView mav = new ModelAndView();

		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(garageService.garage_get_regcount(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		// 기능 수행
		List<GarageDTO> list = garageService.garage_get_reg(cri);
		mav.addObject("garage_reglist", list);
		mav.setViewName("admin/garage/register");

		return mav;
	}

	// 등록신청승인 (no갖고와서 insert하기)
	@GetMapping(value = "garage/insert")
	public String garage_register(Model model, HttpServletRequest req, int garage_no) throws Exception {

		GarageDTO dto = garageService.garage_modify_get(garage_no); // garage_no 갖고오기
		garageService.garage_register_admin(dto);

		System.out.println("==<admin Controller> garage = register success");

		return "redirect:/admin/garage/register";
	}

	// 정비소검색
	@GetMapping(value = "garage/list")
	public void garage_updatelist(Criteria cri, Model model) throws Exception {
		System.out.println("==<admin Controller> garage = list");
		model.addAttribute("list", garageService.garage_get(cri));

		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(garageService.garage_get_count(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);

	}

	// 정비소 정보수정 이동
	@GetMapping(value = "/garage/update")
	public String garage_updatepage(int garage_no, Model model) throws Exception {
		System.out.println("==<admin Controller> garage = update");

		GarageDTO dto = garageService.garage_modify_get(garage_no); // 수정할 garage_no 갖고오기

		model.addAttribute("dto", dto);

		return "/admin/garage/update";
	}

	// 정비소 정보수정 입력폼
	@PostMapping(value = "/garage/update")
	public String garage_update(GarageDTO dto, int garage_no) throws Exception {

		garageService.garage_modify(dto);
		System.out.println("==<admin Controller> garage = update success");

		return "redirect:/admin/garage/list?keyword=";

	}

	// 정비소 등록신청탭 등록거부(삭제)
	@GetMapping(value = "/garage/delete")
	public String garage_remove(int garage_no) {

		garageService.garage_remove(garage_no);
		System.out.println("==<admin Controller> garage = registerRemove");

		return "redirect:/admin/garage/register";
	}

	// 정비소 수정 (정비소 삭제)
	@GetMapping(value = "/garage/update_delete")
	public String garage_update_remove(int garage_no) {

		garageService.garage_remove(garage_no);
		System.out.println("==<admin Controller> garage = registerRemove");

		return "redirect:/admin/garage/list?keyword=";
	}
	
	
	//===========================faq admin controller
	@RequestMapping(value = "/faqboard/registerForm", method = RequestMethod.GET)
	public void registerGET(FaqBoardDTO boardDTO, Model model) throws Exception {
		System.out.println("==<admin Controller> faq_register = registerGet");
		
	}
	
	//faq게시글 작성
	@RequestMapping(value = "/faqboard/register", method = RequestMethod.POST)
	public String registerPOST (FaqBoardDTO boardDTO,RedirectAttributes rttr) throws Exception {
		System.out.println("==<admin Controller> faq_register = registerpost");
		
		faqBoardService.register(boardDTO);
		return "redirect:listAll?keyword=";
	}
	
	//faq게시글 상세보기<
	@RequestMapping(value = "/faqboard/read", method = RequestMethod.GET)
	public ModelAndView read(@RequestParam("bno")int bno) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("faq글번호 : "+ bno);
		FaqBoardDTO boardDTO = faqBoardService.read(bno);
		mav.setViewName("/admin/faqboard/read"); //뷰의 이름
		mav.addObject("board", boardDTO); //뷰로 보낼 데이터 값 ( 변수명 , 변수에넣을 데이터 값)
		System.out.println("==<admin Controller> faq_read = read");
		return mav;
	}

		
		
		


	   
	//faq게시글 수정폼 이동
	@RequestMapping(value = "/faqboard/modifyForm", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception {
		
		FaqBoardDTO boardDTO = faqBoardService.read(bno);
		model.addAttribute("board", boardDTO);
		
	}
		
	//faq게시글 수정 메소드
	@RequestMapping(value = "/faqboard/modify", method = RequestMethod.POST)
	public String modifyPOST(FaqBoardDTO boardDTO, RedirectAttributes rttr) throws Exception {
		
		faqBoardService.modify(boardDTO);
		System.out.println("==<admin Controller> faq_modify = success");
		
		return "redirect:/admin/faqboard/listAll?keyword=";	
	}
		
	//faq 게시글 삭제
	@RequestMapping(value ="/faqboard/remove", method = RequestMethod.GET)
	public String remove(int bno ,RedirectAttributes rttr) throws Exception {
		
		faqBoardService.remove(bno);

		System.out.println("==<admin Controller> faq_remove = success");
		return "redirect:/admin/faqboard/listAll?keyword=";
	}
		
	//faq게시글 전부불러오기
	@GetMapping(value="/faqboard/listAll")
	public void faqlist_admin(Criteria cri, Model model) throws Exception{
	   System.out.println(cri.toString());
	   model.addAttribute("list", faqBoardService.faq_get(cri));
	   
	   //페이징처리
	   PageMaker pageMaker = new PageMaker();
	   
	   pageMaker.setCri(cri);
	   pageMaker.setTotalCount(faqBoardService.faq_get_count(cri));
	   
	   model.addAttribute("cri",cri);
	   model.addAttribute("pageMaker",pageMaker);
	}
	
	//==================================notice
	
			//공지사항 목록 페이지 접속(페이징 적용)
			@GetMapping("/notice/list")
			public void admin_noticeListGET(Model model, kr.co.ccrent.domain.Criteria cri) {
	        
				System.out.println("noticeListGET");
				model.addAttribute("list", nservice.getListPaging(cri));
				int total = nservice.getTotal(cri);
				kr.co.ccrent.domain.PageMaker pageMake = new kr.co.ccrent.domain.PageMaker(cri, total);
				model.addAttribute("pageMaker", pageMake);
			}
	  
	  		//공지사항 등록 페이지 접속
			@GetMapping("/notice/enroll")
			public void admin_noticeEnrollGET() {
				
				System.out.println("공지사항 등록 페이지 진입");
			}
			
			//공지사항 등록
			@PostMapping("/notice/enroll")
			public String admin_noticeEnrollPOST(NoticeVO not, RedirectAttributes rttr) {
				
				System.out.println("NoticeVO : " + not);
				
				nservice.enroll(not);
				System.out.println("NoticeVO : " + not);
				
				rttr.addFlashAttribute("result", "enroll success");
				return "redirect:/admin/notice/list";
			}
			
			
			//공지사항 조회
			@GetMapping("/notice/get")
			public void admin_noticeGetPage(int bno, Model model, kr.co.ccrent.domain.Criteria cri) {

				model.addAttribute("pageInfo", nservice.getPage(bno));
				model.addAttribute("cri", cri);
				
			}
			
			//수정 페이지 이동
			@GetMapping("/notice/modify")
			public void admin_noticeModifyGET(int bno, Model model, kr.co.ccrent.domain.Criteria cri ) {
			        
			    model.addAttribute("pageInfo", nservice.getPage(bno));
			    
			    model.addAttribute("cri" , cri);
			        
			    }
			  
			//페이지 수정
			  @PostMapping("/notice/modify")
			   public String admin_noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
			        
			        nservice.modify(notice);
			        
			        rttr.addFlashAttribute("result", "modify success");
			        
			        return "redirect:/admin/notice/list";
			        
			    }
			  //페이지 삭제
			  @PostMapping("/notice/delete")
			  public String admin_noticeDeletePOST(int bno, RedirectAttributes rttr) {
				  
				  nservice.delete(bno);
				  
				  rttr.addFlashAttribute("result", "delete success");
				  
				  return "redirect:/admin/notice/list";
			  }
			 
			 

}
