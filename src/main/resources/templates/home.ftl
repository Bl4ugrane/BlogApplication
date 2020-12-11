<#import "blocks/common.ftl" as c>
<#macro login path isRegisterForm>


<@c.page>
   <#if isRegisterForm>
   <div class="jumbotron text-white rounded bg-dark">
      <div class="col-2 mt-2 mb-2 pb-3">
         <h1 class="display-4 font-italic">Добро пожаловать!</h1>
         <a href="/login" class="btn btn-lg btn-secondary mt-5">Авторизоваться</a>
      </div>
   </div>
   </#if>
</@c.page>
</#macro>