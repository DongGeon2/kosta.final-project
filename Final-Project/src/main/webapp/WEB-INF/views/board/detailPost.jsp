<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>    

    <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Post</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Post</li>
                </ul>
            </div>
        </section>
    </div>   
    <!-- //inner banner -->
 <!-- single page -->
    <section class="w3l-blog-single">
        <div class="single blog py-5">
            <div class="container py-md-5 py-4">
                <!-- fireworks effect -->
                <div class="pyro">
                    <div class="before"></div>
                    <div class="after"></div>
                </div>
                
                
                <!-- left side blog post content -->
                <div class="single-left">
                    <div class="single-left1">
                        <h3 class="title-big mb-3 text-center"> ${viewDetailPost.boardNo}. ${viewDetailPost.title}
                        </h3>
                        <ul class="admin-post text-center">
                            <li>
                                <a href="single.html"><span class="fa fa-calendar"></span>${viewDetailPost.timePosted}</a>
                            </li>
                        </ul>
                        <div class="blg-img">
                            <img src="/upload/${viewDetailPost.img}"  style='max-width: 50%; height: auto; display: block; margin: 0px auto;'>
                        </div>
                        <div class="btom-cont1 pt-4 mt-md-2">
                            <p class="mb-4">${viewDetailPost.content}</p>


                        </div>
                    </div>
                  <nav class="post-navigation row">
                        <sec:authentication property="principal.id" var="memberId"/>
                    <c:choose>
                     <c:when test="${viewDetailPost.memberVO.id==memberId}">
                     <div>
                        <a href="${pageContext.request.contextPath}/deletePosting?boardNo=${viewDetailPost.boardNo}" class="name mt-2">&emsp;?????????
                           ??????</a>
                           </div>
                           <div>
                           <a href="${pageContext.request.contextPath}/updateForm?boardNo=${viewDetailPost.boardNo}" class="name mt-2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;????????? ??????</a>
                           </div>
                           </c:when>
                           <c:otherwise>
                       <sec:authentication property="principal.id" var="memberId"/>
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                      <a href="${pageContext.request.contextPath}/deletePosting?boardNo=${viewDetailPost.boardNo}" class="name mt-2">?????????
                           ??????</a>
                     </sec:authorize>
                     </c:otherwise>
                     </c:choose>
            </nav>
                    
                    <!-- ??????????????? -->
                    <c:forEach items="${commentList}" var="comment">
                    <div class="comments">
                       <%--  <h3 class="post-content-title">${comment.commentNo}</h3> --%>
                        <div class="media mt-4 bod-1">
                            <div class="img-circle">
                                <img src="/assets/images/???????????????.JPG" class="img-fluid">
                            </div>
                            <div class="media-body">
                                <div class="medi-top mb-2">
                                    <a class="name mt-0">${comment.memberVO.id} </a>
                                    <span>${comment.commentTime}  |<a href="${pageContext.request.contextPath}/deleteCommentByNo?boardNo=${viewDetailPost.boardNo}&commentNo=${comment.commentNo}">  ??????</a></span>
                                </div>
                                <p>${comment.commentContent}</p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    	                                    <!-- pagination -->
	                <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
	                <div class="pagination-style text-center mt-5 pt-5">
	                    <ul>
	                    							<!-- ?????? ???????????? -->
	                    <c:if test="${pb.previousPageGroup }">
	                        <li> 
	                        	<a href="/getDetailPostByNo?boardNo=${viewDetailPost.boardNo}&pageNo=${pb.startPageOfPageGroup-1 }" class="not-allowed">
	                                <span class="fa fa-angle-double-left" aria-hidden="true"></span>
	                            </a>
	                        </li>
	                    </c:if>
	                        
	                    <c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	                    <c:choose>
	                    	<c:when test="${pb.nowPage==page }">
	                        	<li><a class="active" href="/getDetailPostByNo?boardNo=${viewDetailPost.boardNo}&pageNo=${page }">${page }</a></li>
	                        </c:when>
	                        <c:otherwise>
	                        	<li><a href="/getDetailPostByNo?boardNo=${viewDetailPost.boardNo}&pageNo=${page }">${page }</a></li>
	                        </c:otherwise>
	                    </c:choose>
						</c:forEach>
	                								<!-- ?????? ???????????? -->
						<c:if test="${pb.nextPageGroup }">
	                        <li>
	                            <a href="/getDetailPostByNo?boardNo=${viewDetailPost.boardNo}&pageNo=${pb.endPageOfPageGroup+1 }">
	                           		<span class="fa fa-angle-double-right" aria-hidden="true"></span>
	                            </a>
	                        </li>
	                    </c:if>
	                    </ul>
	                </div>
	                <!-- //pagination -->
                    <!-- ??????????????? -->
					
					<!-- ??????????????? -->
                    <div class="testi-top mt-5 pt-4">
                        <h3 class="post-content-title">Leave a message</h3>
                        <div class="form-commets mt-4">
                            <form action="${pageContext.request.contextPath}/postComment" method="post">
                                <sec:csrfInput />
                                <input type="hidden" name="boardVO.boardNo" value="${viewDetailPost.boardNo}">
                                <%-- <input type="hidden" name="boardVO.boardNo" value="${viewDetailPost.boardNo}"> --%>
<!--                                 <div class="media-form">
                                    <input type="text" name="Name" required="Name" placeholder="Your Name">
                                    <input type="email" name="Email" required="Email" placeholder="Your Email">
                                </div> -->
                                <textarea name="commentContent" required="" placeholder="Write your comments here"></textarea>
                                <div class="text-right">
                                    <button class="btn btn-primary btn-style" type="submit">Post comment</button>
                                </div>

                            </form>
                        </div>
                    </div>
                    <!-- ??????????????? -->

                    
                </div>
                <!-- left side blog post content -->
                
                
            </div>
        </div>
    </section>
    <!-- //single page -->
    
    