package com.yurim.www.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Alias("RequestCommentForDetail")
public class RequestCommentForDetail {
	private Long userNo;
	private String id;
	private String originPic;
	private String pass;

	private String isbn;

	private Long appraisalNo;
	private int star;
	private String comment;
	private String startDate;
	private String endDate;
	private String coPrv;
	private Long statusNum;
}
