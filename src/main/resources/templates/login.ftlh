<#import "parts/common.ftlh" as c>
<#import "parts/authorization.ftlh" as a>

<@c.page>
    <h1 class="mb-3">Sign in</h1>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert">
            ${message}
        </div>
    </#if>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <@a.login "/login" false />
</@c.page>