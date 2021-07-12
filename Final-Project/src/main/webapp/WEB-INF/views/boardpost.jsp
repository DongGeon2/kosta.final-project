<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- contact -->
    <section class="w3l-w3l-contacts-12 py-5">
        <div class="contact-top py-md-5 py-4">
            <div class="container">
                <div class="waviy text-center mb-md-5 mb-4">
                    <span style="--i:1">P</span>
                    <span style="--i:2">o</span>
                    <span style="--i:3">s</span>
                    <span style="--i:4">t</span>
                </div>
                <!-- fireworks effect -->
                <div class="pyro">
                    <div class="before"></div>
                    <div class="after"></div>
                </div>
                <div class="contacts12-main">
                    <form action="${pageContext.request.contextPath}/member/posting" method="post" class="main-input">
                        <div class="top-inputs d-grid">
                            <input type="text" placeholder="Title" name="title" id="w3lName" required="">
                        </div>
                       <!--  <input type="text" placeholder="Picture" name="w3lName" id="w3lName" required=""> -->
                        <textarea placeholder="Content" name="content" id="w3lMessage" required=""></textarea>
                        <button type="submit" class="btn btn-style">Send Now</button>
                    </form>
                </div>
                <div class="wrapper-full">
                   </div>
                   </div>
                   </div>
                   </section>
                   