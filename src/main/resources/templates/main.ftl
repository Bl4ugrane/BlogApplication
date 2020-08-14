<#import "blocks/common.ftl" as c>
<#import "blocks/login.ftl" as l>

<@c.page>
    <div>
        <@l.logout />
    </div>


<a href="/post/add">Добавить статью</a>
    <a href="/users">Пользователи</a>
<form method="get" action="/main">
    <input type="text" name="title" value="${title?ifExists}">
    <button type="submit">Найти</button>
</form>
<div align="right">
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Sign Out"/>
    </form>
</div>

<table class="table table-hover table-dark" >
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Title</th>
        <th scope="col">Description</th>
        <th scope="col">Author</th>
    </tr>
    </thead>
    <tbody>
    <#list posts as post>
    <tr>

        <th scope="row">${post.id}</th>
        <td>${post.title}</td>
        <td>${post.description}</td>
        <td>${post.authorName}</td>
        <td><#if post.filename??>
            <img src="/img/${post.filename}"
        </#if> </td>
    </tr>
    <#else>
        <h2 align="center">Нет ни одной статьи</h2>

    </#list>
    </tbody>
</table>

</@c.page>