<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Events</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Events</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->

    <!-- events section -->
    <section class="w3l-text-6">
        <div class="text-6-mian bottom-space py-5">
            <div class="container py-md-5 py-4">
                <div class="waviy text-center mb-sm-5 mb-4 pb-lg-4">
                    <span style="--i:1">R</span>
                    <span style="--i:2">e</span>
                    <span style="--i:3">c</span>
                    <span style="--i:4">o</span>
                    <span style="--i:5">m</span>
                    <span style="--i:6">m</span>
                    <span style="--i:7">e</span>
                    <span style="--i:8">n</span>
                    <span style="--i:1">d</span>
                </div>
                <!-- fireworks effect -->
                <div class="pyro">
                    <div class="before"></div>
                    <div class="after"></div>
                </div>
                <div class="row top-cont-grid align-items-center">
                
                <!-- 식당1 -->
                    
                <div class="row">
                <c:forEach items="${restaurantList}" var="restaurant">
                <div class="col-lg-4 col-md-6 item">
                    <div class="card">
                        <div class="card-header p-0 position-relative">
                            <a href="single.html">
                                <img class="card-img-bottom d-block radius-image-full" src="assets/images/restaurant1.jpg"
                                    alt="Card image cap">
                            </a>
                        </div>
                        <div class="card-body blog-details">
                            <span class="label-blue">코스타소고기</span>
                            <a href="single.html" class="blog-desc">
                            
								${restaurant.bossComment}<br>
							
                            </a>
                            <div class="author align-items-center mt-3 mb-1">
                                <img src="assets/images/testi1.jpg" alt="" class="img-fluid rounded-circle" />
                                <ul class="blog-meta">
                                    <li>
                                        <a href="single.html">
                                        
											${restaurant.bossName}<br>
										
										</a>
                                    </li>
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value">게시날짜</span>. <span
                                            class="meta-value ml-2"><span class="fa fa-clock-o"></span> 1 min</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                    
                    
                    <div class="col-lg-1">

                    </div>
                    <div class="col-lg-6 left-cont mb-lg-0 mb-5">
						<h4>
							
								${restaurant.resName}<br>
							
						</h4>
						<div class="d-flex align-items-center mt-3">
                            <h6><i class="fa fa-clock-o mr-1" aria-hidden="true"></i>
                            
								${restaurant.resTime}<br>
							
							</h6>
                            <h6 class="ml-3"><i class="fa fa-calendar mr-2" aria-hidden="true"></i>날짜</h6>
                        </div>
                        <p class="mt-3 mb-2">
                        	
								${restaurant.resContext}<br>
							
							</p>
							
                        <a href="single.html" class="btn btn-style mt-4">Restaurant Details</a>
                    </div>
                    <br><br><br>
                    </c:forEach>
                </div>
                
                <!-- 식당1 -->
				<br><br><br>
                
                <!-- 식당2 -->
                <div class="row">
                <div class="col-lg-4 col-md-6 item">
                    <div class="card">
                        <div class="card-header p-0 position-relative">
                            <a href="single.html">
                                <img class="card-img-bottom d-block radius-image-full" src="assets/images/s1.png"
                                    alt="Card image cap">
                            </a>
                        </div>
                        <div class="card-body blog-details">
                            <span class="label-blue">코스타소고기</span>
                            <a href="single.html" class="blog-desc">24시간 영업, 회식 30자리까지 환영합니다. 예약 많이 해주세요
                            </a>
                            <div class="author align-items-center mt-3 mb-1">
                                <img src="assets/images/testi1.jpg" alt="" class="img-fluid rounded-circle" />
                                <ul class="blog-meta">
                                    <li>
                                        <a href="single.html">Isabella ava</a> </a>
                                    </li>
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value"> Jan 28 2021 </span>. <span
                                            class="meta-value ml-2"><span class="fa fa-clock-o"></span> 1 min</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                    
                    
                    <div class="col-lg-1">

                    </div>
                    <div class="col-lg-6 left-cont mb-lg-0 mb-5">
                        <h4>Restaurant Name</h4>
                        <div class="d-flex align-items-center mt-3">
                            <h6><i class="fa fa-clock-o mr-1" aria-hidden="true"></i> 7:00 pm - 8:00 pm</h6>
                            <h6 class="ml-3"><i class="fa fa-calendar mr-2" aria-hidden="true"></i>Dec 31</h6>
                        </div>
                        <p class="mt-3 mb-2">Sed luctus orci sit amet tempor luctus. Nullam non felis massa. Phasellus
                            vitae fringilla
                            sapien,
                            quis dictum mi. Quisque consectetur egestas.Lorem ipsum dolor sit amet, consectetur
                            adipiscing
                            elit.</p>
                        <a href="single.html" class="btn btn-style mt-4">Restaurant Details</a>
                    </div>
                </div>
                <br><br><br>
                <!-- 식당2 -->
                
                <!-- 식당3 -->
                <div class="row">
                <div class="col-lg-4 col-md-6 item">
                    <div class="card">
                        <div class="card-header p-0 position-relative">
                            <a href="single.html">
                                <img class="card-img-bottom d-block radius-image-full" src="assets/images/s1.png"
                                    alt="Card image cap">
                            </a>
                        </div>
                        <div class="card-body blog-details">
                            <span class="label-blue">코스타소고기</span>
                            <a href="single.html" class="blog-desc">24시간 영업, 회식 30자리까지 환영합니다. 예약 많이 해주세요
                            </a>
                            <div class="author align-items-center mt-3 mb-1">
                                <img src="assets/images/testi1.jpg" alt="" class="img-fluid rounded-circle" />
                                <ul class="blog-meta">
                                    <li>
                                        <a href="single.html">Isabella ava</a> </a>
                                    </li>
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value"> Jan 28 2021 </span>. <span
                                            class="meta-value ml-2"><span class="fa fa-clock-o"></span> 1 min</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                    
                    
                    <div class="col-lg-1">

                    </div>
                    <div class="col-lg-6 left-cont mb-lg-0 mb-5">
                        <h4>Restaurant Name</h4>
                        <div class="d-flex align-items-center mt-3">
                            <h6><i class="fa fa-clock-o mr-1" aria-hidden="true"></i> 7:00 pm - 8:00 pm</h6>
                            <h6 class="ml-3"><i class="fa fa-calendar mr-2" aria-hidden="true"></i>Dec 31</h6>
                        </div>
                        <p class="mt-3 mb-2">Sed luctus orci sit amet tempor luctus. Nullam non felis massa. Phasellus
                            vitae fringilla
                            sapien,
                            quis dictum mi. Quisque consectetur egestas.Lorem ipsum dolor sit amet, consectetur
                            adipiscing
                            elit.</p>
                        <a href="single.html" class="btn btn-style mt-4">Restaurant Details</a>
                    </div>
                </div>
                <br><br><br>
                <!-- 식당3 -->
                

                <!-- pagination -->
                <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
                <div class="pagination-style text-center mt-5 pt-5">
                    <ul>
                    <c:if test="${pb.previousPageGroup }">
                        <li> 
                        	<a href="countPage?pageNo=${pb.startPageOfPageGroup-1 }" class="not-allowed">
                                <span class="fa fa-angle-double-left" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                    <c:choose>
                    	<c:when test="${pb.nowPage==page }">
                        <li><a class="active" href="countPage?pageNo=${page }">${page }</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href="countPage?pageNo=${page }">${page }</a></li>
                        </c:otherwise>
                    </c:choose>
					</c:forEach>
					<c:if test="${pb.nextPageGroup }">
                        <li>
                            <a href="countPage?pageNo=${pb.endPageOfPageGroup+1 }">
                           		<span class="fa fa-angle-double-right" aria-hidden="true"></span>
                            </a>
                        </li>
                    </c:if>
                    </ul>
                </div>
                <!-- //pagination -->
                
                
            </div>
        </div>
    </section>
    <!-- image with text section -->