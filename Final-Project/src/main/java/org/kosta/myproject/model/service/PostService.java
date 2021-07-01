package org.kosta.myproject.model.service;

import java.util.ArrayList;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;

public interface PostService {

	int getTotalCount();

	ArrayList<PostVO> getList(PagingBean pagingBean);

}