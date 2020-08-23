<#import "blocks/common.ftl" as c>
<#import "blocks/login.ftl" as l>

<@c.page>
    <div class="container" align="center">
        <div class="row justify-content-center">
            <div class="col-4 mt-3 mb-1">
                ${message?ifExists}
            </div>
        </div>
    </div>
<@l.login "/registration" true />
</@c.page>