<?php if (!defined('TL_ROOT')) die('You cannot access this file directly!');

/**
 * Contao Open Source CMS
 * Copyright (C) 2005-2015 Leo Feyer
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
 * @author     µaTh
 * @package    bephpinfo 
 * @license    LGPL 
 * @filesource
 */

class bephpinfo extends BackendModule {

    protected $strTemplate = 'be_phpinfo';

    public function compile() {}
    
    public function generate() {

    // wenn nicht Backend, dann abbrechen
    if (TL_MODE != 'BE') {
      // generate() von der Oberklasse (BackendModule) aufrufen
      return parent::generate();
    } 
    
    $objTemplate = new BackendTemplate('be_phpinfo');
    
    $objTemplate->lang = (object) $GLOBALS['TL_LANG']['be_phpinfo'];
    
    $this->import('BackendUser', 'User');
    $objTemplate->isAdmin = $this->User->isAdmin;
    
    return $objTemplate->parse();
    }

}
?>