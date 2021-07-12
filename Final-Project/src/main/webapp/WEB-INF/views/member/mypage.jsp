<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- inner banner -->
<div class="inner-banner">
	<div class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">My Page</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>My Page</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	function Unsubscribe() {
		if (confirm("회원 탈퇴하시겠습니까?")) 
		document.Unsubscribe.submit();
		
}
</script>
<section class="w3l-bottom-grids-6 w3l-services py-5" id="services">
	<div class="container py-md-5 py-4">
		<div class="waviy text-center mb-md-5 mb-4">
			<span style="--i: 1">M</span>
			 <span style="--i: 2">y</span> 
			 <span	style="--i: 3"></span> 
			 <span style="--i: 4">P</span> 
			 <span style="--i: 5">a</span> 
			<span style="--i: 6">g</span> 
			<span style="--i: 7">e</span>
		</div>
		<!-- fireworks effect -->
		<div class="pyro">
			<div class="before"></div>
			<div class="after"></div>
		</div>
		<div class="grids-area-hny main-cont-wthree-fea row">	
				<div class="col-lg-4 col-md-6 grids-feature">
                    <div class="area-box">
                        <img src="assets/images/MyOrder.png" alt="" class="img-fluid">
                        <h4><a href="MyOrder" class="title-head">My Order</a></h4>
                        <p class="">Unforgettable Time</p><!-- Reservation history /  -->
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-md-0 mt-4">
                    <div class="area-box">
                        <img src="assets/images/MyPick.png" alt="" class="img-fluid">
                        <h4><a href="#feature" class="title-head">My pick</a></h4>
                        <p class="">My Collection</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
                    <div class="area-box">
                        <img src="assets/images/MyPost.png" alt="" class="img-fluid">
                        <h4><a href="myPost" class="title-head">My Post</a></h4>
                        <p class="">General forum</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                        <img src="assets/images/MyComment.png" alt="" class="img-fluid">
                        <h4><a href="myReview" class="title-head">My Review</a></h4>
                        <p class="">View all my review</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                        <img src="assets/images/Edit.png" alt="" class="img-fluid">
                        <h4><a href="updateMemberForm" class="title-head">Edit my profile</a></h4>
                        <p class="">Edit my profile</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                        <img src="assets/images/Unsubscribe.png" alt="" class="img-fluid">
                        <h4><a href="deleteMember" class="title-head" onclick="Unsubscribe()">Unsubscribe account</a></h4>
                        <p class="">Don't Unsubscribe Our Website</p>
                    </div>
                </div>
		</div>
	</div>
</section>
