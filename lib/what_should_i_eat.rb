# frozen_string_literal: true

require_relative "what_should_i_eat/version"
require 'nokogiri'
require 'http'
require 'json'
require 'open-uri'

module WhatShouldIEat
  class Error < StandardError; end
  # Your code goes here...
  search_result = HTTP.get('https://www.edamam.com/search?type=Feeds').to_s
  recipes = JSON.parse(search_result)
  name = recipes.first['items'].first['label'] 
  url = recipes.first['items'].first['url']

  Printing.print name, url

end
