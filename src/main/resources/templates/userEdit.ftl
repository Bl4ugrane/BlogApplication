<#import "blocks/common.ftl" as c>
<@c.page>

    <form action="/users" method="post">
        <div class="form-group">
            <label for="exampleInputUsername">Username</label>
            <input type="text" class="form-control" value="${user.username}" name="username">
        </div>
        <#list roles as role>
            <div class="form-group">
                <label for="exampleInputRoles">
                <input type="checkbox" class="form-control" name="${role}"
                        ${user.roles?seq_contains(role)?string("checked","")}>
                    ${role}</label>
            </div>
        </#list>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</@c.page>