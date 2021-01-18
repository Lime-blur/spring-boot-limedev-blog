<#import "parts/common.ftlh" as c>
<#import "parts/authorization.ftlh" as a>

<@c.page>
    <h1 class="mb-3">User list</h1>
    <div>
        <form method="get" action="/users" class="row g-3">
            <div class="col-auto">
                <label for="usersInputSearch" class="visually-hidden">Найти пользователя</label>
                <input type="text" class="form-control" id="usersInputSearch" placeholder="Найти пользователя..." name="filter" value="${filter!}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Найти</button>
            </div>
        </form>
    </div>
    <div class="list-group">
        <#list users as user>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${user.username!"<null>"}</h5>
                    <small class="text-muted">Offline</small>
                </div>
                <p class="mb-1">Пользователь №${user.id}</p>
                <small class="text-muted">Test</small>
            </a>
        <#else>
            <div>Пользователи не найдены.</div>
        </#list>
    </div>
</@c.page>