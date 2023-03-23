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
public class CompanyDTO {
	private int comp_id;            // 캠핑카 대여회사ID ( PK )
	private String comp_name;       // 회사명
	private String comp_addr;       // 주소
	private String comp_phone;      // 전화번호
	private String comp_pic;        // 담당자 이름 ( 담당자를 영어로 the person in charge ) 라고 부르는데 줄여서 pic라고도 합니다
	private String comp_pic_email;  // 담당자 이메일
	private int comp_status;        // 대여회사 신청상태 0이면 대기중 , 1이면 승인 , -1 이면 거절
}