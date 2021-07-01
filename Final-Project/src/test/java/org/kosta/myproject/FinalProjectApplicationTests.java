package org.kosta.myproject;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.model.service.PostService;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FinalProjectApplicationTests {
@Resource
private PostService ps;
	@Test
	void contextLoads() {
		ArrayList<PostVO> list=ps.getList(new PagingBean(3));
		PagingBean pb = new PagingBean(3);
		System.out.println(pb);
		pb = new PagingBean(3,1);
		System.out.println(pb);
		System.out.println(list);
	}
	/* tettstets */
}
