<#import "authorization.ftlh" as a>

<#include "security.ftlh">

<ul class="nav nav-pills">
    <li class="nav-item">
        <a class="link-light nav-link" href="/">Главная</a>
    </li>
    <li class="nav-item">
        <a class="link-light nav-link" href="/articles">Статьи</a>
    </li>
    <li class="nav-item">
        <a class="link-light nav-link" href="/users">Список пользователей</a>
    </li>
    <#if isAdmin>
        <li class="nav-item dropdown">
            <a class="link-light nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Админ</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/admin">Управление</a></li>
            </ul>
        </li>
    </#if>
    <#if user?? && name != "">
        <li class="nav-item dropdown">
            <a class="link-light nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">${name}</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/profile">Личный кабинет</a></li>
                <@a.logout />
            </ul>
        </li>
    </#if>
</ul>