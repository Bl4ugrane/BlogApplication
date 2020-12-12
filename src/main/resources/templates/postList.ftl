<#import "blocks/common.ftl" as c>

<@c.page>
    <main role="main" class="container">
        <div class="container ml-5 mb-4">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-12 d-flex justify-content-end align-items-center">
                    <form method="get" action="/posts" class="form-inline">
                        <input type="text" name="title" class="form-control" value="${title?ifExists}" placeholder="Поиск..."/>
                        <button type="submit" class="btn btn-secondary ml-2">Найти</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="card-deck">
            <div class="col-md-8">
                <#list posts as post>
                    <div class="card flex-md-row mb-4 box-shadow h-md-250">
                        <div class="card-body d-flex flex-column align-items-start">
                            <h3 class="mb-0">
                                <a class="text-dark" href="#">${post.title}</a>
                            </h3>
                            <div class="mb-1 text-muted">Автор: ${post.getAuthorName()}</div>
                            <div class="mt-2">
                                <p class="card-text mb-auto text-muted">${post.description}</p>
                            </div>
                            <div class="mt-5">
                                <p class="text-muted"><a href="/posts/${post.id}">Подробнее</a></p>
                            </div>
                        </div>
                        <div class="mt-4 mr-4">
                            <#if post.filename??>
                                <img src="/img/${post.filename}" class="card-img-top" style="width:210px;height:200px;"></img>
                            </#if>
                        </div>
                    </div>
                <#else>
                    <h3 class="container ml-5 mb-4" align="center">Не найдено ни одной статьи (:</h3>
                </div>
                </#list>
            </div>
        </div>
    </main>
</@c.page>