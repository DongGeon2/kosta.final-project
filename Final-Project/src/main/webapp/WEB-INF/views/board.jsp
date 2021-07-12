<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
               


    <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">About Us</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>About Us</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->


<div class="container">
    <table class="table">
        <thead class="thead-light">
        <tr class="text-center">
            <th scope="col">No</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${postList}" var="list">
        <tr class="text-center">
            <th scope="row">
                <span class="label-blue">${list.boardNo}</span>
            </th>
            <td>
                <a href="${pageContext.request.contextPath}/member/getDetailPostByNo?boardNo=${list.boardNo}">
                    <span class="label-blue">${list.title}</span>
                </a>
            </td>
            <td>
                <span class="label-blue">${list.memberVO.id}</span>
            </td>
            <td>
                <span class="label-blue">${list.timePosted}</span>
            </td>
        </tr>
        </c:forEach>
        </tbody>
        
    </table>
    <div class="row">
        <div class="col-auto mr-auto"></div>
        <div class="col-auto">
            <a class="btn btn-primary" role="button" href="/member/registerboardForm">글쓰기</a>
        </div>
    </div>
     <!-- pagination -->
                <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
                <div class="pagination-style text-center mt-5 pt-5">
                    <ul>
                    							<!-- 이전 그룹일때 -->
                    <c:if test="${pb.previousPageGroup }">
                        <li> 
                        	<a href="/member/postList?pageNo=${pb.startPageOfPageGroup-1 }" class="not-allowed">
                                <span class="fa fa-angle-double-left" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                        
                    <c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                    <c:choose>
                    	<c:when test="${pb.nowPage==page }">
                        	<li><a class="active" href="/member/postList?pageNo=${page }">${page }</a></li>
                        </c:when>
                        <c:otherwise>
                        	<li><a href="/member/postList?pageNo=${page }">${page }</a></li>
                        </c:otherwise>
                    </c:choose>
					</c:forEach>
                								<!-- 다음 그룹일때 -->
					<c:if test="${pb.nextPageGroup }">
                        <li>
                            <a href="/member/postList?pageNo=${pb.endPageOfPageGroup+1 }">
                           		<span class="fa fa-angle-double-right" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                    </ul>
                </div>
                <!-- //pagination -->
</div>



               
               
               
               




<!-- Favicons 
<link href="assetsjinsol/img/favicon.png" rel="icon">
<link href="assetsjinsol/img/apple-touch-icon.png"
   rel="apple-touch-icon">

Google Fonts
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

Vendor CSS Files
<link href="assetsjinsol/vendor/aos/aos.css" rel="stylesheet">
<link href="assetsjinsol/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="assetsjinsol/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="assetsjinsol/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="assetsjinsol/vendor/glightbox/css/glightbox.min.css"
   rel="stylesheet">
<link href="assetsjinsol/vendor/remixicon/remixicon.css"
   rel="stylesheet">
<link href="assetsjinsol/vendor/swiper/swiper-bundle.min.css"
   rel="stylesheet">

 Template Main CSS File
<link href="assetsjinsol/css/style.css" rel="stylesheet">
 -->
