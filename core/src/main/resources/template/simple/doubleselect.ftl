<#--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#global dynamic_attributes_ignore = "second-"/>
<#include "/${parameters.templateDir}/simple/select.ftl" />
<#assign startCount = 0/>
<#if parameters.headerKey?? && parameters.headerValue??>
    <#assign startCount = startCount + 1/>
</#if>
<#if parameters.emptyOption??>
    <#assign startCount = startCount + 1/>
</#if>

<br/>
<select<#rt/>
        name="${(parameters.doubleName!"")}"<#rt/>
<#if parameters.disabled!false>
        disabled="disabled"<#rt/>
</#if>
<#if parameters.doubleTabindex?has_content>
        tabindex="${parameters.doubleTabindex}"<#rt/>
</#if>
<#if parameters.doubleId?has_content>
        id="${parameters.doubleId}"<#rt/>
</#if>
<#if parameters.doubleCss?has_content>
        class="${parameters.doubleCss}"<#rt/>
</#if>
<#if parameters.doubleStyle?has_content>
        style="${parameters.doubleStyle}"<#rt/>
</#if>
<#if parameters.title?has_content>
        title="${parameters.title}"<#rt/>
</#if>
<#if parameters.multiple!false>
        multiple="multiple"<#rt/>
</#if>
<#if parameters.get("doubleSize")?has_content>
        size="${parameters.get("doubleSize")}"<#rt/>
</#if>
<#if parameters.doubleMultiple!false>
        multiple="multiple"<#rt/>
</#if>
<#if parameters.doubleDisabled!false>
        disabled="disabled"<#rt/>
</#if>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/prefixed-dynamic-attributes.ftl" />
<@prefixedDynamicAttributes prefix="second-"/>
        >
</select>
<#if parameters.doubleMultiple!false>
<input type="hidden" id="__multiselect_${parameters.doubleId}"
       name="__multiselect_${(parameters.doubleName!"")}" value=""<#rt/>
    <#if parameters.doubleDisabled!false>
       disabled="disabled"<#rt/>
    </#if>
        />
