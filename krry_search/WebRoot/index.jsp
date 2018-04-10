<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
   <head>
      <meta charset="UTF-8">
	  <meta name="Keywords" content="百度">
	  <meta name="Description" content="">
	  <title>百度搜索自动补全系统 --Krry</title>
	  <style type="text/css">
	     *{margin:0;padding:0;}
		 body{font-size:12px;font-family:"微软雅黑";background:url("images/1.jpg");
		      background-size:cover;color:#666;}
	     .logo .img{margin-left:24px;margin-top:-88px;position:absolute;}
		 .face{width:938px;height:280px;background:rgba(255,255,255,.6);position:absolute;
		       top:0;left:200px;display:none;}
		 .face ul{margin-top:10px;}
		 .face ul li{width:130px;height:81px;list-style:none;float:left;
		             margin:2px;cursor:pointer;}
		 .face .big{width:264px;height:166px;}
		 .face .sma{position:relative;top:-85px;}
		 .btn{cursor:pointer;font-size:24px;margin-top:10px;margin-left:20px;}
		/*百度 start*/
		 .Bai{width:641px;height:293.375px;margin:100px auto;}
		 .Bai h1{text-align:center;}
		 .Bai .Bai_text{width:536px;height:40px;float:left; outline:none;
		                border:0;text-indent:10px;font-size:16px;}
		 .Bai .Bai_btn{width:104px;height:40px;border:0;outline:none;font-size:16px;
		               transition:1s;color:#fff;background:#118cfb;}
		 .Bai .Bai_btn:hover{color:#000;background:#ff9900;cursor:pointer;transition:1s;
		                     transform:rotate(360deg);}
		  .uu ul li{background:#fff;width:500px;height:30px;text-indent:1em;line-height:30px;border:1px solid #ccc;border-top:0;list-style:none;}
		  .uu ul li a{text-decoration:none;color:#000;display:block;}
		  .uu ul li:hover{background:#f90;}
		/*百度 end*/
	  </style>
	  <link rel="stylesheet" href="css/animate.css"/>
  </head>
	  <body>
	     <div class="logo">
		     <img src="images/42.png" alt="Krry_logo" width="150px" height="80px" class="img"/>
		 </div>
		 <div class="face">
		    <ul>
			  <li class="big"><img src="images/1.jpg" width="264" height="166" alt="美女"/></li>
			  <li><img src="images/2.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/3.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/4.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/5.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/6.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/7.jpg" width="130" height="81" alt="风景"/></li>
			  <li class="big"><img src="images/8.jpg" width="264" height="166" alt="风景"/></li>
			  <li><img src="images/9.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/10.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/11.jpg" width="130" height="81" alt="风景"/></li>
			  <li><img src="images/12.jpg" width="130" height="81" alt="风景"/></li>
			  <li class="sma"><img src="images/13.jpg" width="130" height="81" alt="风景"/></li>
			  <li class="sma"><img src="images/14.jpg" width="130" height="81" alt="风景"/></li>
			  <li class="sma"><img src="images/15.jpg" width="130" height="81" alt="风景"/></li>
			</ul>
		 </div>
		 <div class="btn">换肤</div>
	    <!--百度 start-->
	     <div class="Bai">
			 <h1>
			    <img src="images/logo.png" alt="百度logo" width="270" height="129"/>
			 </h1>
			  <input type="text" name="search" class="Bai_text" id="message"/>
			  <input type="submit" value="百度一下" id="bb" class="Bai_btn" target="_blank" onclick="baidu();">
			  <div class="uu" id="uu">
				<ul>
				</ul>
			 </div>
		 </div>
		 <!--百度 end-->

		 <script src="js/jquery-1.10.2.min.js"></script>
		 <script type="text/javascript">
		      function baidu(){
				var keywords = document.getElementById("message").value;//获取ID为message的内容
			 //location.href="http://www.baidu.com/s?wd="+keywords;//当前页面跳转到该路径的网页
			    window.open("http://www.baidu.com/s?wd="+keywords);
			  }
			  $(function(){
			     $(".face ul li").click(function(){
				     var _src = $(this).find("img").attr("src");//获得当前点击图片的路径
				//$(this).css({"transform":"rotate(360deg)","transition":"0.3s"}).siblings().removeAttr("style");
				     $(this).addClass("animated rotateIn").siblings().removeClass("animated rotateIn");
					 var i = $(this).index()+1;
					 $("body").css({
					    "background":"url('images/"+i+".jpg') no-repeat","background-size":"cover"
					 });
				 });
				 $(".btn").click(function(){
				     $(".face").slideToggle(1000);
				 });
			  });

				var inp = document.getElementById("message");
				var btn = document.getElementById("bb");
				var uu = document.getElementById("uu");

				inp.onkeyup = function(){//键盘事件
					var val = this.value;
					var os = document.createElement("script");
					os.src="https://sp0.baidu.com/5a1Fazu8AA54nxGko9WTAnF6hhy/su?wd="+val+"&cb=Jery";
					document.body.appendChild(os);
					document.body.removeChild(os);
				};

				function Jery(myJson){ //实现上面生成js里面的调用Jery方法
					var date = myJson.s; //获取key值
					var str = "<ul>";
					for(var i = 0;i < date.length;i++){
						str += "<li><a href='https://www.baidu.com/s?wd="+date[i]+"' target='_blank'>"+date[i]+"</a></li>";
					}
					str += "</ul>";
					uu.innerHTML = str;
				}
		 </script>
	 　　
	  </body>
</html>