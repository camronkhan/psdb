// Generated by CoffeeScript 1.10.0
$(function() {
  return $('#global-item-master-product-search').click(function() {
    window.location.href = 'http://shamu.comm.mot.com/cgi-bin/gim_screens/gimqry002?PartNo=' + $('.product-search-bar').val();
    return false;
  });
});

$(function() {
  return $('#oracle-data-warehouse-product-search').click(function() {
    window.location.href = 'http://rpsd.comm.mot.com/oracle_reports/bin/inv_display.asp?tb_material_nb=' + $('.product-search-bar').val();
    return false;
  });
});

$(function() {
  return $('#msi-product-search').click(function() {
    window.location.href = 'http://www.motorolasolutions.com/en_us/search.html?q=' + $('.product-search-bar').val();
    return false;
  });
});

$(function() {
  return $('#google-product-search').click(function() {
    window.location.href = 'https://www.google.com/?gws_rd=ssl#safe=active&q=' + $('.product-search-bar').val();
    return false;
  });
});
