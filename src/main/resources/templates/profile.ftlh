<#import "parts/common.ftlh" as c>

<@c.page>
    <h1 class="mb-3">${username}'s profile</h1>
    <div class="mb-3">
        ${message!}
    </div>
    <form method="post" class="mb-2">
        <div class="row">
            <!-- <div class="mb-3 col-md-4">
                <label for="loginInputCurrentPassword" class="form-label">Текущий пароль</label>
                <input type="password" placeholder="Current password" class="form-control" id="loginInputCurrentPassword" name="currentPassword">
            </div> -->
            <div class="mb-3 col-md-4">
                <label for="loginInputEmail" class="form-label">Email</label>
                <input type="email" placeholder="mail@example.com" value="${email!''}" class="form-control" id="loginInputEmail" name="email">
            </div>
            <div class="mb-3 col-md-4">
                <label for="loginInputPassword" class="form-label">Пароль</label>
                <input type="password" placeholder="Password" class="form-control" id="loginInputPassword" name="password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>