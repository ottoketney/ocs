{**
 * cfp.tpl
 *
 * Copyright (c) 2000-2008 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference call-for-papers page.
 *
 * $Id$
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="schedConf.cfp.title"}
{include file="common/header.tpl"}
{/strip}

<div>{$cfpMessage|nl2br}</div>

{if $acceptingSubmissions}
	<p>
		{translate key="presenter.submit.startHere"}<br/>
		<a href="{url page="presenter" op="submit" requiresPresenter=1}" class="action">{translate key="presenter.submit.startHereLink"}</a><br />
	</p>
{else}
	<p>
		{$notAcceptingSubmissionsMessage}
	</p>
{/if}

{include file="common/footer.tpl"}
