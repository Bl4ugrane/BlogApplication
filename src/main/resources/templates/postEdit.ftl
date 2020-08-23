<#import "blocks/common.ftl" as c>

<@c.page>
    <main role="main" class="container">
        <div class="container ml-5 mb-4">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-12 d-flex justify-content-end align-items-center">
                    <form method="get" action="/posts" class="form-inline">
                        <input type="text" name="title" class="form-control" value="${title?ifExists}" placeholder="Поиск...">
                        <button type="submit" class="btn btn-secondary ml-2">Найти</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="card-deck">
            <div class="col-md-8">
                <form method="post" enctype="multipart/form-data" xmlns="http://www.w3.org/1999/html">
                    <div class="container" align="center">
                        <div class="form-group">
                            <div class="col-8 mt-8">
                                <label for="exampleInputTitle">Заголовок</label>
                                <input type="text" class="form-control" name="title" value="${post.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-8 mt-8">
                                <label for="exampleInputDescription">Описание</label>
                                <input type="text" class="form-control" name="description" value="${post.description}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-8 mt-8">
                                <label for="exampleInputText">Текст</label>
                                <textarea  class="form-control" name="text">${post.text}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-8 mt-8">
                                <label for="exampleInputFile">UploadFile</label>
                                <input type="file" class="form-control" name="file">
                            </div>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <div class="row justify-content-center">
                            <div class="col-5 mt-3 mb-2">
                                <button class="btn btn-lg btn-dark btn-block" type="submit">Изменить</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="row justify-content-center">
                    <div class="col-5 mt-2 mb-2">
                        <form method="post" action="/posts/remove/${post.id}">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn btn-lg btn-dark btn-block">Удалить</button>
                        </form>
                    </div>
                </div>
            </div>
            <aside class="col-md-4 blog-sidebar">
                <div class="p-3 ml-5 mt-2">
                    <h4 class="font-italic">Archives</h4>
                    <ol class="list-unstyled mb-0">
                        <li><a href="#">March 2014</a></li>
                        <li><a href="#">February 2014</a></li>
                        <li><a href="#">January 2014</a></li>
                        <li><a href="#">December 2013</a></li>
                        <li><a href="#">November 2013</a></li>
                        <li><a href="#">October 2013</a></li>
                        <li><a href="#">September 2013</a></li>
                        <li><a href="#">August 2013</a></li>
                        <li><a href="#">July 2013</a></li>
                        <li><a href="#">June 2013</a></li>
                        <li><a href="#">May 2013</a></li>
                        <li><a href="#">April 2013</a></li>
                    </ol>
                </div>
                <div class="p-3 ml-5">
                    <h4 class="font-italic">Elsewhere</h4>
                    <ol class="list-unstyled">
                        <li><a href="#">GitHub</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Facebook</a></li>
                    </ol>
                </div>
            </aside>
        </div>
        </div>
    </main>
</@c.page>