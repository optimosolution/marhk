<?php
// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * $ModDesc
 *  
 * @version   $Id: helper.php $Revision
 * @package   modules
 * @subpackage  $Subpackage
 * @copyright Copyright (C) May 2010 LandOfCoder.com <@emai:landofcoder@gmail.com>. All rights reserved.
 * @website   htt://landofcoder.com
 * @license   GNU General Public License version 2
 */
class lofAccordionHelperProperty extends ipropertyHelperProperty
{
	function __construct(&$db)
	{
		parent::__construct( $db );
	}
	function getProperty($limitstart = 0, $limit = 9999, $debug = null)
	{
		switch($this->get('type'))
		{
			case 'properties':
				$this->_db->setQuery( ipropertyHelperQuery::buildPropertiesQuery($this->_where, $limitstart, $limit, $debug) );
            break;
				
			case 'property':
				$this->_db->setQuery( ipropertyHelperQuery::buildPropertiesQuery($this->_where, 0, 1, $debug) );
			break;

			case 'advsearch':
				$this->_db->setQuery( ipropertyHelperQuery::buildAdvPropertiesQuery($this->_where, $limitstart, $limit, $debug) );
			break;

			default:
				$this->_db->setQuery( ipropertyHelperQuery::buildPropertiesQuery($this->_where, $limitstart, $limit, $debug) );
            break;
				
		}
		$properties  = $this->_db->loadObjectList();
        $settings    = ipropertyAdmin::config();
        $config      = &JFactory::getConfig();
        $tzoffset    = $config->getValue('config.offset');
        $hide_round  = 3;

		$i = 0;
		$property = array();
		if( count($properties) ){
			switch($this->get('type'))
			{
				case 'advsearch':
					foreach($properties AS $p) {
                        $property[$i]->street_address    = ipropertyHTML::getStreetAddress($settings, $p->title, $p->street_num, $p->street, $p->street2, $p->apt, $p->hide_address);
						$property[$i]->id                = $p->id;
						$property[$i]->mls_id            = $p->mls_id;
						$property[$i]->short_description = ($p->short_description) ? $p->short_description : $p->description;
						$property[$i]->city              = $p->city;
						$property[$i]->price             = $p->price;
                        $property[$i]->stype_freq        = $p->stype_freq;
						$property[$i]->beds              = $p->beds;
						$property[$i]->baths             = (!$settings->baths_fraction) ? round($p->baths) : $p->baths; //round to integer if admin setting to show no fractions
						$property[$i]->sqft              = $p->sqft;
						$property[$i]->lat_pos           = ($p->hide_address) ? round($p->latitude, $hide_round) : $p->latitude;
						$property[$i]->long_pos          = ($p->hide_address) ? round($p->longitude, $hide_round) : $p->longitude;
						$property[$i]->price2                = $p->price2;
						
						# Get the thumbnail
                        $property[$i]->thumb             = ipropertyHTML::getThumbnail($p->id, '', '', $settings->thumbwidth);

                        # Format Price and SQft output
                        $property[$i]->formattedprice    = ipropertyHTML::getFormattedPrice($p->price, $p->stype_freq, false, $p->call_for_price);
						$property[$i]->formattedsqft     = number_format($p->sqft);

                        # Get banner display
                        $new                             = ipropertyHTML::isNew($p->created, $settings->new_days);
                        $updated                         = ipropertyHTML::isNew($p->modified, $settings->updated_days);
                        $property[$i]->banner            = ipropertyHTML::displayBanners($p->stype, $new, JURI::root(true), $settings, $updated);

                        //get sef url for use in js
                        $available_cats = ipropertyHTML::getAvailableCats($p->id);
                        $cat_id = $available_cats[0];
                        $property[$i]->proplink          = JRoute::_(ipropertyHelperRoute::getPropertyRoute($p->id, $cat_id));
                        $cat_id = '';
						$i++;
					}
				break;

				case 'properties':
                case 'property':
                default:				
                    foreach($properties AS $p) {
                        $property[$i]->street_address = ipropertyHTML::getStreetAddress($settings, $p->title, $p->street_num, $p->street, $p->street2, $p->apt, $p->hide_address);
						$property[$i]->street_num              = $p->street_num;
						$property[$i]->street              = $p->street;
						$property[$i]->locstate              = $p->locstate;
                        $property[$i]->hide_address   = $p->hide_address;
                        $property[$i]->id             = $p->id;
                        $property[$i]->mls_id         = $p->mls_id;
                        $property[$i]->short_description = $p->short_description;
                        $property[$i]->description    = $p->description;
                        $property[$i]->terms          = $p->terms;
                        $property[$i]->stype          = $p->stype;
                        $property[$i]->stype_freq     = $p->stype_freq;
                        $property[$i]->listing_office = $p->listing_office;
                        $property[$i]->city           = $p->city;
                        $property[$i]->locstate       = $p->locstate;
                        $property[$i]->province       = $p->province;
                        $property[$i]->zip            = $p->postcode;
                        $property[$i]->region         = $p->region;
                        $property[$i]->county         = $p->county;
                        $property[$i]->country        = $p->country;
                        $property[$i]->gbase_address  = $p->gbase_address;
                        $property[$i]->concat_address = $p->concat_address;
                        $property[$i]->price          = $p->price;
                        $property[$i]->beds           = $p->beds;
                        $property[$i]->baths          = (!$settings->baths_fraction) ? round($p->baths) : $p->baths; //round to integer if admin setting to show no fractions
                        $property[$i]->sqft           = $p->sqft;
                        $property[$i]->lat_pos        = ($p->hide_address) ? round($p->latitude, $hide_round) : $p->latitude;
                        $property[$i]->long_pos       = ($p->hide_address) ? round($p->longitude, $hide_round) : $p->longitude;
                        $property[$i]->lotsize        = $p->lotsize;
                        $property[$i]->lot_acres      = $p->lot_acres;
                        $property[$i]->yearbuilt      = $p->yearbuilt;
                        $property[$i]->heat           = $p->heat;
                        $property[$i]->cool           = $p->cool;
                        $property[$i]->fuel           = $p->fuel;
                        $property[$i]->garage_type    = $p->garage_type;
                        $property[$i]->garage_size    = $p->garage_size;
                        $property[$i]->zoning         = $p->zoning;
                        $property[$i]->frontage       = $p->frontage;
                        $property[$i]->siding         = $p->siding;
                        $property[$i]->roof           = $p->roof;
                        $property[$i]->propview       = $p->propview;
                        $property[$i]->school_district = $p->school_district;
                        $property[$i]->lot_type       = $p->lot_type;
                        $property[$i]->style          = $p->style;
                        $property[$i]->hoa            = $p->hoa;
                        $property[$i]->reo            = $p->reo;
                        $property[$i]->hits           = $p->hits;
                        $property[$i]->featured       = $p->featured;
                        $property[$i]->metadesc       = $p->metadesc;
                        $property[$i]->metakey        = $p->metakey;
                        $property[$i]->created        = $p->created;
                        $property[$i]->modified       = $p->modified;
                        $property[$i]->fcreated       = $p->fcreated;
                        $property[$i]->listing_info   = $p->listing_info;
                        $property[$i]->reception      = $p->reception;
                        $property[$i]->tax            = $p->tax;
                        $property[$i]->income         = $p->income;
                        $property[$i]->vtour          = $p->vtour;
                        $property[$i]->video          = $p->video;
						$property[$i]->price2                = $p->price2;

                        # Get the thumbnail
                        $property[$i]->thumb          = ipropertyHTML::getThumbnail($p->id, '', '', $settings->thumbwidth);

                        # Format Price and SQft output
                        //$property[$i]->formattedprice = ipropertyHTML::getFormattedPrice($p->price, $p->stype_freq, false, $p->call_for_price);
                        $property[$i]->formattedprice = ipropertyHTML::getFormattedPrice($p->price, $p->stype_freq, false, $p->call_for_price, $p->price2);
                        $property[$i]->formattedsqft  = number_format($p->sqft);

                        # Get last modified date if available
                        //$property[$i]->last_updated   = ($p->modified != '0000-00-00 00:00:00') ? JFactory::getDate($p->modified)->format(JText::_('COM_IPROPERTY_DATE_FORMAT_MODIFIED'), $tzoffset) : '';
                        $property[$i]->last_updated   = ($p->modified != '0000-00-00 00:00:00') ? JHTML::_('date', htmlspecialchars($p->modified),JText::_('DATE_FORMAT_LC2'), $tzoffset) : '';

                        //get sef url for use in js
                        $available_cats = ipropertyHTML::getAvailableCats($p->id);
                        $cat_id = $available_cats[0];
                        $property[$i]->proplink       = JRoute::_(ipropertyHelperRoute::getPropertyRoute($p->id, $cat_id));
                        $cat_id = '';
                        $i++;
                    }
                break;
            }
        }

		return $property;
	}
}