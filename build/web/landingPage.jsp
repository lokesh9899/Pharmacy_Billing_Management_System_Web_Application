<%-- 
    Document   : signup
    Created on : 24-Feb-2023, 11:20:34 am
    Author     : chandu
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>MedEasy - Pharmacy Store</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="css/modalStyle.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- =======================================================
        * Template Name: Day - v4.10.0
        * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body id="body">

        <!-- ======= Top Bar ======= -->
        <section id="topbar" class="d-flex align-items-center" style="background-color: white;">
            <div class="container d-flex justify-content-center justify-content-md-between">
                <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-envelope-fill"></i><a href="mailto:contact@example.com" style="color: black;">info.medeasy2023@gmail.com</a>
                    <i class="bi bi-phone-fill phone-icon"></i> <span style="color: black;">+91 934 3231 325</span>
                </div>
                <div class="social-links d-none d-md-block">
                    <a href="#" class="twitter"><i class="bi bi-twitter" style="color: black;"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook" style="color: black;"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram" style="color: black;"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin" style="color: black;"></i></a>
                </div>
            </div>
        </section>

        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center" style="background-color: #1E90FF;">
            <div class="container d-flex align-items-center justify-content-between">

                <h1 class="logo"><a href="landingPage.jsp">MedEasy</a></h1>

                <nav id="navbar" class="navbar" >
                    <ul>
                        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                        <li><a class="nav-link scrollto" href="#about">About</a></li>
                        <li><a class="nav-link scrollto" href="#services">Features</a></li>
                        <li><a class="nav-link scrollto" href="#team">Reviews</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
                    </ul>
                    <button class="btn btn-primary border rounded m-3 my-sm-0" data-toggle="modal" data-target="#exampleModalCenter" id="login-btn">LOGIN</button>

                    <!-- Modal start -->

                    <div class="modal fade" id="exampleModalCenter" class =" rounded bg-white shadow p-5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">


                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">


                                <div class="modal-body" style="background-color: #e0feff">

                                    <!--BODY-->


                                    <form class="rounded bg-white shadow p-5 " action="Login" method="POST">
                                        <div class="register-left text-center">
                                            <img src="images/clipart1192900.png" alt="xx"/> 
                                        </div>
                                        <h3 class="text-dark fw-bolder fs-4 mb-2 text-center">Sign In to MedEasy</h3>
                                        <div class="fw-normal text-muted mb-4 text-center">
                                            New Here? <a href="signup.jsp" class="text-primary fw-bold text-decoration-none" id="signupstyle">Create an Account</a>
                                        </div>
                                        <c:if test="${not empty LoginError}">
                                            <div class="alert alert-warning alert-dismissible fade show w-100" role="alert">
                                                <c:out value="${LoginError}"/>
                                                <c:remove var="LoginError" scope="session" />
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="emailId" name="emailId" placeholder="userName@gmail.com" required>
                                            <label for="emailId">Email address</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="password" class="form-control" minlength="8" id="password" name="password" placeholder="Password" required>
                                            <label for="password">Password</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100 my-4"  id="submit_btn">LOG IN</button>
                                    </form>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <!-- Modal end -->
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container position-relative" data-aos="fade-up" data-aos-delay="500">
                <h1>Welcome to MedEasy</h1>
                <h2>We are team of talented workers to get your <br>medicines on time</h2>
                <a href="signup.jsp" class="btn-get-started scrollto">Join us</a>
            </div>
        </section><!-- End Hero -->

        <main id="main">


            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
                            <img src="assets/img/worker.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right">
                            <h3>Why choose us?</h3>
                            <p class="fst-italic">
                                We have one of the best teams to get your medicine on time. Our members excel in  
                            </p>
                            <ul>
                                <li><i class="bi bi-check-circle"></i> Communication - we will ask and try to know your need.</li>
                                <li><i class="bi bi-check-circle"></i> Teamwork - we will work together to meet your needs quickly.</li>
                                <li><i class="bi bi-check-circle"></i> Knowledge - Our team consists of great minds for your help.</li>
                                <li><i class="bi bi-check-circle"></i> Experience - We have been serving for over 32 years.</li>
                            </ul>
                            <p>
                                MedEasy  is not only limited to online pharmacy but offers an 
                                extended product range with a huge selection of medical devices, 
                                personal care products, baby care products, health food and drinks, 
                                sexual wellness products, ayurvedic, herbal and natural products.
                            </p>
                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->

            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us">
                <div class="container">

                    <div class="row">

                        <div class="col-lg-4" data-aos="fade-up">
                            <div class="box">
                                <span>01</span>
                                <h4>Genuine medicine</h4>
                                <p>We have a wide availability of completely genuine medicine in our stores</p>
                            </div>
                        </div>

                        <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="150">
                            <div class="box">
                                <span>02</span>
                                <h4>Large selection of products</h4>
                                <p>You name it and we have it. our store has wide availability of medical items</p>
                            </div>
                        </div>

                        <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
                            <div class="box">
                                <span>03</span>
                                <h4> 24/7 availability</h4>
                                <p>Our team works round the clock to meet your needs. Your satisfaction is our priority</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Why Us Section -->

            <!-- ======= Clients Section ======= -->
            <section id="clients" class="clients">
                <div class="container" data-aos="zoom-in">

                    <div class="row d-flex align-items-center">

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-1.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-2.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-3.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-4.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-5.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img src="assets/img/clients/client-6.png" class="img-fluid" alt="">
                        </div>

                    </div>

                </div>
            </section><!-- End Clients Section -->

            <!-- ======= Services Section ======= -->
            <section id="services" class="services">
                <div class="container">

                    <div class="section-title">
                        <span>Features</span>
                        <h2>features</h2>
                        <p>These are some of the achievements and qualities we have earned and provide</p>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up">
                            <div class="icon-box">
                                <div class="icon"><i class='bx bxs-discount bx-tada'></i></div>
                                <h4><a href="">Upto 30% discount</a></h4>
                                <p>We always have discounts on all of our products which makes it affordable for all customers</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="fade-up" data-aos-delay="150">
                            <div class="icon-box">
                                <div class="icon"><i class='bx bx-party'></i></div>
                                <h4><a href="">9900+ Unique items sold</a></h4>
                                <p>We have serviced a lot of customers and were able to sell over 9900 unique items in last 3 months</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
                            <div class="icon-box">
                                <div class="icon"><i class='bx bx-location-plus'></i></div>
                                <h4><a href="">19500+ pincodes serviced</a></h4>
                                <p>Our delivery team has worked round the clock to achieve this in past 3 months.</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="450">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-world"></i></div>
                                <h4><a href="">Over 32 years service</a></h4>
                                <p>We have just celebrated giving over 32 years of continuous service to our valuable customers</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="600">
                            <div class="icon-box">
                                <div class="icon"><i class='bx bx-plus-medical'></i></div>
                                <h4><a href="">Doctor availability</a></h4>
                                <p>We have experienced doctors in the store for any medical check-up or suggestion</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="750">
                            <div class="icon-box">
                                <div class="icon"><i class='bx bx-injection' ></i></div>
                                <h4><a href="">Free BP & Sugar test</a></h4>
                                <p>We provide free BP and Sugar testing facilities to all of our customers in the store</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Services Section -->

            <!-- ======= Team Section ======= -->
            <section id="team" class="team">
                <div class="container">

                    <div class="section-title">
                        <span>Reviews</span>
                        <h2>Reviews</h2>
                        <p>Here is what our lovely customers say about us</p>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
                            <div class="member">
                                <img src="assets/img/team/team-1.jpg" alt="">
                                <h4>Dr. Punit Rao</h4>
                                <span>Chief Doctor - Amri Hospitals</span>
                                <p>
                                    "It was always difficult to suggest a pharmacy shop to my patients but MedEasy made it easy! My patients always visit here."
                                </p>
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="bi bi-instagram"></i></a>
                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
                            <div class="member">
                                <img src="assets/img/team/team-2.jpg" alt="">
                                <h4>Sarah Jhinson</h4>
                                <span>House wife</span>
                                <p>
                                    "During and after my pregnancy, MedEasy has helped me get all the essential supplies on time. They have always been there at the time of need."
                                </p>
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="bi bi-instagram"></i></a>
                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
                            <div class="member">
                                <img src="assets/img/team/team-3.jpg" alt="">
                                <h4>Vishal Kumar</h4>
                                <span>CTO - PharmaCo.</span>
                                <p>
                                    "MedEasy is my go to pharmacy shop. They always have every medicine in stock. This is the best medical store!"
                                </p>
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="bi bi-instagram"></i></a>
                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Team Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <span>Contact</span>
                        <h2>Contact</h2>
                        <p>Reach your nearest MedEasy store soon</p>
                    </div>

                    <div class="row" data-aos="fade-up">
                        <div class="col-lg-6">
                            <div class="info-box mb-4">
                                <i class="bx bx-map"></i>
                                <h3>Our Address</h3>
                                <p>9A Lalit Mitra Lane, Kolkata-700004</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="info-box  mb-4">
                                <i class="bx bx-envelope"></i>
                                <h3>Email Us</h3>
                                <p>info.medeasy2023@gmail.com</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="info-box  mb-4">
                                <i class="bx bx-phone-call"></i>
                                <h3>Call Us</h3>
                                <p>+91 934 3231 325</p>
                            </div>
                        </div>

                    </div>

                    <div class="row" data-aos="fade-up">

                        <div class="col-lg-6 ">
                            <iframe class="mb-4 mb-lg-0" src="https://maps.google.com/maps?q=exavalu&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
                        </div>

                        <div class="col-lg-6">
                            <form action="https://formspree.io/f/xknazbjb" method="POST" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                                </div>
                                <div class="form-group mt-3">
                                    <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="text-center"><button type="submit">Send Message</button></div>
                            </form>
                        </div>

                    </div>

                </div>
            </section><!-- End Contact Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 col-md-6">
                            <div class="footer-info">
                                <h3>MEDEASY</h3>
                                <p>
                                    9A Lalit Mitra Lane, <br>
                                    Kolkata-700004, West Bengal,India<br><br>
                                    <strong>Phone:</strong> +91 934 3231 325<br>
                                    <strong>Email:</strong> info.medeasy2023@gmail.com<br>
                                </p>
                                <div class="social-links mt-3">
                                    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                    <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 col-md-6 footer-newsletter">
                            <h4>Our Newsletter</h4>
                            <p>Subscribe to our newsletter to get updates</p>
                            <form action="" method="post">
                                <input type="email" name="email"><input type="submit" value="Subscribe">
                            </form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>MedEasy</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/day-multipurpose-html-template-for-free/ -->
                    Designed by <a href="https://bootstrapmade.com/">Group-A</a>
                </div>
            </div>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

        <!-- JS for modal -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="js/holder.min.js"></script>

    </body>

</html>