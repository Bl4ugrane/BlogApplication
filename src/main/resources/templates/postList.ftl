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
                            <strong class="d-inline-block mb-2 text-primary">World</strong>
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
                </#list>
            </div>
            <aside class="col-md-4 blog-sidebar">
                <div class="p-3 ml-5">
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
    </main>
</@c.page>