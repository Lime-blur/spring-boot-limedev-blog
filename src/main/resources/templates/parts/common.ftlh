<#macro page>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml" lang="ru">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Spring Blog Learn</title>
            <link rel="stylesheet" href="/static/css/limedev.css">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        </head>
        <body>
            <div class="wrap_header">
                <div class="container">
                    <#include "navbar.ftlh">
                </div>
            </div>
            <div class="wrap_content">
                <div class="container mt-5">
                    <#nested>
                </div>
            </div>
            <div class="wrap_footer py-3">
                <div class="container">
                    2021 Lime's projects development ©
                </div>
            </div>
            <script src="/static/js/bootstrap/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        </body>
    </html>
</#macro>