/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./modules/delivery-time/assets/src/js/store-location-pickup.js":
/*!**********************************************************************!*\
  !*** ./modules/delivery-time/assets/src/js/store-location-pickup.js ***!
  \**********************************************************************/
/***/ (() => {

eval(";\n(function ($) {\n  var Dokan_Store_Location_Pickup_Settings = {\n    add_location_section: $('#dokan-add-store-location-section'),\n    show_store_location_section_btn: $('#show-add-store-location-section-btn'),\n    cancel_add_location_action: $('#cancel-store-location-section-btn'),\n    store_location_save_btn: $('#dokan-save-store-location-btn'),\n    store_location_list_table: $('#store-pickup-location-list-table'),\n    store_location_action: $('.dokan-store-location-action'),\n    store_location_edit_btn: $('.store-pickup-location-edit-btn'),\n    store_location_delete_btn: $('.store-pickup-location-delete-btn'),\n    store_location_action_wrapper: $('.store-pickup-location-action-wrapper'),\n    multiple_store_location_checkbox: $('#multiple-store-location'),\n    store_location_edit_section: $('#dokan-store-location-edit-section'),\n    store_location_main_section: $('.dokan-store-location-main-section'),\n    store_location_edit_index: document.getElementById('store-location-edit-index'),\n    store_location_name_input: document.getElementById('store-location-name-input'),\n    store_location_street_1_input: document.getElementById('dokan_address[street_1]'),\n    store_location_street_2_input: document.getElementById('dokan_address[street_2]'),\n    store_location_city_input: document.getElementById('dokan_address[city]'),\n    store_location_zip_code_input: document.getElementById('dokan_address[zip]'),\n    store_location_country_input: document.getElementById('dokan_address_country'),\n    store_location_state_input: document.getElementById('dokan_address_state'),\n    init: function init() {\n      Dokan_Store_Location_Pickup_Settings.trigger_store_location_pickup_settings();\n    },\n    trigger_store_location_pickup_settings: function trigger_store_location_pickup_settings() {\n      var self = this;\n      self.show_store_location_section_btn.on('click', function (e) {\n        e.preventDefault();\n        self.store_location_action_wrapper.hide();\n        self.store_location_action.hide();\n        self.open_store_location_section(true);\n      });\n      self.cancel_add_location_action.on('click', function (e) {\n        e.preventDefault();\n        self.reset_form_fields();\n        self.store_location_action_wrapper.show();\n        self.store_location_action.show();\n        self.open_store_location_section(false);\n      });\n      self.store_location_save_btn.on('click', function (e) {\n        e.preventDefault();\n        var data = {\n          index: self.store_location_edit_index.value,\n          location_name: self.store_location_name_input.value,\n          street_1: self.store_location_street_1_input.value,\n          street_2: self.store_location_street_2_input.value,\n          city: self.store_location_city_input.value,\n          zip: self.store_location_zip_code_input.value,\n          country: self.store_location_country_input.value,\n          state: $('#dokan_address_state').val(),\n          is_multiple_enable: self.multiple_store_location_checkbox.val()\n        };\n        if (false === self.validate_location_data(data)) {\n          return;\n        }\n\n        // Saving store location to Database\n        $.ajax({\n          url: dokan.ajaxurl,\n          method: 'post',\n          data: {\n            action: 'dokan_store_location_save_item',\n            _wpnonce: dokan.nonce,\n            data: data,\n            index: data.index\n          }\n        }).done(function (response) {\n          if (response.success) {\n            window.location.reload(false);\n          }\n        }).fail(function (jqXHR, status, error) {\n          if (jqXHR.responseJSON.data.message) {\n            dokan_sweetalert(jqXHR.responseJSON.data.message, {\n              icon: 'error'\n            });\n          }\n        });\n      });\n      self.store_location_delete_btn.on('click', function (e) {\n        e.preventDefault();\n        var location_index = $(this).data('location-index');\n\n        // Deleting store location\n        $.ajax({\n          url: dokan.ajaxurl,\n          method: 'post',\n          data: {\n            action: 'dokan_store_location_delete_item',\n            _wpnonce: dokan.nonce,\n            index: location_index\n          }\n        }).done(function (response) {\n          if (response.success) {\n            window.location.reload(false);\n          }\n        }).fail(function (jqXHR) {\n          if (jqXHR.responseJSON && jqXHR.responseJSON.data && jqXHR.responseJSON.data.length) {\n            dokan_sweetalert(jqXHR.responseJSON.data.pop().message, {\n              icon: 'error'\n            });\n          }\n        });\n      });\n      self.store_location_edit_btn.on('click', function (e) {\n        e.preventDefault();\n        var location = $(this).data('location');\n        var location_index = $(this).data('location-index');\n        self.store_location_action_wrapper.hide();\n        self.store_location_edit_index.value = location_index;\n        self.populate_address_form_data(location);\n        self.state_select(location);\n        self.store_location_action.hide();\n        self.open_store_location_section(true);\n        self.store_location_state_input.value = location.state;\n      });\n      self.multiple_store_location_checkbox.on('change', function () {\n        if (this.checked) {\n          self.multiple_store_location_checkbox.val(\"yes\");\n          self.reset_form_fields();\n          self.cancel_add_location_action.show();\n          self.store_location_main_section.show();\n          self.open_store_location_section(false);\n        } else {\n          self.store_location_edit_index.value = 0;\n          self.multiple_store_location_checkbox.val(\"no\");\n          self.restore_default_address_fields();\n          self.cancel_add_location_action.hide();\n          self.store_location_main_section.hide();\n          self.open_store_location_section(true);\n        }\n      }).trigger('change');\n    },\n    state_select: function state_select(location) {\n      var states_json = wc_country_select_params.countries.replace(/&quot;/g, '\"');\n      var states = $.parseJSON(states_json);\n      var state_box = $('#dokan_address_state');\n      var input_name = state_box.attr('name');\n      var input_id = state_box.attr('id');\n      var input_class = state_box.attr('class');\n      var selected_state = location.state;\n      var input_selected_state = location.state;\n      var country = $('#dokan_address_country').val();\n      var selected_value;\n      if (states[country]) {\n        if ($.isEmptyObject(states[country])) {\n          $('div#dokan-states-box').slideUp(2);\n          if (state_box.is('select')) {\n            $('select#dokan_address_state').replaceWith('<input type=\"text\" class=\"' + input_class + '\" name=\"' + input_name + '\" id=\"' + input_id + '\" required />');\n          }\n          $('#dokan_address_state').val('N/A');\n        } else {\n          var options = '';\n          var state = states[country];\n          for (var index in state) {\n            if (state.hasOwnProperty(index)) {\n              if (selected_state) {\n                if (selected_state === index) {\n                  selected_value = 'selected=\"selected\"';\n                } else {\n                  selected_value = '';\n                }\n              }\n              options = options + '<option value=\"' + index + '\"' + selected_value + '>' + state[index] + '</option>';\n            }\n          }\n          if (state_box.is('select')) {\n            $('select#dokan_address_state').html('<option value=\"\">' + wc_country_select_params.i18n_select_state_text + '</option>' + options);\n          }\n          if (state_box.is('input')) {\n            $('input#dokan_address_state').replaceWith('<select type=\"text\" class=\"' + input_class + '\" name=\"' + input_name + '\" id=\"' + input_id + '\" required ></select>');\n            $('select#dokan_address_state').html('<option value=\"\">' + wc_country_select_params.i18n_select_state_text + '</option>' + options);\n          }\n          $('#dokan_address_state').removeClass('dokan-hide');\n          $('div#dokan-states-box').slideDown();\n        }\n      } else {\n        if (state_box.is('select')) {\n          input_selected_state = location.state;\n          $('select#dokan_address_state').replaceWith('<input type=\"text\" class=\"' + input_class + '\" name=\"' + input_name + '\" id=\"' + input_id + '\" required=\"required\"/>');\n        }\n        $('#dokan_address_state').val(input_selected_state);\n        if ($('#dokan_address_state').val() == 'N/A') {\n          $('#dokan_address_state').val('');\n        }\n        $('#dokan_address_state').removeClass('dokan-hide');\n        $('div#dokan-states-box').slideDown();\n      }\n    },\n    open_store_location_section: function open_store_location_section(open) {\n      if (open) {\n        this.add_location_section.show(300);\n        this.show_store_location_section_btn.hide(300);\n      } else {\n        this.add_location_section.hide(300);\n        this.show_store_location_section_btn.show(300);\n      }\n    },\n    reset_form_fields: function reset_form_fields() {\n      this.store_location_edit_index.value = '';\n      this.store_location_name_input.value = '';\n      this.store_location_street_1_input.value = '';\n      this.store_location_street_2_input.value = '';\n      this.store_location_city_input.value = '';\n      this.store_location_zip_code_input.value = '';\n      this.store_location_country_input.value = '';\n      this.store_location_state_input.value = '';\n    },\n    validate_location_data: function validate_location_data(data) {\n      if (!data.location_name) {\n        dokan_sweetalert(dokan.i18n_location_name, {\n          icon: 'error'\n        });\n        return false;\n      }\n      if ($('#dokan_address_state').attr('required') && $('#dokan_address_state').is(':visible') && !data.state) {\n        var stateName = $('#dokan_address_state').data('state');\n        dokan_sweetalert(\"\".concat(dokan.i18n_location_state, \" \").concat(stateName ? stateName : ''), {\n          icon: 'error'\n        });\n        return false;\n      }\n      if (!data.country) {\n        dokan_sweetalert(dokan.i18n_country_name, {\n          icon: 'error'\n        });\n        return false;\n      }\n      return true;\n    },\n    populate_address_form_data: function populate_address_form_data(location) {\n      this.store_location_name_input.value = location.location_name;\n      this.store_location_street_1_input.value = location.street_1;\n      this.store_location_street_2_input.value = location.street_2;\n      this.store_location_city_input.value = location.city;\n      this.store_location_zip_code_input.value = location.zip;\n      this.store_location_country_input.value = location.country;\n    },\n    restore_default_address_fields: function restore_default_address_fields() {\n      if (typeof dokan_vendor_default_address === 'undefined') {\n        return;\n      }\n      if (dokan_vendor_default_address.length === 0) {\n        return;\n      }\n      var default_address = dokan_vendor_default_address;\n      this.populate_address_form_data(default_address);\n      this.state_select(default_address);\n    }\n  };\n  jQuery(document).ready(function ($) {\n    Dokan_Store_Location_Pickup_Settings.init();\n  });\n})(jQuery);\n\n//# sourceURL=webpack://dokan-pro/./modules/delivery-time/assets/src/js/store-location-pickup.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./modules/delivery-time/assets/src/js/store-location-pickup.js"]();
/******/ 	
/******/ })()
;