<#import "parts/common.ftlh" as c>
<#import "parts/authorization.ftlh" as a>

<@c.page>
    <h1 class="mb-3">Sign up</h1>
    <@a.login "/register" true />
</@c.page>