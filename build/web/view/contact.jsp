<%-- 
    Document   : contact
    Created on : Mar 6, 2024, 2:39:17 PM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <title>Contact Form 01</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,700" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/contact.css">
        <script nonce="fc0ff2d0-ba6d-43f7-9fce-525ff32e9b6a">try{(function(w, d){!function(ct, cu, cv, cw){ct[cv] = ct[cv] || {}; ct[cv].executed = []; ct.zaraz = {deferred:[], listeners:[]}; ct.zaraz.q = []; ct.zaraz._f = function(cx){return async function(){var cy = Array.prototype.slice.call(arguments); ct.zaraz.q.push({m:cx, a:cy})}}; for (const cz of["track", "set", "debug"])ct.zaraz[cz] = ct.zaraz._f(cz); ct.zaraz.init = () => {var cA = cu.getElementsByTagName(cw)[0], cB = cu.createElement(cw), cC = cu.getElementsByTagName("title")[0]; cC && (ct[cv].t = cu.getElementsByTagName("title")[0].text); ct[cv].x = Math.random(); ct[cv].w = ct.screen.width; ct[cv].h = ct.screen.height; ct[cv].j = ct.innerHeight; ct[cv].e = ct.innerWidth; ct[cv].l = ct.location.href; ct[cv].r = cu.referrer; ct[cv].k = ct.screen.colorDepth; ct[cv].n = cu.characterSet; ct[cv].o = (new Date).getTimezoneOffset(); if (ct.dataLayer)for (const cG of Object.entries(Object.entries(dataLayer).reduce(((cH, cI) => ({...cH[1], ...cI[1]})), {})))zaraz.set(cG[0], cG[1], {scope:"page"}); ct[cv].q = []; for (; ct.zaraz.q.length; ){const cJ = ct.zaraz.q.shift(); ct[cv].q.push(cJ)}cB.defer = !0; for (const cK of[localStorage, sessionStorage])Object.keys(cK || {}).filter((cM => cM.startsWith("_zaraz_"))).forEach((cL => {try{ct[cv]["z_" + cL.slice(7)] = JSON.parse(cK.getItem(cL))} catch {ct[cv]["z_" + cL.slice(7)] = cK.getItem(cL)}})); cB.referrerPolicy = "origin"; cB.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(ct[cv]))); cA.parentNode.insertBefore(cB, cA)}; ["complete", "interactive"].includes(cu.readyState)?zaraz.init():ct.addEventListener("DOMContentLoaded", zaraz.init)}(w, d, "zarazData", "script"); })(window, document)} catch (e){throw fetch("/cdn-cgi/zaraz/t"), e; };</script></head>
    <body>
        <%@include file="common/header.jsp" %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-md-12">
                        <div class="wrapper">
                            <div class="row no-gutters">
                                <div class="col-md-7 d-flex align-items-stretch">
                                    <div class="contact-wrap w-100 p-md-5 p-4">
                                        <h3 class="mb-4">Get in touch</h3>
                                        <div id="form-message-warning" class="mb-4"></div>
                                        <div id="form-message-success" class="mb-4">
                                            Your message was sent, thank you!
                                        </div>
                                        <form method="POST" id="contactForm" action="contact" name="contactForm">
                                            <div class="row">      
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <textarea name="message" class="form-control" id="message" cols="30" rows="7" placeholder="Message"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="submit" value="Send Message" class="btn btn-primary">
                                                        <div class="submitting"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-5 d-flex align-items-stretch">
                                    <div class="info-wrap bg-primary w-100 p-lg-5 p-4">
                                        <h3 class="mb-4 mt-md-4">Contact us</h3>
                                        <div class="dbox w-100 d-flex align-items-start">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-map-marker"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-phone"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-paper-plane"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Email:</span> <a href="/cdn-cgi/l/email-protection#aac3c4ccc5ead3c5dfd8d9c3decf84c9c5c7"><span class="__cf_email__" data-cfemail="573e393138172e382225243e23327934383a">[email&#160;protected]</span></a></p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-globe"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Website</span> <a href="#">yoursite.com</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script data-cfasync="false" src="js/contactemail.js"></script><script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validate.js"></script>
        <script src="js/main.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"86009b46bf100997","b":1,"version":"2024.2.4","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
        <%@include file="common/footer.jsp" %>
    </body>
</html>

