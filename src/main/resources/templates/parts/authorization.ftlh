<#macro login path isRegisterForm>
    <form action="${path}" method="post" class="mb-2">
        <div class="row">
            <div class="mb-3 col-md-6">
                <label for="loginInputLogin" class="form-label">Имя пользователя</label>
                <input type="text" placeholder="Username" value="<#if user??>${user.username}</#if>" class="form-control ${(usernameError??)?string('is-invalid', '')}" id="loginInputLogin" name="username">
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
            <div class="mb-3 col-md-6">
                <label for="loginInputPassword" class="form-label">Пароль</label>
                <input type="password" placeholder="Password" class="form-control ${(passwordError??)?string('is-invalid', '')}" id="loginInputPassword" name="password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
            <#if isRegisterForm>
                <div class="mb-3 col-md-6">
                    <label for="loginInputRepeatPassword" class="form-label">Повторите пароль</label>
                    <input type="password" placeholder="Repeat password" class="form-control ${(password2Error??)?string('is-invalid', '')}" id="loginInputRepeatPassword" name="password2">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
                <div class="mb-3 col-md-6">
                    <label for="loginInputEmail" class="form-label">Email</label>
                    <input type="email" placeholder="mail@example.com" value="<#if user??>${user.email}</#if>" class="form-control ${(emailError??)?string('is-invalid', '')}" id="loginInputEmail" name="email">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </#if>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
    </form>
    <#if !isRegisterForm><a href="/register">Регистрация</a></#if>
</#macro>

<#macro logout>
    <li>
        <form class="dropdown-item" action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="btn btn-secondary btn-sm" type="submit">Выйти</button>
        </form>
    </li>
</#macro>