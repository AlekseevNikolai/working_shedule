// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

require("bootstrap")
require('jquery')
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//Vodal function
$(function() {
    const modal_holder_selector = '#modal-holder';
    const modal_selector = '.modal';
  
    $(document).on('click', 'a[data-modal]', function() {
      const location = $(this).attr('href');
      // Load modal dialog from server
      $.get(
        location,
        data => { $(modal_holder_selector).html(data).find(modal_selector).modal() }
      );
      return false;
    });
  
    $(document).on('ajax:success', 'form[data-modal]', function(event){
      const [data, _status, xhr] = event.detail;
      const url = xhr.getResponseHeader('Location');
      if (url) {
        // Redirect to url
        window.location = url;
      } else {
        // Remove old modal backdrop
        $('.modal-backdrop').remove();
        // Update modal content
        const modal = $(data).find('body').html();
        $(modal_holder_selector).html(modal).find(modal_selector).modal();
      }
  
      return false;
    });
  });