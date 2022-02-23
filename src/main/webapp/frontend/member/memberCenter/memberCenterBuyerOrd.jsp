<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員訂單需求單</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	* {
  box-sizing: border-box;
}
html,
body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  text-decoration: none;
}
body {
  background-color: #ecb88a;
}
.container {
  width: 90%;
  height: 100%;
  min-width: 768px;
  font-size: 1.2rem;
}
main {
  background-color: #ead6cd;
}
footer {
  background-color: #fecba1;
}

.nav-link {
  /* 去除超連結的線 */
  color: #666666;
}
.nav-item > a,
a {
  /*  去除連結線 */
  text-decoration: none;
  color: #373c3f;
}

.nav-item > a:hover,
a:hover {
  color: #31a0b7;
}

/************* test ************/
header {
  border-bottom: 1px solid #c3894f;
}
.login-form {
  flex-grow: 1;
}
.sign-in-image-div {
  text-align: center;
  flex-basis: 50%; /*寫在img無效*/
}
.sign-in-image {
  width: 80%;
  margin: 0 auto;
}

/**  right   ***/
#sideBarUl > .li-item {
  margin-top: 1em;
  background-color: #bccfc9;
}

.user-link-group {
  line-height: 2.2em;
}

.part-menu > ul {
/*   outline: red 1px solid; */
}
.part-menu > ul > li > ul > li > a {
/*   outline: red 3px solid; */
}
.right-conent {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.right-conent > article {
  /*   margin: 1rem auto; */
  background-color: #fff;
}

.shiny {
  background-color: pink;
}
.gray {
  background-color: gray;
}
	
</style>
</head>
<body>
<div id="ezhome">
<header>
    <div class="container">
      <div class="navbar d-flex flex-nowrap py-3">
        <a href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">
          <img src="<%= request.getContextPath()%>/images/cmn/index/EASYSPACE.png" alt="brand-logo-image" class="brand-logo" style="height:130px">
        </a>
        <div class="function-link d-flex flex-column col-10 bd-highlight">
          <div class="pages-login d-flex flex-row align-items-center col-12 justify-content-between mx-auto">
            <ul class="nav nav-items justify-content-between align-items-center col-9">
              <li class="nav-item">
                <a class="nav-link" role="button" href="#">房屋租賃</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">居家服務</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">二手家電</a>
              </li>
              	<li class="nav-item">	
					<a class="nav-link" href="<%= request.getContextPath()%>/frontend/member/memberCenter/memberCenter.jsp">會員中心</a>
				</li>
            </ul>
            <div class="nav-menu-shopping-bag d-flex col-3 justify-content-sm-end  align-items-center">
              <a href="#"><i class="bi bi-cart3 mx-2" style="font-size: 3rem; color: #8C4E37;"></i></a>
              <a class="btn" href="#" role="button" style="background-color: #FD9843">會員登出</a>
            </div>

          </div>
          <form class="form-inline col-12 mx-auto mt-3">
            <div class="input-group">
              <input type="text" name="keyword" class="form-control" id="searchinput" aria-describedby="search-input" placeholder="Search" value="">
              <button type="submit" class="btn btn-primary " id="search-button" style="background-color: #1AA179">開始搜尋</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>

  <main>
    <div id="會員登入" class="section">
      <div class="container">
        <div class="row">
          <!--   左側欄       -->
          <aside class="col-3 left-sidebar">
            <ul id="sideBarUl" class="list-unstyled text-nowrap p-2">
               <li class="li-item active" data-id="0">
                <a class="" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenter.jsp">會員基本資料</a>
              </li>
              <li class="li-item active" data-id="3">
                <a class="" href="<%=request.getContextPath()%>/frontend/chat/index.jsp">聊聊</a>
              </li>
              <li class="li-item active" data-id="4">
                <a class="" href="#">購物車</a>
              </li>
              <li class="li-item active" data-id="1">
                <a class="" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterBuyer.jsp">買家訂單管理</a>
              </li>
              <li class="li-item active" data-id="2">
                <a class="" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterSeller.jsp">賣家管理</a>
              </li>
            </ul>
          </aside>
          <!--   右側欄  會員中心架構  先隱藏   -->
          <div class="col-9 right-content">
            <!--  右側 上方導覽列  -->
            <div class="right-content-menu">
              <div class="part-menu">
                <!--      買家訂單管理           -->
                <ul class="nav navbar">
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">租屋訂單管理</a>
                    <ul class="dropdown-menu text-center">
                      <li><a class="dropdown-item" href="#1" data-id="2111">預約單管理</a></li>
                      <li><a class="dropdown-item" href="#2" data-id="2122">租賃訂單管理</a></li>
                      <li><a class="dropdown-item" href="#3" data-id="213">收藏房源管理</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">二手訂單管理</a>
                    <ul class="dropdown-menu text-center">
                      <li><a class="dropdown-item" href="#4" data-id="221">評價</a></li>
                      <li><a class="dropdown-item" href="#5" data-id="222">檢舉</a></li>
                      <li><a class="dropdown-item" href="#6" data-id="223">完成訂單</a></li>
                      <li><a class="dropdown-item" href="#7" data-id="224">取消訂單</a></li>
                      <li><a class="dropdown-item" href="#8" data-id="225">申請退款</a></li>
                      <li><a class="dropdown-item" href="#9" data-id="226">延遲付款</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">服務案件管理</a>
                    <ul class="dropdown-menu text-center">
                      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterBuyerDmd.jsp" data-id="231">需求單管理</a></li>
                      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterBuyerQuo.jsp" data-id="232">估價單管理</a></li>
                      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterBuyerOrd.jsp" data-id="233">訂單管理</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!--  右側 內容  -->
            <div id="article-list">
            
           <jsp:include page="/frontend/ser_ord/serOrdMem.jsp"></jsp:include>
              <!-- 2111 預約單管理 進行中預約單 -->
            </div>
          </div> 

        </div>
      </div>
    </div>
  </main>

  <footer>
    <section class="ccc website-map pt-5">
      <div class="container">
        <div class="row">
          <div class="footer-company-address col-xs-6 col-sm-3">
            <address class="color-light-20">
              1600 Amphitheatre Parkway
              <br> Mountain View, CA 94043
            </address>
          </div>
          <div class="footer-about-us col-xs-6 col-sm-3">
            <h4 class="my-2">關於我們</h4>
            <ul class="list-unstyled list-light text-light">
              <li>
                <a href="#">品牌故事</a>
              </li>
              <li>
                <a href="#">最新消息</a>
              </li>
              <li>
                <a href="#">連絡我們</a>
              </li>
            </ul>
          </div>
          <br style="clear:both" class="hidden-sm-up">
          <div class="footer-service col-xs-6 col-sm-3">
            <h4 class="my-2">功能服務</h4>
            <ul class="list-unstyled list-light">
              <li>
                <a href="#">空間租賃</a>
              </li>
              <li>
                <a href="#">空間服務</a>
              </li>
              <li>
                <a href="#">二手交易商城</a>
              </li>

            </ul>
          </div>
          <div class="footer-center col-xs-6 col-sm-3">
            <h4 class="my-2">會員中心</h4>
            <ul class="list-unstyled list-light">
              <li>
                <a href="#">會員註冊</a>
              </li>
              <li>
                <a href="#">忘記密碼</a>
              </li>
            </ul>
          </div>
        </div>
        <hr>
        <div class="footer-copyright row f-flex justify-content-between">
          <div class="col-md-8 text-xs-center text-left my-1">
            <p class="mt-1 text-muted"> © Copyright 2021 • All Rights
              Reserved |
              <a class=" " href="#">Disclaimer</a> |
              <a class=" " href="#">Contact</a>
            </p>
          </div>
        </div>
      </div>
    </section>
    <section class="kkkk company-mail pt-3 bg-gray">
      <div class="container">
        <div class="row text-center justify-content-center">
          <div class="col-12 col-md-8 col-lg-7">
            <p class="text-h2">support@website.com</p>
            <p class="text-h3">Fusce dapibus, tellus ac cursus commodo, tortor
              mauris condimentum nibh, ut fermentum massa justo sit amet risus.
            </p>
          </div>
        </div>
      </div>
    </section>
  </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>