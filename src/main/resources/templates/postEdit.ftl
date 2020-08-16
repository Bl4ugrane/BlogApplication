<#import "blocks/common.ftl" as c>
<@c.page>
    <form method="post" enctype="multipart/form-data" xmlns="http://www.w3.org/1999/html">
        <div class="container" align="center">
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputTitle">Заголовок</label>
                    <input type="text" class="form-control" name="title" value="${post.title}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputDescription">Описание</label>
                    <input type="text" class="form-control" name="description" value="${post.description}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputText">Текст</label>
                    <textarea  class="form-control" name="text" value="${post.text}"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputFile">UploadFile</label>
                    <input type="file" class="form-control" name="file">
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="row justify-content-center">
                <div class="col-3 mt-3 mb-2">
                    <button class="btn btn-lg btn-dark btn-block" type="submit">Изменить</button>
                </div>
            </div>
        </div>
    </form>
        <div class="row justify-content-center">
             <div class="col-3 mt-2 mb-2">
            <form method="post" action="/posts/remove/${post.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button class="btn btn-lg btn-dark btn-block">Удалить</button>
            </form>
            </div>
        </div>
</@c.page>