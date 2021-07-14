package org.kosta.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myproject.model.vo.BoardVO;
import org.kosta.myproject.model.vo.CommentVO;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.service.BoardService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;

	@Secured("ROLE_MEMBER")
	@RequestMapping("/registerboardForm")
	public String registerboardForm() {
		return "board/registerboardForm.tiles";
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("/board")
	public String postList(Model model, String pageNo, HttpServletRequest request) {
		int totalPostcount = boardService.getTotalCount();
		System.out.println("게시글의 수: "+totalPostcount);
		PagingBean pagingBean = null;

		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostcount);
		} else {
			pagingBean = new PagingBean(totalPostcount, Integer.parseInt(pageNo));
		}

		model.addAttribute("pagingBean", pagingBean);
		ArrayList<BoardVO> boardList = boardService.postList(pagingBean);
		model.addAttribute("postList", boardList);
		return "board/board.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@PostMapping("/posting")
	public String posting(BoardVO boardVO, MultipartHttpServletRequest request,
			@RequestParam("uploadImg") MultipartFile mFile) {
		try {
			String uploadPath = request.getServletContext().getRealPath("/upload/");
			mFile.transferTo(new File(uploadPath + mFile.getOriginalFilename()));
			// System.out.println("--->"+mFile.getOriginalFilename());
			MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			boardVO.setMemberVO(mvo);
			boardVO.setImg(mFile.getOriginalFilename());
			System.out.println("boardVO:" + boardVO + " posting 인증정보 확인:" + mvo);

			boardService.posting(boardVO);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		// Spring Security 에 저장된 인증 정보(회원객체)를 반환
		return "redirect:board";

	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("/getDetailPostByNo")
	public String getDetailPostByNo(String boardNo, Model model,String pageNo) {
		System.out.println("getDetailPostByNo");
		int totalCommentcount = boardService.getTotalCommentCount(boardNo);
		System.out.println(totalCommentcount);
		System.out.println(boardNo+"의 댓글 수: "+totalCommentcount);
		System.out.println(pageNo);
		PagingBean pagingBean = null;

		if (pageNo == null) {
			pagingBean = new PagingBean(totalCommentcount);
		} else {
			pagingBean = new PagingBean(totalCommentcount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("viewDetailPost", boardService.getDetailPostByNo(boardNo));
		System.out.println("위까지 완료");
		ArrayList<CommentVO> commentVO = boardService.getCommentList(pagingBean,boardNo);
		System.out.println("위까지 완료");
		model.addAttribute("commentList", commentVO);
		boardService.plusHits(boardNo);
		return "board/detailPost.tiles";
	}

	/* 게시글 삭제 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("/deletePosting")
	public String deletePosting(String boardNo) {
		boardService.deletePosting(boardNo);
		return "redirect:board";
	}
	/* 게시글 삭제 */
	
	/* 게시판 댓글 */
	@Secured("ROLE_MEMBER")
	@PostMapping("/postComment")
	public String postComment(CommentVO commentVO) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//현재 로그인된 멤버의 정보
		commentVO.setMemberVO(mvo);
		System.out.println(commentVO);
		boardService.postComment(commentVO);
		System.out.println(commentVO.getBoardVO().getBoardNo());
		return "redirect:getDetailPostByNo?boardNo="+commentVO.getBoardVO().getBoardNo();
	}
	/* 게시판 댓글 */
	
	

}
