<#import "blocks/common.ftl" as c>
<@c.page>
<form action="/post/add" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="exampleInputTitle">Title</label>
        <input type="text" class="form-control" name="title" placeholder="Enter title">
    </div>
    <div class="form-group">
        <label for="exampleInputDescription">Description</label>
        <input type="text" class="form-control" name="description" placeholder="Enter description">
    </div>
    <div class="form-group">
        <label for="exampleInputText">Text</label>
        <input type="text" class="form-control" name="text" placeholder="Enter text">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">UploadFile</label>
        <input type="file" class="form-control" name="file">
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</@c.page>