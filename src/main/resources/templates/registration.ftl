<#import "blocks/common.ftl" as c>
<#import "blocks/login.ftl" as l>

<@c.page>
${message?ifExists}
<@l.login "/registration" true />
</@c.page>