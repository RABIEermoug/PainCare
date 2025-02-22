<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Symptoms</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/slicknav.css">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/nice-select.css">
	<link rel="stylesheet" href="assets/css/style.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<!--? Preloader Start -->
	<div id="preloader-active">
		<div class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/loder.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
   <!-- Preloader Start -->
    <header>
        <!--? Header Start -->
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-2 col-lg-2 col-md-1">
                            <div class="logo">
                                <a href="Home"><img src="assets/img/logo/logo-paincare.png" alt="" style="border-radius: 50%; width: 100px;"></a>
                            </div>
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-10 menu-main d-flex align-items-center justify-content-end" style="gap : 120px; font-size: 0;">
                            <div class="menu-main d-flex align-items-center justify-content-center " >
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav> 
                                        <ul id="navigation">
                                            <li><a href="Home">Home</a></li>
                                            <li><a href="#">Endometriosis</a>
	                                             <ul class="submenu" >
	                                                    <li><a href="symptoms.jsp">Symptoms</a></li>
	                                                    <li><a href="causes.jsp">Causes</a></li>
	                                                    <li><a href="diagnosis.jsp">Diagnosis</a></li>
	                                                    <li><a href="Infertility.jsp">Infertility</a></li>
	                                                    <li><a href="adhesions.jsp">Adhesions</a></li>
	                                             </ul>
                                            </li>
                                            <li><a href="article.jsp">News</a></li>                                       
                                            <li><a href="#">Services</a>
	                                              <ul class="submenu">
	                                                    <li><a href="test_endo.jsp">Test</a></li>
	                                                    <li><a href="evolution.jsp">Evolution of pain</a></li>
	                                                    <li><a href="suivi.jsp">Process</a></li>
	                                              </ul>
                                            </li>
						           <li><a href="AllBlogs">Community</a></li>
                                            <li><a href="contact.jsp">Contact</a></li>   
                                             <li>  
												            <a><i class="bi bi-person-lines-fill"></i></a>   
												            <ul class="submenu">
			                                                    <li><a href="Profile"><i class="bi bi-person-circle"></i> edit-Profile</a></li>
			                                                    <li><a href=""><i class="bi bi-bell-fill"></i> Notification</a></li>
			                                                    <li><a href=""><i class="bi bi-calendar-heart"></i> Calendar</a></li>
			                                                    <li><a href=""><i class="bi bi-gear"></i> Setting</a></li>
			                                                    <li><a href="Logout"><i class="bi bi-box-arrow-right"></i> Sign out</a></li>
			                                               </ul>	                  
                                            </li>
                                   </ul>
                                    </nav>
                                </div>
                                 </div>
                                  	<div class="create justify-content-center">
							            <div class="profile-pic">
							                <img src="assets/img/logo/profile-8.jpg" alt="pic 1" />
							            </div>
							            <div class="handle">
							              
							                <p class=""><a href="profile"> ${user.name}</a></p>
							            </div>
							        </div>
                                
                                <style>
                                .create{
    display: flex;
    flex-direction : column;
    align-items: center;
    justify-content : center ;
    gap: 1rem;
    position : relative;
    top: 10px;
}
                                 .profile-pic{
    position: relative;
    overflow: visible;
}

 .profile-pic img{    
 	width: 50px;
    border-radius: 50%;
}
.handle p a{
	color: black;
}


