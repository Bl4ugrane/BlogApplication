<#import "blocks/common.ftl" as c>

<@c.page>

    <table class="table table-hover table-dark" >
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Username</th>
            <th scope="col">Roles</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>

                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>,  </#list></td>
                <td><a href="/users/edit/${user.id}">Edit</a></td>
                <td><a href="/users/remove/${user.id}">Delete</a></td>
            </tr>
        <#else>
            <h2 align="center">Нет ни одной статьи</h2>

        </#list>
        </tbody>
    </table>

</@c.page>