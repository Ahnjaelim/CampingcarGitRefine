package kr.co.ccrent.dto;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FaqBoardDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private String updateDate;
	
	
	
	
}
