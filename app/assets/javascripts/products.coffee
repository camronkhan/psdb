#=======================================================
# Use value from search bar to search Global Item Master
#=======================================================
$ ->
	$('#global-item-master-product-search').click ->
	    window.location.href = 'http://shamu.comm.mot.com/cgi-bin/gim_screens/gimqry002?PartNo=' + $('.product-search-bar').val()
	    false

#==========================================================
# Use value from search bar to search Oracle Data Warehouse
#==========================================================
$ ->
	$('#oracle-data-warehouse-product-search').click ->
	    window.location.href = 'http://rpsd.comm.mot.com/oracle_reports/bin/inv_display.asp?tb_material_nb=' + $('.product-search-bar').val()
	    false

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