# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create([
	{ company_id: 1, name: 'APX 1000', image_url: 'http://www.motorolasolutions.com/content/dam/msi/images/products/two-way-radios/apx/APX1000/APX_1000_Image1_LG.jpg'},
	{ company_id: 1, name: 'APX 1500', image_url: 'http://www.motorolasolutions.com/content/dam/msi/images/business/products/two-way_radios/portable_radios/apx_1500/_images/apx1500_main_324x324_lg.jpg'},
	{ company_id: 3, name: 'AP 7502 DUAL-RADIO ACCESS POINT', image_url: 'https://www.zebra.com/content/dam/MSI_Rebranded/EN_US/Products/Wireless%20LAN/Access%20Points/Dual%20Radio/AP%207502/Technical_Product%20Specs/AP%207502%20spec%20sheet/7502-ISO-v1-TransBk.jpg/_jcr_content/renditions/cq5dam.thumbnail.319.319.png'},
	{ company_id: 2, name: 'VX-264', image_url: 'http://www.vertexstandard.com/lmr/images/products/VX-260.png'}
])

Company.create([
	{ name: 'Motorola Solutions', website_url: 'http://www.motorolasolutions.com/'},
	{ name: 'Vertex Standard', website_url: 'http://www.vertexstandard.com/'},
	{ name: 'Zebra Technologies', website_url: 'https://www.zebra.com/'}
	
])