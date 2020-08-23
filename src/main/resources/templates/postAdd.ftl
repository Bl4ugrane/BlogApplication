<#import "blocks/common.ftl" as c>

<@c.page>
    <form action="/posts/add" method="post" enctype="multipart/form-data">
        <div class="container" align="center">
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputTitle">Заголовок</label>
                    <input type="text" class="form-control" name="title" placeholder="Введите заголовок статьи"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputDescription">Описание</label>
                    <input type="text" class="form-control" name="description" placeholder="Введите описание статьи"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-5 mt-8">
                    <label for="exampleInputText">Текст</label>
                    <textarea  class="form-control" name="text" placeholder="Введите текст статьи"></textarea>
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
                    <button class="btn btn-lg btn-dark btn-block"  type="submit">Добавить статью</button>
                </div>
            </div>
        </div>
    </form>
</@c.page>