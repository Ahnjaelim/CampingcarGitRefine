package kr.co.ccrent;

import java.util.HashMap;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.mapper.BoardMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	// @Test
	public void selectTableCheckTest() {
		System.out.println(boardMapper.selectTableCheck("sdfsdfsdf"));
	}
	
	// @Test
	public void selectBoardConfig() {
		System.out.println(boardMapper.selectBoardConfig("free"));
	}
	
	// @Test
	public void selectOneTest() {
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("bo_table", "notice");
		varmap.put("wr_id", 1);
		System.out.println(boardMapper.selectOne(varmap));
	}

}
