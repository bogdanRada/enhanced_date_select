ENV['RAILS_ENV'] = 'test'
require 'rubygems'
require 'bundler/setup'

require 'coveralls'
Coveralls.wear!

require 'rails'
require 'action_view'
require 'enhanced_date_select'
require 'nokogiri'
require 'lorax/signature'
