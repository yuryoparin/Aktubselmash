<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="height:100%;">
<head>
    <title>404 Страница не существует</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
    <link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
    <style type="text/css">
        * { padding: 0; margin: 0; }
        body {
            background: white;
            font-family: Arial, Helvetica, FreeSans, sans-serif; font-size: 10pt;
            color: #333; text-align: center;
        }
        #wrapper { text-align: left; margin: 0 auto; width: 900px; }
        h1 { font-size: 20pt; font-weight: normal; }
        h2 { font-size: 12pt; font-weight: normal; }
        a { color: #08c; }
        .s404 {
            background: #aaa; font-size: 30px; padding: 8px 5px 0;
            color: white; font-weight: bold; display: block;
        }
    </style>
</head>
<body style="height:100%;">
<div id="wrapper" style="min-height:100%; height:100%;">
    <div style="height:50%;"></div>

    <div style="height: 140px; margin: 0 auto; margin-top: -140px; width: 70%;">
        <div style="overflow:hidden; height: 52px;">
            <div style="float:left; width: 230px;">
                <h1>Актюбсельмаш</h1>
                <h2>Машинки для стрижки овец</h2>
            </div>
            <div style="float:left; width: 61px;">
                <span class="s404" style="height:52px;">404</span>
            </div>
        </div>
        <div style="overflow:hidden; margin-top: 20px;">
            <p>
                Запрашиваемая вами страница (<%=request.getAttribute("javax.servlet.error.request_uri")%>) не существует.
            </p>
            <a style="padding-top: 5px;" href="<%=request.getContextPath()%>/home">← Вернуться на главную страницу</a>
        </div>
    </div>
</div>
</body>
</html>