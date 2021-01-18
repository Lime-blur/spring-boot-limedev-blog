<#import "parts/common.ftlh" as c>

<#include "parts/security.ftlh">

<@c.page>
    <h1 class="mb-3">Articles</h1>
    <#if isAdmin>
        <button class="btn btn-primary mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCreateArticle" aria-expanded="false" aria-controls="collapseCreateArticle">
            Добавить статью
        </button>
        <div class="collapse <#if article??>show</#if> mb-3" id="collapseCreateArticle">
            <form method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="articleInputName" class="form-label">Название статьи</label>
                    <input type="text" placeholder="Name" class="form-control ${(nameError??)?string('is-invalid', '')}" id="articleInputName" name="name" value="<#if article??>${article.name}</#if>">
                    <#if nameError??>
                        <div class="invalid-feedback">
                            ${nameError}
                        </div>
                    </#if>
                </div>
                <div class="mb-3">
                    <label for="articleTextareaText" class="form-label">Текст статьи</label>
                    <textarea class="form-control ${(textError??)?string('is-invalid', '')}" placeholder="This article is about..." id="articleTextareaText" rows="3" name="text"><#if article??>${article.text}</#if></textarea>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="mb-3">
                    <label for="articleInputFile" class="form-label">Файл для статьи</label>
                    <input class="form-control" type="file" id="articleInputFile" name="file">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>
    </#if>
    <div>
        <form method="get" action="/articles" class="row g-3">
            <div class="col-auto">
                <label for="articleInputSearch" class="visually-hidden">Найти статью</label>
                <input type="text" class="form-control" id="articleInputSearch" placeholder="Найти статью..." name="filter" value="${filter!}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Найти</button>
            </div>
        </form>
    </div>
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <#list articles as article>
            <div class="col">
                <div class="card">
                    <#if article.filename??>
                        <img alt="card-article" class="card-img-top" src="/img/${article.filename}">
                    </#if>
                    <div class="card-body">
                        <h5 class="card-title">${article.name!"<unknown name>"}</h5>
                        <p class="card-text">${article.text}</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">${article.authorName}</small>
                    </div>
                </div>
            </div>
        <#else>
            <div>Статьи не найдены.</div>
        </#list>
    </div>
</@c.page>