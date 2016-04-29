# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#=============================================
# Use value from search bar to search MSI.com
#=============================================
$ ->
	$('#msi-product-search').click ->
	    window.location.href = 'http://www.motorolasolutions.com/en_us/search.html?q=' + $('.product-search-bar').val()
	    false

#============================================
# Use value from search bar to search Google
#============================================
$ ->
	$('#google-product-search').click ->
	    window.location.href = 'https://www.google.com/?gws_rd=ssl#safe=active&q=' + $('.product-search-bar').val()
	    false

#==============================================================
# Provides jQuery UI Autocomplete functionality to select tags
#==============================================================
$ ->
	$('#product_tag_list').autocomplete source: '/tags'