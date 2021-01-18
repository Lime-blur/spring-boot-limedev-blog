<#import "parts/common.ftlh" as c>

<#include "parts/security.ftlh">

<@c.page>
    <link rel="stylesheet" href="/static/css/mainpage.css">
    <h1 class="mb-3">Limedev Cards</h1>
    <#if name == "">
        <h2 class="mb-5">Добро пожаловать! Вы здесь новенький?</h2>
    <#else>
        <h2 class="mb-5">Добро пожаловать, ${name}!</h2>
    </#if>
    <div class="description_main py-3">
        <p class="fs-5 text-center">Limedev Cards – это сервис, позволяющий создать вашу Online-визитку. Используйте её для чего угодно: бизнес, реклама, объявления, либо просто при знакомстве с людьми!</p>
        <h3 class="mt-5 text-center">Как это работает?</h3>
        <p class="fs-5 text-center">Регистрируйтесь в сервисе, заполняйте ваши данные профиля. Всё готово! Для вашей страницы профиля сервис создаст QR-код, который можно отправить кому угодно! Теперь друзья, знакомые, потенциальные покупатели и клиенты увидят ваши контакты, отсканировав QR-код через мобильное приложение!</p>
        <h3 class="mt-5 text-center">Какое мобильное приложение требуется для сканирования?</h3>
        <p class="fs-5 text-center">Подойдёт любое приложение для сканирования QR-кода, но лучше воспользуйтесь приложением Limedev Cards Scanner!</p>
    </div>
    <#if name == "">
        <div class="my-5 text-center">
            <a class="btn btn-secondary btn-lg" href="/login">Войти</a>
        </div>
    </#if>
</@c.page>