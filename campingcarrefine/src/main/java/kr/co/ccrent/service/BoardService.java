package kr.co.ccrent.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.ccrent.dto.BoardConfigDTO;
import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;

public interface BoardService {
	int getTableCheck(String bo_table);
	BoardConfigDTO getBoardConfig(String bo_table);
	List<BoardDTO> getAll(String bo_table);
	PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);
	void register(BoardDTO boardDTO, MultipartFile[] file, HttpServletRequest request);
	BoardDTO getOne(HashMap<String, Object> varmap);
}
