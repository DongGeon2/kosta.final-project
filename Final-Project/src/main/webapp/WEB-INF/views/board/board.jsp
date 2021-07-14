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
             <th scope="col">조회수</th>
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
                <a href="${pageContext.request.contextPath}/getDetailPostByNo?boardNo=${list.boardNo}">
                    <span class="label-blue">${list.title}</span>
                </a>
            </td>
            <td>
                <span class="label-blue">${list.memberVO.id}</span>
            </td>
             <td>
                <span class="label-blue">${list.hits}</span>
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
            <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/registerboardForm">글쓰기</a>
        </div>
    </div>
     <!-- pagination -->
                <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
                <div class="pagination-style text-center mt-5 pt-5">
                    <ul>
                                         <!-- 이전 그룹일때 -->
                    <c:if test="${pb.previousPageGroup }">
                        <li> 
                           <a href="/board?pageNo=${pb.startPageOfPageGroup-1 }" class="not-allowed">
                                <span class="fa fa-angle-double-left" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                        
                    <c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                    <c:choose>
                       <c:when test="${pb.nowPage==page }">
                           <li><a class="active" href="/board?pageNo=${page }">${page }</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a href="/board?pageNo=${page }">${page }</a></li>
                        </c:otherwise>
                    </c:choose>
               </c:forEach>
                                        <!-- 다음 그룹일때 -->
               <c:if test="${pb.nextPageGroup }">
                        <li>
                            <a href="/board?pageNo=${pb.endPageOfPageGroup+1 }">
                                 <span class="fa fa-angle-double-right" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                    </ul>
                </div>
                <!-- //pagination -->
</div>
