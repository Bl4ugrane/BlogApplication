<#import "blocks/common.ftl" as c>
<#import "blocks/login.ftl" as l>

<@c.page>
    Add new user
    ${message?ifExists}
    <@l.login "/registration" />
</@c.page>