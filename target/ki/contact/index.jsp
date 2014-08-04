<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/header.jsp"%>


  
	<div class="content contact clearfix">

		<section class="main nopad-b">
			<div class="row">
				<div id="text-main" class="col-5" style="visibility: visible; right: 0%; opacity: 1;">
					<h1>联系我</h1>
					<p class="intro">发送邮件到zpy@98ki.com，或直接在下面表格处发送邮件即可联系我。</p>
					<p >另：如需绑定xx@98ki.com邮箱名到QQ邮箱，请发送需要的名称和联系方式给我。</p>
					
				
				</div>
				<div id="img-main" class="col-7 align-c" style="visibility: visible; left: 0%; opacity: 1;">
					<img id="navi" class="major" src="/files/images/zpy2.jpg" alt="find zpy here" style="opacity: 1;">
			</div>

		</section>

		<section id="content-detail" class="dark" style="opacity: 1; top: 0px;">
			<div class="row">

				<div class="col-12">
					<h2>Send me an email</h2>
				</div>
				
				<div class="wpcf7" id="wpcf7-f16-t1-o1">					
<form action="/SendMail" method="post" class="wpcf7-form">
<div style="display: none;">
<input type="hidden" name="_wpcf7" value="16">
<input type="hidden" name="_wpcf7_version" value="3.2.1">
<input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f16-t1-o1">
<input type="hidden" name="_wpnonce" value="623b2337de">
</div>
<div class="col-6">
<p>Your name:<br>
<span class="wpcf7-form-control-wrap your-name"><input type="text" name="your-name" value="" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required name" size="40"></span></p>
<p>Your email:<br>
<span class="wpcf7-form-control-wrap your-email"><input type="text" name="your-email" value="" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email email" size="40"></span></p>
</div>
<div class="col-6 nomargin clearfix">
<p>Your message:<br>
<span class="wpcf7-form-control-wrap your-message"><textarea name="your-message" class="wpcf7-form-control  wpcf7-textarea wpcf7-validates-as-required message" cols="40" rows="10"></textarea></span></p>
<p class="clearfix"><input type="submit" value="Send your email" class="wpcf7-form-control  wpcf7-submit submit"></p>
</div>
<div class="wpcf7-response-output wpcf7-display-none"></div></form></div>				
			</div>
		</section>

	</div><!-- / content -->


<%@include file="/footer.jsp"%>