<!-- ======= Blog Section ======= -->

                    <%--  <section id="blog" class="blog">
                        <div class="container" data-aos="fade-up">

                           <div class="row">

                              <div class="col-lg-8 entries">
                              
                  <c:set var="list2" value="${postList}"/>
                  <c:forEach items="${postList}" var="list">
                                 <article class="entry">

                                    <div class="entry-img">
                                       <img src="assetsjinsol/img/blog/blog-1.jpg" alt=""
                                          class="img-fluid">
                                    </div>

                                    <h2 class="entry-title">
                                       <a href="blog-single.html">${list.boardTitle}</a>
                                    </h2>

                                    <div class="entry-meta">
                                       <ul>
                                          <li class="d-flex align-items-center"><i
                                             class="bi bi-person"></i> <a href="blog-single.html">John
                                                Doe</a></li>
                                          <li class="d-flex align-items-center"><i
                                             class="bi bi-clock"></i> <a href="blog-single.html"><time
                                                   datetime="2020-01-01">Jan 1, 2020</time></a></li>
                                          <li class="d-flex align-items-center"><i
                                             class="bi bi-chat-dots"></i> <a href="blog-single.html">12
                                                Comments</a></li>
                                       </ul>
                                    </div>

                                    <div class="entry-content">
                                       <p>${list.boardContent}</p>
                                       <div class="read-more">
                                          <a href="blog-single.html">Read More</a>
                                       </div>
                                    </div>

                                 </article>
                                 
                                 </c:forEach>
                                 <!-- End blog entry -->

                              
                                 <div class="blog-pagination">
                                    <ul class="justify-content-center">
                                       <li><a href="#">1</a></li>
                                       <li class="active"><a href="#">2</a></li>
                                       <li><a href="#">3</a></li>
                                    </ul>
                                 </div>

                              </div>
                              <!-- End blog entries list -->

                              <div class="col-lg-4">

                                 <div class="sidebar">

                                    <a href='/member/registerboardForm'>글 작성하기</a>

                                    <h3 class="sidebar-title">Search</h3>
                                    <div class="sidebar-item search-form">
                                       <form action="">
                                          <input type="text">
                                          <button type="submit">
                                             <i class="bi bi-search"></i>
                                          </button>
                                       </form>
                                    </div>
                                    <!-- End sidebar search formn-->

                                    <h3 class="sidebar-title">Categories</h3>
                                    <div class="sidebar-item categories">
                                       <ul>
                                          <li><a href="#">General <span>(25)</span></a></li>
                                          <li><a href="#">Lifestyle <span>(12)</span></a></li>
                                          <li><a href="#">Travel <span>(5)</span></a></li>
                                          <li><a href="#">Design <span>(22)</span></a></li>
                                          <li><a href="#">Creative <span>(8)</span></a></li>
                                          <li><a href="#">Educaion <span>(14)</span></a></li>
                                       </ul>
                                    </div>
                                    <!-- End sidebar categories-->

                                    <h3 class="sidebar-title">Recent Posts</h3>
                                    <div class="sidebar-item recent-posts">
                                       <div class="post-item clearfix">
                                          <img src="assetsjinsol/img/blog/blog-recent-1.jpg" alt="">
                                          <h4>
                                             <a href="blog-single.html">Nihil blanditiis at in
                                                nihil autem</a>
                                          </h4>
                                          <time datetime="2020-01-01">Jan 1, 2020</time>
                                       </div>

                                       <div class="post-item clearfix">
                                          <img src="assetsjinsol/img/blog/blog-recent-2.jpg" alt="">
                                          <h4>
                                             <a href="blog-single.html">Quidem autem et impedit</a>
                                          </h4>
                                          <time datetime="2020-01-01">Jan 1, 2020</time>
                                       </div>

                                       <div class="post-item clearfix">
                                          <img src="assetsjinsol/img/blog/blog-recent-3.jpg" alt="">
                                          <h4>
                                             <a href="blog-single.html">Id quia et et ut maxime
                                                similique occaecati ut</a>
                                          </h4>
                                          <time datetime="2020-01-01">Jan 1, 2020</time>
                                       </div>

                                       <div class="post-item clearfix">
                                          <img src="assetsjinsol/img/blog/blog-recent-4.jpg" alt="">
                                          <h4>
                                             <a href="blog-single.html">Laborum corporis quo dara
                                                net para</a>
                                          </h4>
                                          <time datetime="2020-01-01">Jan 1, 2020</time>
                                       </div>

                                       <div class="post-item clearfix">
                                          <img src="assetsjinsol/img/blog/blog-recent-5.jpg" alt="">
                                          <h4>
                                             <a href="blog-single.html">Et dolores corrupti quae
                                                illo quod dolor</a>
                                          </h4>
                                          <time datetime="2020-01-01">Jan 1, 2020</time>
                                       </div>

                                    </div>
                                    <!-- End sidebar recent posts-->

                                    <h3 class="sidebar-title">Tags</h3>
                                    <div class="sidebar-item tags">
                                       <ul>
                                          <li><a href="#">App ${list2}</a></li>
                                          <li><a href="#">IT</a></li>
                                          <li><a href="#">Business</a></li>
                                          <li><a href="#">Mac</a></li>
                                          <li><a href="#">Design</a></li>
                                          <li><a href="#">Office</a></li>
                                          <li><a href="#">Creative</a></li>
                                          <li><a href="#">Studio</a></li>
                                          <li><a href="#">Smart</a></li>
                                          <li><a href="#">Tips</a></li>
                                          <li><a href="#">Marketing</a></li>
                                       </ul>
                                    </div>
                                    <!-- End sidebar tags-->

                                 </div>
                                 <!-- End sidebar -->

                              </div>
                              <!-- End blog sidebar -->

                           </div>

                        </div>
                     </section>
                     <!-- End Blog Section -->
               <!-- End #main -->


               <a href="#"
                  class="back-to-top d-flex align-items-center justify-content-center"><i
                  class="bi bi-arrow-up-short"></i></a>

               <!-- Vendor JS Files -->
               <script src="assetsjinsol/vendor/aos/aos.js"></script>
               <script
                  src="assetsjinsol/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
               <script src="assetsjinsol/vendor/glightbox/js/glightbox.min.js"></script>
               <script
                  src="assetsjinsol/vendor/isotope-layout/isotope.pkgd.min.js"></script>
               <script src="assetsjinsol/vendor/php-email-form/validate.js"></script>
               <script src="assetsjinsol/vendor/purecounter/purecounter.js"></script>
               <script src="assetsjinsol/vendor/swiper/swiper-bundle.min.js"></script>

               <!-- Template Main JS File -->
               <script src="assetsjinsol/js/main.js"></script> --%>

 