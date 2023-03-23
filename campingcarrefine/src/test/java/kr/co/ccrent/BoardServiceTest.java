package kr.co.ccrent;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.service.BoardService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {
	
	@Autowired
	private BoardService boardService;
	
	@Test
	public void selectListTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder().bo_table("notice").page(1).size(10).build();
		PageResponseDTO<BoardDTO> responseDTO = boardService.getList(pageRequestDTO);
		responseDTO.getDtoList().stream().forEach(dto -> System.out.println(dto));
	}
}
