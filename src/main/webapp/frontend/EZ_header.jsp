<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <title>EASY SPACE</title>

    <meta charset="utf-8">
    <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet"
      href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
    <link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
         <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
      crossorigin="anonymous"></script>

    <!-- Plugins -->
  </head>

  <body>

    <nav class="navbar navbar-light bg-white  navbar-expand-md ">
      <div class="container">
        <div class="col-2 pl-md-0 text-left">
          <a href="<%= request.getContextPath()%>/frontend/EZ_home.jsp">
            <img src="<%= request.getContextPath()%>/images/cmn/index/EASYSPACE.png"height="60" alt="image">
          </a>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
          data-target=".navbar-collapse-1" aria-controls="navbarNav6"
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div
          class="collapse navbar-collapse justify-content-center col-md-8 navbar-collapse-1">
          <ul
          class="nav nav-pills nav-pills-primary justify-content-center mb-5"
          role="tablist">
          <li class="nav-item me-md-4">
            <a class="nav-link nav-icon rounded p-3 shadow-sm active show"
              id="home-tab" data-toggle="tab" href="#home" role="tab"
              aria-controls="home" aria-selected="true">
              <i class=" far fa-gem fa-lg  me-2"></i>
              房屋租賃
            </a>
          </li>
          <li class="nav-item me-md-4">
            <a class="nav-link nav-icon rounded p-3 shadow-sm"
              id="profile-tab" data-toggle="tab" href="#profile"
              role="tab" aria-controls="profile" aria-selected="false">
              <i class="fab fa-html5 fa-lg me-2"></i>
             居家服務 </a>
          </li>
          <li class="nav-item me-md-4">
            <a class="nav-link nav-icon p-3 shadow-sm" id="contact-tab"
              data-toggle="tab" href="#contact" role="tab"
              aria-controls="contact" aria-selected="false">
              <i class="fa fa-suitcase fa-lg me-2"></i>
              二手商城</a>
          </li>
        </ul>
        </div>
        <div
          class="collapse navbar-collapse justify-content-end col-md-2 navbar-collapse-1 pr-md-0">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="btn btn-outline-dark ms-md-3" href="<%= request.getContextPath()%>/frontend/member/login.jsp">Log In →</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <form class="form-noborder">
      <div class="row mb-5 justify-content-center">
        <div class="col-lg-8 col-sm-12 form-group">
          <input class="form-control form-control-lg"
            placeholder="Search keyword" type="text">
        </div>

        <div class="col-lg-3 col-sm-12 form-group">
          <button class="btn btn-primary btn-block w-100 btn-lg"
            type="submit">Search</button>
        </div>
      </div>
    </form>


 


  </body>

</html>