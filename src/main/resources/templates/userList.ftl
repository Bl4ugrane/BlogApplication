<#import "blocks/common.ftl" as c>

<@c.page>
    <table class="table table-hover table-dark" >
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Логин</th>
            <th scope="col">Эл. почта</th>
            <th scope="col">Роль</th>
            <th scope="col">Редактировать</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td>${user.email?ifExists}</td>
                <td><#list user.roles as role>${role}<#sep>,  </#list></td>
                <td><a style="color: white" href="/users/edit/${user.id}">Изменить</a></td>
            </tr>
        <#else>
            <h2 align="center">Нет ни одного пользователя</h2>
        </#list>
        </tbody>
    </table>
</@c.page>