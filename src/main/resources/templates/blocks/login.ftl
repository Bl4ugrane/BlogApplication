<#macro login path isRegisterForm>
    <form action="${path}" method="post" class="form-signin">
        <div class="container" align="center">
            <div class="row justify-content-center">
                <div class="col-3 mt-3 mb-2">
                    <h1 class="h3 mb-3 font-weight-normal">Пожалуйста, введите данные</h1>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-3 mt-3 mb-2">
                    <input type="text" name="username" class="form-control" placeholder="Логин" />
                </div>
            </div>
            <#if isRegisterForm>
                <div class="row justify-content-center">
                    <div class="col-3 mt-3 mb-2">
                        <input type="email" name="email" class="form-control"placeholder="test@gmail.com" />
                    </div>
                </div>
            </#if>
            <div class="row justify-content-center">
                <div class="col-3 mt-3 mb-2">
                    <input type="password" name="password" class="form-control"
                           placeholder="Пароль" />
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="row justify-content-center">
                <div class="col-3 mt-3 mb-1">
                    <#if !isRegisterForm>
                        <a href="/registration" align="center">Зарегистрироваться</a>
                    </#if>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-3 mt-2 mb-2">
                    <button class="btn btn-lg btn-dark btn-block" type="submit"><#if isRegisterForm>Зарегистрировать<#else>Войти</#if></button>
                </div>
            </div>
        </div>
    </form>
</#macro>
<#macro logout>
    <#include "security.ftl" >
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-secondary" type="submit"><#if user??>Выйти<#else>Войти</#if></button>
    </form>
</#macro>