<#import "parts/common.ftlh" as c>
<#import "parts/authorization.ftlh" as a>

<@c.page>
    <h1 class="mb-3">Users Editor</h1>
    <div class="mb-2">
        <form action="/admin" method="post">
            <div class="col-md-5 mb-2">
                <label for="userEditInputName" class="visually-hidden">Имя пользователя</label>
                <input type="text" class="form-control" id="userEditInputName" placeholder="Username" name="username" value="${user.username!"<null>"}">
            </div>
            <#list roles as role>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="userEditCheck${role}" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                    <label class="form-check-label" for="userEditCheck${role}">${role}</label>
                </div>
            </#list>
            <input type="hidden" name="userId" value="${user.id}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="mt-2 btn btn-primary">Сохранить</button>
        </form>
    </div>
    <div>
        <form action="/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-danger">Удалить пользователя</button>
        </form>
    </div>
</@c.page>