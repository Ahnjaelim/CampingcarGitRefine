package kr.co.ccrent.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import kr.co.ccrent.domain.BoardConfigVO;
import kr.co.ccrent.domain.BoardFileVO;
import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.dto.BoardConfigDTO;
import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.mapper.BoardFileMapper;
import kr.co.ccrent.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;
	private final BoardFileMapper boardFileMapper;
	private final ModelMapper modelMapper;

	@Override
	public int getTableCheck(String bo_table) {
		return boardMapper.selectTableCheck(bo_table);
	}	
	
	@Override
	public List<BoardDTO> getAll(String bo_table) {
		List<BoardDTO> dtolist = boardMapper.selectAll(bo_table).stream()
				.map(vo -> modelMapper.map(vo, BoardDTO.class))
				.collect(Collectors.toList());
		return dtolist;
	}

	@Override
	public PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO) {
		pageRequestDTO.setBo_table(pageRequestDTO.getBo_table());
		String bo_table = pageRequestDTO.getBo_table();
		int istable = boardMapper.selectTableCheck(bo_table);
		PageResponseDTO<BoardDTO> pageResponseDTO = null;
		if(istable>0) {
			System.out.println("Table Exists");
			List<BoardVO> volist = boardMapper.selectList(pageRequestDTO);
			List<BoardDTO> dtolist = volist.stream()
					.map(vo -> modelMapper.map(vo, BoardDTO.class))
					.collect(Collectors.toList());
			int total = boardMapper.selectCount(pageRequestDTO);
			pageResponseDTO = PageResponseDTO.<BoardDTO>withAll()
					.dtoList(dtolist)
					.total(total)
					.pageRequestDTO(pageRequestDTO)
					.build();
		}else {
			System.out.println("Table Do Not Exist");
		}
		return pageResponseDTO;
	}

	@Override
	public void register(BoardDTO boardDTO, MultipartFile[] file, HttpServletRequest request) {
		BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);
		boardMapper.insert(boardVO);
		int wr_id = boardMapper.selectMaxId(boardDTO.getBo_table());
		System.out.println("File : "+file.length);
		
		int i = 0;
		for(MultipartFile multipartFile : file) {
			System.out.println("Upload File Name: "+multipartFile.getOriginalFilename());
			if(!multipartFile.getOriginalFilename().equals("")) {
				Long unixtime =  System.currentTimeMillis();
				String fileName = unixtime + "_" + multipartFile.getOriginalFilename();
				try{
					String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/data/"+boardDTO.getBo_table()+"/");
					System.out.println(path);
		            File folder = new File(path);
		            if (!folder.exists()) folder.mkdirs();
		            File destination = new File(path + File.separator + fileName);
		            multipartFile.transferTo(destination);
		            System.out.println(destination);
		            BoardFileVO boardFileVO = BoardFileVO.builder()
		            		.bo_table(boardDTO.getBo_table())
		            		.wr_id(wr_id)
		            		.bf_no(i)
		            		.bf_file(multipartFile.getOriginalFilename())
		            		.bf_source(fileName)
		            		.build();
		            boardFileMapper.insert(boardFileVO);
		            System.out.println("success!");
		        }catch (Exception e){
		            System.out.println("error!");
		        }
				i++;
			} // end of if
		} // end of for
	
	}
	
	@Override
	public BoardConfigDTO getBoardConfig(String bo_table) {
		BoardConfigVO boardConfigVO = boardMapper.selectBoardConfig(bo_table);
		BoardConfigDTO boardConfigDTO = null;
		if(boardConfigVO!=null) {
			boardConfigDTO = modelMapper.map(boardConfigVO, BoardConfigDTO.class);
		}
		return boardConfigDTO;
	}

	@Override
	public BoardDTO getOne(HashMap<String, Object> varmap) {
		BoardVO boardVO = boardMapper.selectOne(varmap);
		BoardDTO boardDTO = null;
		if(boardVO!=null) {
			boardDTO = modelMapper.map(boardVO, BoardDTO.class);
		}
		return boardDTO;
	} 

}
