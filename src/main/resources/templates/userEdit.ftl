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
        <div class="container" align="left">
        <div class="form-group">
            <div class="col-5 mt-8 pl-5">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-secondary">Изменить</button>
            </div>
        </div>
    </form>
    <div class="form-group">
        <div class="col-4 mt-8 pl-5">
            <form method="post" action="/users/remove/${user.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button style="height:38px;width:100px" class="btn btn-secondary">Удалить</button>
            </form>
        </div>
    </div>
    </div>
    </div>
</@c.page>