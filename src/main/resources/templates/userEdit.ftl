<#import "blocks/common.ftl" as c>

<@c.page>
    <form method="post">
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
            </div>
        </div>
        <div class="form-group">
            <div class="col-5 mt-8">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-secondary">Изменить</button>
            </div>
        </div>
    </form>
    <div class="form-group">
        <div class="col-5 mt-8">
            <form method="post" action="/users/remove/${user.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-secondary">Удалить</button>
            </form>
        </div>
    </div>
</@c.page>