package kr.co.ccrent.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardConfigDTO {
	private String bo_table;
	private String bo_subject;
	private int bo_use_category;
	private String bo_category_list;
	private int bo_mn;
	private int bo_sn;
}
