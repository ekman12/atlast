import {$,jQuery} from "jquery";
import "bootstrap";

// import { mapInModal } from "./modalMap.js";
// mapInModal();

import { showMap } from "./show_map.js";
showMap()

import { tagSelector } from '../packs/tag-selector';
tagSelector();

import { clickWishlistHeart } from './wishlist_heart';
clickWishlistHeart();

import { followChange } from './follow_change';
followChange();

import { showTags } from './show_tags';
showTags();

import { hideTags } from './hide_tags';
hideTags();


import { showMore } from './show_more';
showMore();

import { initPhotoPreview, checkForPhoto } from './photoPreview';
initPhotoPreview();
checkForPhoto();

// import { postSubmitButton } from './submit-form-btn';
// postSubmitButton();



/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')
