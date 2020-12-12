<#import "blocks/common.ftl" as c>
<#include "blocks/security.ftl">

<@c.page>
   <div class="jumbotron text-white rounded bg-dark">
      <div class="col-5 mt-2 mb-2 pb-3">
         <h1 class="display-4 font-italic">Добро пожаловать!</h1>
         <#include "blocks/security.ftl" >
         <#if !user??>
         <a href="/login" class="btn btn-lg btn-secondary mt-5">Авторизоваться</a>
         </#if>
         <#if user??>
            <p class="lead">Вы авторизованы под аккаунтом ${name}</p>
         </#if>
      </div>
   </div>
</@c.page>