</#if>
<script type="text/javascript" <#include "/${parameters.templateDir}/simple/nonce.ftl" /> >
    <#assign itemCount = startCount/>
    var ${parameters.id}Group = new Array(${parameters.listSize} + ${startCount});
    for (var i = 0; i < (${parameters.listSize} + ${startCount}); i++) {
        ${parameters.id}Group[i] = [];
    }

    <@s.iterator value="parameters.list">
        <#if parameters.listKey??>
            <#assign itemKey = stack.findValue(parameters.listKey)/>
            <#else>
                <#assign itemKey = stack.findValue('top')/>
        </#if>
        <#if parameters.listValue??>
            <#assign itemValue = stack.findString(parameters.listValue)/>
            <#else>
                <#assign itemValue = stack.findString('top')/>
        </#if>
        <#assign doubleItemCount = 0/>
        <#if parameters.doubleHeaderKey?? && parameters.doubleHeaderValue??>
        ${parameters.id}Group[${itemCount}][${doubleItemCount}] = new Option("${parameters.doubleHeaderValue?js_string}", "${parameters.doubleHeaderKey?js_string}");
            <#assign doubleItemCount = doubleItemCount + 1/>
        </#if>
        <#if parameters.doubleEmptyOption??>
        ${parameters.id}Group[${itemCount}][${doubleItemCount}] = new Option("", "");
            <#assign doubleItemCount = doubleItemCount + 1/>
        </#if>
    <@s.iterator value="${parameters.doubleList}">
        <#if parameters.doubleListKey??>
            <#assign doubleItemKey = stack.findValue(parameters.doubleListKey)/>
            <#else>
                <#assign doubleItemKey = stack.findValue('top')/>
        </#if>
        <#assign doubleItemKeyStr = doubleItemKey.toString() />
        <#if parameters.doubleListValue??>
            <#assign doubleItemValue = stack.findString(parameters.doubleListValue)/>
            <#else>
                <#assign doubleItemValue = stack.findString('top')/>
        </#if>
        <#if parameters.doubleListCssClass??>
            <#if stack.findString(parameters.doubleListCssClass)??>
              <#assign itemDoubleCssClass= stack.findString(parameters.doubleListCssClass)/>
            <#else>
              <#assign itemDoubleCssClass = ''/>
            </#if>
        </#if>
        <#if parameters.doubleListCssStyle??>
            <#if stack.findString(parameters.doubleListCssStyle)??>
              <#assign itemDoubleCssStyle= stack.findString(parameters.doubleListCssStyle)/>
            <#else>
              <#assign itemDoubleCssStyle = ''/>
            </#if>
        </#if>
        <#if parameters.doubleListTitle??>
            <#if stack.findString(parameters.doubleListTitle)??>
              <#assign itemDoubleTitle= stack.findString(parameters.doubleListTitle)/>
            <#else>
              <#assign itemDoubleTitle = ''/>
            </#if>
        </#if>
    ${parameters.id}Group[${itemCount}][${doubleItemCount}] = new Option("${doubleItemValue?js_string}", "${doubleItemKeyStr?js_string}");
        <#if itemDoubleCssClass??>
    ${parameters.id}Group[${itemCount}][${doubleItemCount}].setAttribute("class","${itemDoubleCssClass}");
        </#if>
        <#if itemDoubleCssStyle??>
        ${parameters.id}Group[${itemCount}][${doubleItemCount}].setAttribute("style","${itemDoubleCssStyle}");
        </#if>
        <#if itemDoubleTitle??>
        ${parameters.id}Group[${itemCount}][${doubleItemCount}].setAttribute("title","${itemDoubleTitle}");
        </#if>

        <#assign doubleItemCount = doubleItemCount + 1/>
    </@s.iterator>
        <#assign itemCount = itemCount + 1/>
    </@s.iterator>

    var ${parameters.id}Temp = document.${parameters.formName}.${parameters.doubleId};
    <#assign itemCount = startCount/>
    <#assign redirectTo = 0/>
    <@s.iterator value="parameters.list">
        <#if parameters.listKey??>
            <#assign itemKey = stack.findValue(parameters.listKey)/>
            <#else>
                <#assign itemKey = stack.findValue('top')/>
        </#if>
        <#if tag.contains(parameters.nameValue, itemKey)>
            <#assign redirectTo = itemCount/>
        </#if>
        <#assign itemCount = itemCount + 1/>
    </@s.iterator>
    ${parameters.id}Redirect(${redirectTo});
    function ${parameters.id}Redirect(x) {
        var selected = false;
        for (var m = ${parameters.id}Temp.options.length - 1; m >= 0; m--) {
            ${parameters.id}Temp.remove(m);
        }

        for (var i = 0; i < ${parameters.id}Group[x].length; i++) {
            ${parameters.id}Temp.options[i] = new Option(${parameters.id}Group[x][i].text, ${parameters.id}Group[x][i].value);
        <#if parameters.doubleNameValue??>
            <#if parameters.doubleMultiple??>
                for (var j = 0; j < ${parameters.doubleNameValue}.length; j++) {
                    if (${parameters.id}Temp.options[i].value == ${parameters.doubleNameValue?js_string}[j]) {
                        ${parameters.id}Temp.options[i].selected = true;
                        selected = true;
                    }
                }
                <#else>
                    if (${parameters.id}Temp.options[i].value == '${parameters.doubleNameValue?js_string}') {
                        ${parameters.id}Temp.options[i].selected = true;
                        selected = true;
                    }
            </#if>
        </#if>
        }

        if ((${parameters.id}Temp.options.length > 0) && (! selected)) {
            ${parameters.id}Temp.options[0].selected = true;
        }
    }
</script>
