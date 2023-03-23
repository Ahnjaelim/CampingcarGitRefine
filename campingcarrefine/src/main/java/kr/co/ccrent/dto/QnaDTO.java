package kr.co.ccrent.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

//import kr.co.ccrent.domain.QnaVO;
//import kr.co.ccrent.domain.QnaVO.QnaVOBuilder;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
	private Integer qna_no; // 문의글 번호
	private String qna_title; // 문의글 제목
	private String qna_content; // 문의글 내용
	private String qna_writer; // 문의글 작성자
	private Date qna_regdate; // 문의글 작성일
	
}
