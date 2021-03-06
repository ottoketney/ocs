<?php

/**
 * @file OAIHandler.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class OAIHandler
 * @ingroup pages_oai
 *
 * @brief Handle OAI protocol requests.
 */



define('SESSION_DISABLE_INIT', 1); // FIXME?

import('classes.oai.ocs.ConferenceOAI');
import('classes.handler.Handler');

class OAIHandler extends Handler {
	/**
	 * Constructor
	 **/
	function OAIHandler() {
		parent::Handler();
	}

	function index() {
		$this->validate();
		PluginRegistry::loadCategory('oaiMetadataFormats');

		$oai = new ConferenceOAI(new OAIConfig(Request::getRequestUrl(), Config::getVar('oai', 'repository_id')));
		$oai->execute();
	}

	function validate() {
		// Site validation checks not applicable
		//parent::validate();

		if (!Config::getVar('oai', 'oai')) {
			Request::redirect(null, 'index');
		}
	}
}

?>
