<?php

/**
 * Contao Open Source CMS
 * 
 * Copyright (C) 2005-2015
 * 
 * @package bephpinfo
 * @link    http://contao.org
 * @license http://www.gnu.org/licenses/lgpl-3.0.html LGPL
 */


/**
 * Register the classes
 */
ClassLoader::addClasses(array
(
	'bephpinfo' => 'system/modules/be_phpinfo/bephpinfo.php',
));


/**
 * Register the templates
 */
TemplateLoader::addFiles(array
(
	'be_phpinfo'         => 'system/modules/be_phpinfo/templates',
));
