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

Technologist.create([
	{ name: 'SSC APX', internal_phone: 'XGPS-SSC APX', external_phone: '800-422-4210 Options 3 > 3', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'Vertex Standard', internal_phone: 'XGPS-Vertex Tech Support', external_phone: '800-283-7839', hours: 'M-F 7:00a-7:00p CST', escalation: 'Contact Greg Spears (CGS006) regarding escalations' },
	{ name: 'Zebra Technologies', external_phone: '800-653-5350' }
])

Servicer.create([
	{ name: 'Motorola Repair Center (MRC) - El Paso', internal_phone: 'XGPS-CCS Radio Repair', address: '1220 Don Haskins Dr, Suite A, El Paso, TX 79936' },
	{ name: 'Vertex Standard Repair Center', external_phone: '800-283-7839', address: '7201-A Intermodal Drive, Louisville KY 40258' },
	{ name: 'Zebra Technologies', external_phone: '800-653-5350' }
])

TechnologistAssignment.create([
	{ product_id: '1', technologist_id: '1', condition: 'All' },
	{ product_id: '2', technologist_id: '1', condition: 'All' },
	{ product_id: '3', technologist_id: '3', condition: 'All' },
	{ product_id: '4', technologist_id: '2', condition: 'All' }
])

ServicerAssignment.create([
	{ product_id: '1', servicer_id: '1', condition: 'All' },
	{ product_id: '2', servicer_id: '1', condition: 'All' },
	{ product_id: '3', servicer_id: '3', condition: 'All' },
	{ product_id: '4', servicer_id: '2', condition: 'All' }
])