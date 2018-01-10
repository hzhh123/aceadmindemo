<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>jQuery WeUI</title>
    <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<link rel="stylesheet" href="/static/mobile/webui/dist/lib/weui.min.css">
<link rel="stylesheet" href="/static/mobile/webui/dist/css/jquery-weui.css">
<link rel="stylesheet" href="/static/mobile/webui/demos/css/demos.css">

  </head>

  <body ontouchstart>
    <div class="weui-tab">
      <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
          <h1>页面一</h1>
        </div>
        <div id="tab2" class="weui-tab__bd-item">
          <h1>页面二</h1>
        </div>
        <div id="tab3" class="weui-tab__bd-item">
          <h1>页面三</h1>
        </div>
        <div id="tab4" class="weui-tab__bd-item">
          <h1>页面四</h1>
        </div>
      </div>

      <div class="weui-tabbar">
        <a href="#tab1" class="weui-tabbar__item weui-bar__item--on">
          <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
          <div class="weui-tabbar__icon">
            <img src="/static/mobile/webui/demos/images/icon_nav_button.png" alt="">
          </div>
          <p class="weui-tabbar__label">微信</p>
        </a>
        <a href="#tab2" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/static/mobile/webui/demos/images/icon_nav_msg.png" alt="">
          </div>
          <p class="weui-tabbar__label">通讯录</p>
        </a>
        <a href="#tab3" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/static/mobile/webui/demos/images/icon_nav_article.png" alt="">
          </div>
          <p class="weui-tabbar__label">发现</p>
        </a>
        <a href="#tab4" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/static/mobile/webui/demos/images/icon_nav_cell.png" alt="">
          </div>
          <p class="weui-tabbar__label">我</p>
        </a>
      </div>
    </div>

    <script src="/static/mobile/webui/dist/lib/jquery-2.1.4.js"></script>
<script src="/static/mobile/webui/dist/lib/fastclick.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>
<script src="/static/mobile/webui/dist/js/jquery-weui.js"></script>

    <script>
      $("#a").select({
        title: "选择职业",
        items: ["法官", "医生", "猎人", "学生", "记者", "其他"]
      });
    </script>
  </body>
</html>
