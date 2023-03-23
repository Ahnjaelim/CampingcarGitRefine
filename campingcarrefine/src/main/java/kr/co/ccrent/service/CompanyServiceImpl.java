package kr.co.ccrent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.mapper.CompanyMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	CompanyMapper companyMapper;
	


	@Override
	public CompanyDTO get(int comp_id) {
		
		return companyMapper.get(comp_id);
	}

	@Override
	public int register(CompanyDTO companyDTO) {
		
		
		return companyMapper.register(companyDTO);
	}

	@Override
	public int stsmodify(CompanyDTO companyDTO) {
		return companyMapper.stsmodify(companyDTO);
	}

	@Override
	public  int stsmodify2(int comp_status) {
		
		return companyMapper.stsmodify2(comp_status);
	}

	@Override
	public List<CompanyDTO> getAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return companyMapper.selectAll(cri);
	}

	@Override
	public int getAll_Count(Criteria cri) throws Exception {
		
		return companyMapper.selectAll_Count(cri);
	}




	
	@Override
	public List<CompanyDTO> getAll2(Criteria cri)throws Exception {
		// TODO Auto-generated method stub
		return companyMapper.selectAll2(cri);
	}
	@Override
	public int getAll2_Count(Criteria cri) throws Exception {
		
		return companyMapper.selectAll2_Count(cri);
	}
	
	@Override
	public List<CompanyDTO> getAll3(Criteria cri)throws Exception {
		// TODO Auto-generated method stub
		return companyMapper.selectAll3(cri);
	}
	@Override
	public int getAll3_Count(Criteria cri) throws Exception {
		
		return companyMapper.selectAll3_Count(cri);
	}

	@Override
	public List<CompanyDTO> getAll2() {
		// TODO Auto-generated method stub
		return (List<CompanyDTO>) companyMapper.getAll2();
	}

	@Override
	public List<CompanyDTO> getAll3() {
		// TODO Auto-generated method stub
		return (List<CompanyDTO>) companyMapper.getAll3();
	}

	@Override
	public CompanyDTO get2(int comp_id) {
		
		return companyMapper.get(comp_id);
	}



}
