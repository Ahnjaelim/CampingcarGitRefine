package kr.co.ccrent.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardConfigVO {
	private String bo_table;
	private String bo_subject;
	private int bo_use_category;
	private String bo_category_list;
	private int bo_mn;
	private int bo_sn;
}
