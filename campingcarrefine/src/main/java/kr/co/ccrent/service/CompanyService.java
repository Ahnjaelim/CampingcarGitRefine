package kr.co.ccrent.service;

import java.util.List;

import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;



public interface CompanyService {
	
// 			insert   => register
// 			select   => get     
//          list     => getAll()
//          update   =>  modify
//          delete    => remove
//	랜트카 대여 회사명 전체 조회
	public List<CompanyDTO> getAll(Criteria cri) throws Exception;
	public int getAll_Count(Criteria cri) throws Exception;
	
//	랜드카 대여 회사 승인 대기중인 목록 전체 조회
	public List<CompanyDTO> getAll2(Criteria cri)throws Exception;
	public int getAll2_Count(Criteria cri) throws Exception;
//	랜드카 대여 회사 승인 목록 전체 조회 (관리자 listForm)
	public List<CompanyDTO> getAll3(Criteria cri)throws Exception;
	public int getAll3_Count(Criteria cri) throws Exception;

//	랜트카 대여 회사 상세 조회
	public CompanyDTO get(int comp_id);
	public CompanyDTO get2(int comp_id);
	
//	회사 정보 추가 하기
	public int register(CompanyDTO companyDTO);
	
	public List<CompanyDTO> getAll2();
	public List<CompanyDTO> getAll3();
	
//	- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
//	회사 정보 추가시 관리자 모드에서 승인       ( status를 1로 수정 해줌으로써 승인받고 브라우저에 띄워짐 ) 
	public  int stsmodify(CompanyDTO companyDTO);
	
//	회사 정보 추가시 관리자 모드에서 거절       ( status를 -1로 변경하여 거절한다.실제로 지워지진않고 거절당한걸 볼수있게 남겨둠 )
	public  int stsmodify2(int comp_status);

	
//	- - - - - - - - - - - - - - -  - -- - - - - - - - -

	
}
