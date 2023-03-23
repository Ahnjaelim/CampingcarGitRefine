package kr.co.ccrent.mapper;

import java.util.List;

import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;




public interface CompanyMapper {
//	사용자 승인목록 페이징처리
	List<CompanyDTO> selectAll(Criteria cri)throws Exception;
	public int selectAll_Count(Criteria cri) throws Exception;
	
	
//	어드민 승인 대기중인 목록
	List<CompanyDTO> selectAll2(Criteria cri)throws Exception;
	public int selectAll2_Count(Criteria cri) throws Exception;
	
//	어드민 승인되어있는 목록
	List<CompanyDTO> selectAll3(Criteria cri)throws Exception;
	public int selectAll3_Count(Criteria cri) throws Exception;
	
	List<CompanyDTO> getAll2();
	List<CompanyDTO> getAll3();
	
	
	CompanyDTO get(int comp_id);
	CompanyDTO get2(int comp_id);
	
	int register(CompanyDTO companyDTO);

	int stsmodify(CompanyDTO companyDTO);
	int stsmodify2(int comp_status);
	




	
}
