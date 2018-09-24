<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://m.meilipa.com/UserAccount/GoldList -->
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>我的金币</title>
    <meta name="keywords" content="美丽啪网,美丽啪联盟,免费试用,试用网,免费试用网,试用中心,试客,试客网">
    <meta name="description" content="欢迎来免费美丽啪试用网:美丽啪网—是全国领先的免费试用网和试客网,深得试客信赖的免费试用中心网站,是免费试用网和试客网站的首选,美丽啪免费试用网为试客提供最优质和实用的优秀免费试用商品.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/jquery-1.8.3.js.下载"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/Common.js.下载"></script>

    <script>
        var userId=273226;
        (function (doc, win) {
            var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function (first) {
                var clientWidth = docEl.clientWidth;
                
                if (!clientWidth) return;
          
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                
            };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
            recalc();
        })(document, window);
    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/regist.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/jquery.infinitescroll.js.下载"></script>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/mytryout.css">

<style>
    .bar ul li {
        width: 33.33%;
    }

    .bar.zt-menu ul li a {
        height: 1.85rem;
    }
    .sel {
        width: 2rem;
        margin: 0 auto;
        height: 0.15rem;
        margin-top: 1px;
    }

    .billion {
        background: #fff;
        border-bottom: 1px solid #dedede;
        padding: 0.1rem 0.6rem 0.5rem;
    }

        .billion .r {
            float: right;
        }

        .billion .l {
            float: left;
        }

        .billion .exactly {
            padding-top: 0.4rem;
            height: 1rem;
            line-height: 1rem;
            font-size: 0.6rem;
        }

        .billion .l.title {
            width: 70%;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

    .gold-hd {
        height: 4.7rem;
        background: url(/content/images/user/gold1.png);
        background-size: 100% 100%;
    }
    .gold-cat li{float: left;width: 33.33%;text-align: center;}
    .gold-cat li img{height: 1.66rem;}
    .gold-cat {background-color: #fff;height: 3.7rem;box-sizing: border-box;padding: 0.5rem 0;}
    .gold-cat span{display: block;line-height: 0.9rem;}
    .gold-hd{ color: #fff; font-size: 0.5rem; text-align: center;box-sizing: border-box;padding: 0.5rem 0;}
    .gold-hd h2{font-size: 1.4rem;font-weight: 500;padding: 0.1rem 0;}
    .gold-hd span{display: inline-block;height: 0.8rem;line-height: 0.8rem;background: #feb800; border-radius: 0.4rem; padding:0 0.4rem;}
</style>
<script type="text/javascript">
    $(function () {
        $("#Gold").infinitescroll({
            itemSelector: ".billion"
        });
    });
</script>
<header class="header  task-top">
    <i class="iconfont icon-Toright" style="color: #000;display: inline-block;float: left;margin-left: 0.2rem;" onclick="location.href=&#39;/UserAccount&#39;"></i>
   我的金币
</header>
<div style="height: 2rem;"></div>

    <div class="gold-hd">
        金币余额
        <h2>4150</h2>
        <span>您已累计获得4200金币</span>
    </div>
    <ul class="gold-cat">
        <li onclick=" location.href = &#39;/UserAccount/mygold?type=1&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/gold2.png" alt="Alternate Text">
            <span>赚金币</span>
        </li>
        <li onclick=" location.href = &#39;/UserAccount/mygold?type=2&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/gold3.png" alt="Alternate Text">
            <span>花金币</span>
        </li>
        <li onclick=" location.href = &#39;/UserAccount/GoldRecharge&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/gold4.png" alt="Alternate Text">
            <span>充金币</span>
        </li>
    </ul>
    <div class="usera-kong"></div>
    <div class="bar zt-menu" style="background: #fff; padding-top: 0rem;">
        <ul>
            <li>
                <a style="color: #ff464e" href="http://m.meilipa.com/UserAccount/GoldList">全部 </a>
                    <div class="sel">
                    </div>
            
            </li>
            <li>
                <a style="color: " href="http://m.meilipa.com/UserAccount/GoldList?type=0">收入</a>
            </li>
            <li>
                <a style="color: ;" href="http://m.meilipa.com/UserAccount/GoldList?type=1">支出</a>
            </li>
        </ul>
    </div>
<div id="Gold" class="con">
     
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取20个金币&#39;)">签到赚取20个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+20</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/16 19:42:32</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;参与金币抽奖，扣除50金币&#39;)">参与金币抽奖，扣除50金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #aaa; font-weight: bold; ">-50</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/16 17:58:23</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取15个金币&#39;)">签到赚取15个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+15</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/15 7:10:53</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取10个金币&#39;)">签到赚取10个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+10</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/14 13:33:15</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取5个金币&#39;)">签到赚取5个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+5</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/13 7:14:08</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取15个金币&#39;)">签到赚取15个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+15</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/11 21:48:49</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取10个金币&#39;)">签到赚取10个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+10</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/10 19:01:28</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取5个金币&#39;)">签到赚取5个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+5</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/9 20:27:06</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;签到赚取5个金币&#39;)">签到赚取5个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+5</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/7 21:01:31</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="billion">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title" onclick="myAlert(&#39;【免费活动】完成第2次活动，送2000个金币&#39;)">【免费活动】完成第2次活动，送2000个金币</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #fc710b; font-weight: bold; ">+2000</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color:#999999">2018/9/7 20:20:26</div>
                <div class="y r">
                    <span style="color:#ff464e"></span>
                </div>
            </div>
        </div>
    </div>


    <div class="navigation">
        <a href="http://m.meilipa.com/UserAccount/GetNextGoldList?page=2&amp;sceen=0&amp;type=-1"></a>
    </div>
</div>


        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/jquery.form.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/Validform_v5.3.2.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/post.loading.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/layer.m.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/layerdialog.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/jquery.cookie.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/browser.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/我的金币_files/app.js.下载"></script>


</body></html>