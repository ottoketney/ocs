{**
 * metadata_view.tpl
 *
 * Copyright (c) 2000-2007 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View (but not edit) metadata of a paper.
 *
 * $Id$
 *}
 
{assign var="pageTitle" value="submission.viewMetadata"}
{include file="common/header.tpl"}

{if $canViewPresenters}
<h3>{translate key="paper.presenters"}</h3>
	
<table width="100%" class="data">
	{foreach name=presenters from=$presenters key=presenterIndex item=presenter}
	<tr valign="top">
		<td width="20%" class="label">{translate key="user.name"}</td>
		<td width="80%" class="value">
			{assign var=emailString value="`$presenter.firstName` `$presenter.middleName` `$presenter.lastName` <`$presenter.email`>"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl paperId=$paperId}
			{$presenter.firstName|escape} {$presenter.middleName|escape} {$presenter.lastName|escape} {icon name="mail" url=$url}
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="user.url"}</td>
		<td class="value">{$presenter.url|escape|default:"&mdash;"}</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="user.affiliation"}</td>
		<td class="value">{$presenter.affiliation|escape|default:"&mdash;"}</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="user.biography"}</td>
		<td class="value">{$presenter.biography|strip_unsafe_html|nl2br|default:"&mdash;"}</td>
	</tr>
	{if !$smarty.foreach.presenters.last}
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	{/foreach}
</table>


<div class="separator"></div>
{/if}


<h3>{translate key="submission.titleAndAbstract"}</h3>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.title"}</td>
		<td width="80%" class="value">{$title|strip_unsafe_html|default:"&mdash;"}</td>
	</tr>
	{if $alternateLocale1}
	<tr valign="top">
		<td class="label">{translate key="paper.title"}<br />({$languageToggleLocales.$alternateLocale1})</td>
		<td class="value">{$titleAlt1|strip_unsafe_html|default:"&mdash;"}</td>
	</tr>
	{/if}
	{if $alternateLocale2}
	<tr valign="top">
		<td class="label">{translate key="paper.title"}<br />({$languageToggleLocales.$alternateLocale2})</td>
		<td class="value">{$titleAlt2|strip_unsafe_html|default:"&mdash;"}</td>
	</tr>
	{/if}

	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="paper.abstract"}</td>
		<td class="value">{$abstract|strip_unsafe_html|nl2br|default:"&mdash;"}</td>
	</tr>
	{if $alternateLocale1}
	<tr valign="top">
		<td class="label">{translate key="paper.abstract"}<br />({$languageToggleLocales.$alternateLocale1})</td>
		<td class="value">{$abstractAlt1|strip_unsafe_html|nl2br|default:"&mdash;"}</td>
	</tr>
	{/if}
	{if $alternateLocale2}
	<tr valign="top">
		<td class="label">{translate key="paper.abstract"}<br />({$languageToggleLocales.$alternateLocale2})</td>
		<td class="value">{$abstractAlt2|strip_unsafe_html|nl2br|default:"&mdash;"}</td>
	</tr>
	{/if}
</table>


<div class="separator"></div>


<h3>{translate key="submission.indexing"}</h3>
	
<table width="100%" class="data">
	{if $schedConfSettings.metaDiscipline}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.discipline"}</td>
		<td width="80%" class="value">{$discipline|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	{if $schedConfSettings.metaSubjectClass}
	<tr valign="top">
		<td colspan="2" class="label"><a href="{$schedConfSettings.metaSubjectClassUrl}" target="_blank">{$schedConfSettings.metaSubjectClassTitle|escape}</a></td>
	</tr>
	<tr valign="top">
		<td width="20%"class="label">{translate key="paper.subjectClassification"}</td>
		<td width="80%" class="value">{$subjectClass|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	{if $schedConfSettings.metaSubject}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.subject"}</td>
		<td width="80%" class="value">{$subject|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	{if $schedConfSettings.metaCoverage}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.coverageGeo"}</td>
		<td width="80%" class="value">{$coverageGeo|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="paper.coverageChron"}</td>
		<td class="value">{$coverageChron|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="paper.coverageSample"}</td>
		<td class="value">{$coverageSample|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	{if $schedConfSettings.metaType}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.type"}</td>
		<td width="80%" class="value">{$type|escape|default:"&mdash;"}</td>
	</tr>
	<tr>
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	{/if}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.language"}</td>
		<td width="80%" class="value">{$language|escape|default:"&mdash;"}</td>
	</tr>
</table>


<div class="separator"></div>


<h3>{translate key="submission.supportingAgencies"}</h3>
	
<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{translate key="presenter.submit.agencies"}</td>
		<td width="80%" class="value">{$sponsor|escape|default:"&mdash;"}</td>
	</tr>
</table>

{include file="common/footer.tpl"}
