<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 
<head>
    Required meta tags
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register Restaurant Form</title>
    google-fonts
    <link href="//fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link href="//fonts.googleapis.com/css2?family=Sail&display=swap" rel="stylesheet">
    //google-fonts
    Template CSS Style link
    <link rel="stylesheet" href="assets/css/style-liberty.css">
</head> -->
<style>
  .yejin{
    margin-bottom: 20px;
  }
</style>

    <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Register Restaurant</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Register</li>
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
                    <span style="--i:1">R</span>
                    <span style="--i:2">e</span>
                    <span style="--i:3">g</span>
                    <span style="--i:4">i</span>
                    <span style="--i:5">s</span>
                    <span style="--i:6">t</span>
                    <span style="--i:7">e</span>
                    <span style="--i:8">r</span>
                    <span style="--i:9"></span>
                    <span style="--i:10">R</span>
                    <span style="--i:11">e</span>
                    <span style="--i:12">s</span>
                    <span style="--i:13">t</span>
                    <span style="--i:14">a</span>
                    <span style="--i:15">u</span>
                    <span style="--i:16">r</span>
                    <span style="--i:17">a</span>
                    <span style="--i:18">n</span>
                    <span style="--i:19">t</span>
                </div>
                <!-- fireworks effect -->
                <div class="pyro">
                    <div class="before"></div>
                    <div class="after"></div>
                </div>
              <!-- Register Restaurant-->
              <!--res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time-->
                <div class="contacts12-main ">
                    <form action="registerRestaurant" method="post" class="main-input" enctype="multipart/form-data">
                    <sec:csrfInput />
                      <input type="text" class="yejin" placeholder="Restaurant Name" name="resName" id="w3lName" required="">
                      <input type="text" class="yejin" placeholder="Restaurant Phone number" name="resTel"  id="w3lName" required="">
                      <select name="resLoc" class="yejin_ResSearch yejin" id="exampleFormControlSelect1">
                                <option>Location</option>
                                <option value="서울">서울</option>
                                <option>경기</option>
                                <option>강원</option>
                                <option>부산</option>
                                <option>전라도</option>
                                <option>제주도</option>
                            </select>
                       <input type="text" placeholder="Detail Location" name="resDetailloc"  class="yejin"id="w3lName" required="">
                      <select name="foodType" class="yejin_ResSearch yejin" id="exampleFormControlSelect1">
                                <option>Food Type</option>
                                <option>한식</option>
                                <option>중식</option>
                                <option>일식</option>
                                <option>양식</option>	
                                <option>아시안</option>
                                <option>디저트</option>
                            </select>
                      <div class="top-inputs d-grid">
                        <input type="text" placeholder="Opening time" name="startTime" id="w3lName" required="">
                        <input type="text" placeholder="Closing time" name="endTime" id="w3lName" required="">
                      </div>
                      <!-- <input type="file" name="file" placeholder="Restaurant Image"> -->
                      <input id="filename" name="restaurantImage"  placeholder="Restaurant Image" type="file" /> 
                      <textarea placeholder="Restaurant Infomation" name="resInfo" id="w3lMessage" required=""></textarea>
                      <button type="submit" class="btn btn-style">Register Now</button>
                    </form>
                </div>
              <!--Register Restaurant-->
            </div>
        </div>
    </section>
    <!-- Js scripts -->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fa fa-level-up" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- //move top -->

    <!-- common jquery plugin -->
    <script src="assets/js/jquerys-3.3.1.min.js"></script>
    <!-- //common jquery plugin -->

    <!-- theme switch js (light and dark)-->
    <script src="assets/js/theme-change.js"></script>
    <script>
        function autoType(elementClass, typingSpeed) {
            var thhis = $(elementClass);
            thhis.css({
                "position": "relative",
                "display": "inline-block"
            });
            thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
            thhis = thhis.find(".text-js");
            var text = thhis.text().trim().split('');
            var amntOfChars = text.length;
            var newString = "";
            thhis.text("|");
            setTimeout(function () {
                thhis.css("opacity", 1);
                thhis.prev().removeAttr("style");
                thhis.text("");
                for (var i = 0; i < amntOfChars; i++) {
                    (function (i, char) {
                        setTimeout(function () {
                            newString += char;
                            thhis.text(newString);
                        }, i * typingSpeed);
                    })(i + 1, text[i]);
                }
            }, 1500);
        }

        $(document).ready(function () {
            // Now to start autoTyping just call the autoType function with the
            // class of outer div
            // The second paramter is the speed between each letter is typed.
            autoType(".type-js", 200);
        });
    </script>
    <!-- //theme switch js (light and dark)-->

    <!-- MENU-JS -->
    <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!-- //MENU-JS -->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!--bootstrap-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap-->
    <!-- //Js scripts -->
