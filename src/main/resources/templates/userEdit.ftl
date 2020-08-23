<#import "blocks/common.ftl" as c>

<@c.page>
    <form action="/users" method="post">
        <div class="container" align="left">
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputUsername">Логин</label>
                    <input type="text" class="form-control" name="username" value="${user.username}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputEmail">Эл. почта</label>
                    <input type="text" class="form-control" name="email" value="${user.email}"/>
                </div>
            </div>
            <#list roles as role>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputRoles">
                    <input type="checkbox" class="form-control" name="${role}"
                            ${user.roles?seq_contains(role)?string("checked","")}/>
                    ${role}</label>
                </div>
            </#list>
            </div>
                   <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                   <button type="submit" class="btn btn-secondary">Изменить</button>
        </div>
    </form>
</@c.page>