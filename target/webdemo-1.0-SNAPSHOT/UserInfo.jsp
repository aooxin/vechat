<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/15
  Time: 下午10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
  <script src="js/jquery-3.6.0.js"></script>
  <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">$(document).ready(function() {$("#Integrity").tooltip('hide');})</script>

  <style>
    body{
      font-family: 'Exo 2', sans-serif;
    }
  </style>
</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <a href="http://www.maheshbhagat.com" target="_blank" class="navbar-brand">MaheshBhagat</a>

      <button class="navbar-toggle" data-toggle="collapse" data-target="#navigationMenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="navigationMenu">
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
        <li class="dropdown">
          <a href="#" data-toggle="dropdown">Social Media <b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li><a href="https://www.twitter.com/mymahesh11">Twitter</a></li>
            <li><a href="https://www.facebook.com/mymahesh11">Facebook</a></li>
            <li><a href="https://plus.google.com/u/0/+MaheshBhagat">Google+</a></li>
            <li><a href="https://in.linkedin.com/in/mymahesh11">Linkedin</a></li>
            <li class="divider"></li>
            <li><a href="http://instagram.com/mymahesh11">Instagram</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</div>
<div class="container">
  <div class="jumbotron">
    <div class="row">
      <div class="col-md-3 col-md-offset-1 text-center">
        <div class="panel panel-default">
          <div class="panel-body">
            <img src="http://maheshbhagat.com/images/author.jpg" class="img-thumbnail" />
          </div>
        </div>
      </div>
      <div class="col-md-8">
        <h1 class="welcomeText heading">} Mahesh Bhagat {</h1>
      </div>
      <h3 class="welcomeText headingInfo">the Web <span class="glyphicon glyphicon-globe"></span> & Graphics <span class="glyphicon glyphicon-picture"></span> Designer</h3>
    </div>
  </div>
</div>

<div class="container" >
  <h3>Who Am I?</h3>
  <div class="jumbotron">
    <div class="row">
      <div class="col-md-8" align="justify">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">What I think about ME<h3 class="panel-title"></h3></h3>
          </div>
          <div class="panel-body">
            <h3 class="font21">
              &nbsp; &nbsp; &nbsp;I am passionate about Web Design, Graphic Design and Programming. Calling myself a Front-End Developer is what my Goal.
            </h3>
            <h3 class="font21">
              &nbsp; &nbsp; &nbsp;Doing graduation in BSc in Information Technology, Vartak College, Vasai (w). I daily dealing with web technologies like <font color="#da0e0e">HTML5</font> & <font color="#16b7da">CSS3</font>  to make vision clear.
            </h3>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">@mymahesh11 on twitter</h3>
          </div>
          <div class="panel-body">
            <a class="twitter-timeline" data-dnt="true" href="https://twitter.com/mymahesh11" data-widget-id="306346770307354624">Tweets by @mymahesh11</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<div class="container">
  <h3> <span class="glyphicon glyphicon-wrench"></span> Technical Skills</h3>
  <div class="jumbotron">
    <div class="row">
      <div class="col-lg-6">
        <div class="panel panel-default">
          <div class="panel-heading text-center">
            <div class="panel-title">Programming Language</div>
          </div>
          <div class="panel-body text-center">
            <button class="btn btn-primary">C/C++</button>
            <button class="btn btn-primary">Visual C#</button>
            <button class="btn btn-primary">Java</button>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="panel panel-default">
          <div class="panel-heading text-center">
            <div class="panel-title">Markup Languages</div>
          </div>
          <div class="panel-body text-center">
            <button class="btn btn-primary">HTML5</button>
            <button class="btn btn-primary">CSS3</button>
            <button class="btn btn-primary">Bootstrap 3.0</button>
            <button class="btn btn-primary">XML</button>
            <button class="btn btn-primary">jQuery</button>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="panel panel-default">
          <div class="panel-heading text-center">
            <div class="panel-title">Web Technologies</div>
          </div>
          <div class="panel-body text-center">
            <button class="btn btn-primary">PHP</button>
            <button class="btn btn-primary">Servlet</button>
            <button class="btn btn-primary">JSP</button>
            <button class="btn btn-primary">ASP.NET with Visual C#</button>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="panel panel-default">
          <div class="panel-heading text-center">
            <div class="panel-title">RDBMS</div>
          </div>
          <div class="panel-body text-center">
            <button class="btn btn-primary">MySQL</button>
            <button class="btn btn-primary">Oracle</button>
            <button class="btn btn-primary">MS SQL Server 2005/2008 R2</button>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading text-center">
            <div class="panel-title">IDE's I go through</div>
          </div>
          <div class="panel-body text-center">
            <button class="btn btn-primary">NetBeans 7.2</button>
            <button class="btn btn-primary">Adobe Dreamweaver CS6</button>
            <button class="btn btn-primary">Microsoft Visual Studio 2010/2012/2013</button>
            <button class="btn btn-primary">Turbo C 3.0</button>
            <button class="btn btn-primary">Eclipse</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <h3> <span class="glyphicon glyphicon-paperclip"></span> Projects I Completed</h3>
  <div class="jumbotron">
    <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">Vartak Integrity Website</div>
        <div class="panel-body">
          <div class="col-lg-4">
            <a href="http://vartakintegrity.com/" target="_blank"><img src="http://2014.vartakintegrity.com/images/Logo/logo.png" class="img-thumbnail" /></a>
          </div>
          <div class="col-lg-8">
            <h3 class="">Vartak <button class="btn btn-lg btn-default" data-toggle="tooltip" data-placement="top" title="Integrity 2014 - Tribute to the Legends" id = "Integrity">Integrity 2014</button> Website in <button class="btn btn-lg btn-default">PHP</button> & <button class="btn btn-lg btn-default">MySQL</button></h3>
            <div align="justify">Integrity is one of the most awaited annual technical fest held by Information Technology and Computer Science of Vidyavardhini's A.V. College of Arts, K.M.College of Commerce & E.S.Andrades College of Science.</div>
            <a class="btn btn-primary pull-right" target="_blank" href="http://2014.vartakintegrity.com/">Visit Project</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<footer class="nav navbar-default">
  <div class="container">
    <a href="http://www.maheshbhagat.com/" target="_blank" class="navbar-brand">MaheshBhagat &copy; 2014</a>
    <div class="collapse navbar-collapse cdr" id="navigationMenu">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Terms of Use</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Feedback</a></li>
        <li><a href="#">Advertisement</a></li>
      </ul>
    </div>
  </div>
</footer>

</body>

</html>