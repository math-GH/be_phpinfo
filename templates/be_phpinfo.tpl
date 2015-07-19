<?php if (!defined('TL_ROOT')) die('You cannot access this file directly!');

/**
 * Contao Open Source CMS
 * Copyright (C) 2005-2011 Leo Feyer
 *
 * Formerly known as TYPOlight Open Source CMS.
 *
 * This program is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation, either
 * version 3 of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program. If not, please visit the Free
 * Software Foundation website at <http://www.gnu.org/licenses/>.
 *
 * PHP version 5
 * @copyright  µaTh 2015
 * @author     µaTh 2015
 * @package    be_phpinfo 
 * @license    LGPL 
 * @filesource
 */

 

if (!$this->isAdmin) {
?>
<div><?php echo $this->lang->onlyAdmin; ?></div>
<?

} else {
?>


<style type="text/css">
#phpinfo { margin: 10px }
#phpinfo table { border-collapse: collapse; width: 100%; table-layout: fixed }
#phpinfo tr.h th { background-color: lightgrey; color: #000; text-align: left; padding: 2px; }
#phpinfo th { background-color: #f0f0f0; color: #000; text-align: left; padding: 2px; }

#phpinfo td { padding: 2px }
#phpinfo .e { font-weight: bold; vertical-align: top; background-color: #f0f0f0 }
#phpinfo .scroll { overflow: auto }
#phpinfo img { float: right }

#phpinfo h3 { font-size: 150%; }
#phpinfo h4 { font-size: 140%; background: #6c7eb7; padding: 4px 6px; color: white; border-radius: 0px 20px 20px 0px; margin-top: 40px;}
</style>

<h2 class="sub_headline">phpinfo()</h2>
<div id="phpinfo">
<?php

ob_start();
phpinfo();
$phpinfo = ob_get_contents();
ob_end_clean();

// get content of phpinfo only
$phpinfo = preg_replace('%^.*<body>(.*)</body>.*$%ms', '$1', $phpinfo);

// adapt table layout
$phpinfo = str_replace('<table border="0" cellpadding="3" width="600">', '<table border="1" cellpadding="3">', $phpinfo);

// remove blank at end of table data
$phpinfo = str_replace(' </td>', '</td>', $phpinfo);

// remove a-tags from h2
$phpinfo = preg_replace('%<h2><a .*>(.*)</a></h2>%', '<h2>$1</h2>', $phpinfo);

$phpinfo = preg_replace('%<h1>(.*)</h1>%', '<h3>$1</h3>', $phpinfo);
$phpinfo = preg_replace('%<h2>(.*)</h2>%', '<h4>$1</h4>', $phpinfo);

// add div container to cell content because of overflow=auto
$phpinfo = preg_replace('%<td class="v">(.*?)</td>%', '<td class="v"><div class="scroll">$1</div></td>', $phpinfo);
$phpinfo = preg_replace('%<td class="e">(.*?)</td>%', '<th class="v"><div class="scroll">$1</div></th>', $phpinfo);

//$phpinfo = preg_replace('%<td class="v">(.*)</td>%', '<th class="v">$1</th>', $phpinfo);

// output
echo $phpinfo;
}
?>
</div>