</style>
                           
                        </div>   
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    
	<main>
		<!--? Slider Area Start-->
		<div class="slider-area slider-area2">
			<div class="slider-active dot-style">
				<!-- Slider Single -->
				<div class="single-slider  d-flex align-items-center slider-height2">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-xl-7 col-lg-8 col-md-10 ">
								<div class="hero-wrapper">
									<div class="hero__caption">
										<h1 data-animation="fadeInUp" data-delay=".3s">Symptoms of Endometriosis</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>    
			</div>
		</div>
		<!-- Slider Area End -->
							<!--? Start Align Area -->
								<div class="whole-wrap">
									<div class="container box_1170">
										<div class="section-top-border">
											<h3 class="mb-30"></h3>
											<div class="row">
												<div class="col-md-3">
													<img src="assets/img/elements/d.jpg" alt="" class="img-fluid">
												</div>
												<div class="col-md-9 mt-sm-20">
													
													 <span> 
													 The most common symptom of endometriosis is pelvic pain. The pain often correlates to the menstrual cycle,
													 however a woman with endometriosis may also experience pain at other times during her monthly cycle.
													 </span>
													 <span>
													   For many women, but not everyone, the pain of endometriosis can unfortunately be so severe and debilitating
													   that it impacts on her life so that she may not be able to carry out day to day activities.
													 </span>
													 <span>
													 <h4>Pain may be felt:</h4> <br>
													 <ul>
													     <li>&#9733;  Before/during/after menstruation</li>
													     <li>&#9733;  During ovulation</li>
                                                         <li>&#9733;  In the bowel during menstruation</li>
                                                         <li>&#9733;  When passing urine</li>	
                                                         <li>&#9733;  During or after sexual intercourse</li>		
                                                         <li>&#9733;  In the lower back region</li>	  											  										 
													 </ul><br>
													 <h4>Other symptoms may include:</h4><br>
													 <ul>
													     <li>&#9733;  Diarrhoea or constipation (in particular in connection with menstruation)</li>
													     <li>&#9733;  Abdominal bloating (in particular in connection with menstruation)</li>
                                                         <li>&#9733;  Heavy or irregular bleeding</li>
                                                         <li>&#9733;  Fatigue</li>	                                                    								  										 
													 </ul> <br>
													 
													 <p>
													 The other well known symptom associated with endometriosis is infertility. 
													 It is estimated that 30-40% of women with endometriosis are subfertile.</p>
													 </span>
													 
													
													
													
												</div>
											</div>
										</div>
							    	</div>
			                    </div>
							
								<!-- End Align Area -->
								<!--? About Law Start-->
								<section class="about-low-area mt-100">
									<div class="container">
										<div class="about-cap-wrapper">
											<div class="row">
												<div class="col-xl-5  col-lg-6 col-md-10 offset-xl-1">
													<div class="about-caption mb-50">
														<!-- Section Tittle -->
														<div class="section-tittle mb-35">
															<h2>100% satisfaction guaranteed.</h2>
														</div>
														<p>Almost before we knew it, we had left the ground</p>
														<a href="about.html" class="border-btn">Make an Appointment</a>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<!-- about-img -->
													<div class="about-img">
														<div class="about-font-img">
															<img src="assets/img/gallery/about2.png" alt="">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- About Law End-->
							</main>
							<footer>
								<div class="footer-wrappr section-bg3" data-background="assets/img/gallery/footer-bg.png">
									<div class="footer-area footer-padding ">
										<div class="container">
											<div class="row justify-content-between">
												<div class="col-xl-8 col-lg-8 col-md-6 col-sm-12">
													<div class="single-footer-caption mb-50">
														<!-- logo -->
														<div class="footer-logo mb-25">
															<a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
														</div>
														<d iv class="header-area">
															<div class="main-header main-header2">
																<div class="menu-main d-flex align-items-center justify-content-start">
																	<!-- Main-menu -->
																	<div class="main-menu main-menu2">
																		<nav> 
																			<ul>
																				<li><a href="index.html">Home</a></li>
																				<li><a href="about.html">About</a></li>
																				<li><a href="services.html">Services</a></li>
																				<li><a href="blog.html">Blog</a></li>
																				<li><a href="contact.html">Contact</a></li>
																			</ul>
																		</nav>
																	</div>
																</div>  
															</div>
														</d>
														<!-- social -->
														<div class="footer-social mt-50">
															<a href="#"><i class="fab fa-twitter"></i></a>
															<a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
															<a href="#"><i class="fab fa-pinterest-p"></i></a>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
													<div class="single-footer-caption">
														<div class="footer-tittle mb-50">
															<h4>Subscribe newsletter</h4>
														</div>
														<!-- Form -->
														<div class="footer-form">
															<div id="mc_embed_signup">
																<form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative mail_part" novalidate="true">
																	<input type="email" name="EMAIL" id="newsletter-form-email" placeholder=" Email Address " class="placeholder hide-on-focus" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your email'">
																	<div class="form-icon">
																		<button type="submit" name="submit" id="newsletter-submit" class="email_icon newsletter-submit button-contactForm">
																			Subscribe
																		</button>
																	</div>
																	<div class="mt-10 info"></div>
																</form>
															</div>
														</div>
														<div class="footer-tittle">
															<div class="footer-pera">
																<p>Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium misem ut ipsum.</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- footer-bottom area -->
									<div class="footer-bottom-area">
										<div class="container">
											<div class="footer-border">
												<div class="row">
													<div class="col-xl-10 ">
														<div class="footer-copy-right">
															<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
																Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
																<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</footer>
								<!-- Scroll Up -->
								<div id="back-top" >
									<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
								</div>

								<!-- JS here -->

								<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
								<!-- Jquery, Popper, Bootstrap -->
								<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
								<script src="./assets/js/popper.min.js"></script>
								<script src="./assets/js/bootstrap.min.js"></script>
								<!-- Jquery Mobile Menu -->
								<script src="./assets/js/jquery.slicknav.min.js"></script>

								<!-- Jquery Slick , Owl-Carousel Plugins -->
								<script src="./assets/js/owl.carousel.min.js"></script>
								<script src="./assets/js/slick.min.js"></script>
								<!-- One Page, Animated-HeadLin -->
								<script src="./assets/js/wow.min.js"></script>
								<script src="./assets/js/animated.headline.js"></script>
								<script src="./assets/js/jquery.magnific-popup.js"></script>
								
								<!-- Nice-select, sticky -->
								<script src="./assets/js/jquery.nice-select.min.js"></script>
								<script src="./assets/js/jquery.sticky.js"></script>
								
								<!-- contact js -->
								<script src="./assets/js/contact.js"></script>
								<script src="./assets/js/jquery.form.js"></script>
								<script src="./assets/js/jquery.validate.min.js"></script>
								<script src="./assets/js/mail-script.js"></script>
								<script src="./assets/js/jquery.ajaxchimp.min.js"></script>
								
								<!-- Jquery Plugins, main Jquery -->	
								<script src="./assets/js/plugins.js"></script>
								<script src="./assets/js/main.js"></script>
								
							</body>
							</html>