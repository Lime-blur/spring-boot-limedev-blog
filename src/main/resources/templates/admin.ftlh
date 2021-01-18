<#import "parts/common.ftlh" as c>

<#include "parts/security.ftlh">

<@c.page>
    <h1 class="mb-3">Admin</h1>
    <div class="users_tab">
        <div>
            <form method="get" action="/admin" class="row g-3">
                <div class="col-auto">
                    <label for="adminInputSearchUser" class="visually-hidden">Найти пользователя</label>
                    <input type="text" class="form-control" id="adminInputSearchUser" placeholder="Найти пользователя..." name="filter" value="${filter!}">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary mb-3">Найти</button>
                </div>
            </form>
        </div>
        <div class="list-group">
            <#list users as userToEdit>
                <a href="/admin/user/${userToEdit.id}" class="list-group-item <#if userToEdit.id == userId>disabled</#if> list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">${userToEdit.username!"<null>"}</h5>
                        <#if userToEdit.active == true>
                            <small class="text-muted"><span class="badge rounded-pill bg-success">Активирован</span></small>
                        <#else>
                            <small class="text-muted"><span class="badge rounded-pill bg-danger">Не активирован</span></small>
                        </#if>
                    </div>
                    <p class="mb-1">Пользователь №${userToEdit.id}</p>
                    <small class="text-muted">Test</small>
                </a>
            <#else>
                <div>Пользователи не найдены.</div>
            </#list>
        </div>
    </div>
</@c.page>