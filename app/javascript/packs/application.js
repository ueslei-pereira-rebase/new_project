// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
require("turbolinks").start()
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('../stylesheets/application')
require('packs/forms')
Rails.start()
ActiveStorage.start()
