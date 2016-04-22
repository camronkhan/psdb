# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create([
	{ name: 'No Information Available' },
	{ name: 'Motorola Solutions', website_url: 'http://www.motorolasolutions.com/' },
	{ name: 'Vertex Standard', website_url: 'http://www.vertexstandard.com/' },
	{ name: 'Emergency CallWorks', website_url: 'https://www.emergencycallworks.com/' },
	{ name: 'Zebra Technologies', website_url: 'https://www.zebra.com/' },
	{ name: 'Motorola Mobility', website_url: 'http://www.motorola.com/' },
	{ name: 'Cambium Networks', website_url: 'http://www.cambiumnetworks.com/' },
	{ name: 'NICE Systems', website_url: 'http://www.nice.com/' },
	{ name: 'Airbus DS Communications', website_url: 'http://www.airbus-dscomm.com/' },
	{ name: 'ASTRON Corporation', website_url: 'http://www.astroncorp.com/' },
	{ name: 'Avaya', website_url: 'http://www.avaya.com/' },
	{ name: 'CommScope', website_url: 'http://www.commscope.com/' },
	{ name: 'AVTEC', website_url: 'http://www.avtecinc.com/' },
	{ name: 'GAI-Tronics', website_url: 'https://www.gai-tronics.com/' },
	{ name: 'VMware', website_url: 'http://www.vmware.com/' },
	{ name: 'Giant International', website_url: 'https://shop.giantintl.com/' },
	{ name: 'Cellstar' },
	{ name: 'Locus Diagnostics', website_url: 'http://www.locususa.com/' },
	{ name: 'Futurecom', website_url: 'http://www.futurecom.com/' },
	{ name: 'EMR Corp', website_url: 'http://www.emrcorp.com/' },
	{ name: 'Arden Design Center (ADC)' }
])

Product.create([
	{ company_id: 2, name: 'APX 1000', image_url: 'http://www.motorolasolutions.com/content/dam/msi/images/products/two-way-radios/apx/APX1000/APX_1000_Image1_LG.jpg'},
	{ company_id: 2, name: 'APX 1500', image_url: 'http://www.motorolasolutions.com/content/dam/msi/images/business/products/two-way_radios/portable_radios/apx_1500/_images/apx1500_main_324x324_lg.jpg'},
	{ company_id: 5, name: 'AP 7502 DUAL-RADIO ACCESS POINT', image_url: 'https://www.zebra.com/content/dam/MSI_Rebranded/EN_US/Products/Wireless%20LAN/Access%20Points/Dual%20Radio/AP%207502/Technical_Product%20Specs/AP%207502%20spec%20sheet/7502-ISO-v1-TransBk.jpg/_jcr_content/renditions/cq5dam.thumbnail.319.319.png'},
	{ company_id: 3, name: 'VX-264', image_url: 'http://www.vertexstandard.com/lmr/images/products/VX-260.png'}
])

Technologist.create([
	{ name: 'Technical Support Not Available' },
	{ name: 'SSC APX', internal_phone: 'XGPS-SSC APX', external_phone: '800-422-4210 Options 3 > 3', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'Vertex Standard', internal_phone: 'XGPS-Vertex Tech Support', external_phone: '800-283-7839', hours: 'M-F 7:00a-7:00p CST', escalation: 'Contact Greg Spears (CGS006)' },
	{ name: 'Zebra Technologies', external_phone: '800-653-5350' },
	{ name: 'Cambium Networks', external_phone: '888-863-5250' },
	{ name: 'CCS Business Radio', internal_phone: 'XGPS-CCS RBR Support', hours: 'M-F 8:00a-5:00p CST' },
	{ name: 'CCS Customer Service', internal_phone: 'XGPS-CCS Dealer Support', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'CCS Learning Management System (LMS)', internal_phone: 'XGPS-CCS LMS', hours: 'M-F 7:00a-6:00p CST' },
	{ name: 'CCS Motorola Online (MOL)', internal_phone: 'XGPS-CCS MOL', hours: 'M-F 7:00a-6:00p CST' },
	{ name: 'GAI-Tronics Support', external_phone: '800-492-1212' },
	{ name: 'iDEN Dispatch', internal_phone: 'XGPS-iDEN Dispatch', hours: 'M-F 7:00a-3:00a CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'iDEN iBSC / Harmony / LTE / VPU', internal_phone: 'XGPS-iDEN iBSC', hours: 'M-F 7:30a-10:30p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'iDEN Melody / Harmony / EBTS', internal_phone: 'XGPS-iDEN Melody', hours: 'M-F 7:30a-10:30p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'iDEN OMC / Oracle', internal_phone: 'XGPS-iDEN OMC', hours: 'M-F 24x5', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'IDEN Overall / System', internal_phone: 'XGPS-iDEN Overall', hours: 'M-F 9:00a-3:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'iDEN Packet Data', internal_phone: 'XGPS-iDEN Packet', hours: 'M-F 7:00a-3:00a CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'iDEN Switching / MSC', internal_phone: 'XGPS-iDEN Switching', hours: 'M-F 6:00a-3:30a CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SPSS CAD', internal_phone: 'XGPS-PSA-CAD' },
	{ name: 'SPSS CSR 311', internal_phone: 'XGPS-PSA CSR 311' },
	{ name: 'SPSS Jail Management', internal_phone: 'XGPS-PSA Jail Sys' },
	{ name: 'SPSS LRMS', internal_phone: 'XGPS-PSA LRMS' },
	{ name: 'SPSS Mobile Applications', internal_phone: 'XGPS-PSA Mob Apps' },
	{ name: 'SPSS Salt Lake', internal_phone: 'XGPS-PSA RMS' },
	{ name: 'SSC ASTRO 25', internal_phone: 'XGPS-SSC Astro25', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC ASTRO Consoles', internal_phone: 'XGPS-SSC Console Astro', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC ASTRO Legacy', internal_phone: 'Subscriber - Astro Legacy Subs', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC Console Voice Systems', internal_phone: 'XGPS-SSC Console Voice Systems', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC Data Infrastructure', internal_phone: 'XGPS-SSC Data Infrastructure', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC Dispatch Services', internal_phone: 'XGPS-SSC Dispatch Services', hours: '24x7x365' },
	{ name: 'SSC LTE Handheld', internal_phone: 'XGPS-SSC LTE HANDHELD', hours: 'M-F 7:00a-7:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SSC LTE TSO', internal_phone: 'XGPS-SSC LTE TSO', hours: 'M-F 6:00a-5:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SSC LTE Provisioning', internal_phone: 'XGPS-SSC LTE PROV', hours: 'M-F 7:00a-7:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SSC LTE VSM', internal_phone: 'XGPS-SSC LTE VSM', hours: 'M-F 7:00a-7:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SSC MC Series Desksets & Paging', internal_phone: 'XGPS-SSC MC Series Deskset', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC MOSCAD', internal_phone: 'XGPS-SSC Data Infrastructure', hours: 'M-F 7:00a-7:00p CST', escalation: '24x7 on-call support for Sev 1 / Sev 2 issues' },
	{ name: 'SSC MOTOTRBO Applications', internal_phone: 'XGPS-SSC TRBO Apps', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC MOTOTRBO Connect Plus', internal_phone: 'XGPS-SSC Connect Plus', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC MOTOTRBO Digital Conventional', internal_phone: 'XGPS-SSC TRBO Digital Conv', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC MOTOTRBO IP Site Connect', internal_phone: 'XGPS-SSC IP Site Connect', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC Network Monitoring Operations (NMO)', internal_phone: 'XGPS-SSC NMO', hours: '24x7x365' },
	{ name: 'SSC PCR Analog', internal_phone: 'XGPS-SSC PCR ANALOG', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC Presales', internal_phone: 'XGPS-SSC Presale', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC SmartNet', internal_phone: 'XGPS-SSC Smartnet', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'SSC XTS / XTL', internal_phone: 'XGPS-SSC XTS/XTL', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'Vertex Standard Online (VSOL)', internal_phone: 'XGPS-Vertex VSOL', hours: 'M-F 7:00a-7:00p CST', escalation: 'Contact Greg Spears (CGS006)' },
	{ name: 'Twisted Pair', external_phone: '206-812-2390', hours: 'M-F 10:00a-8:00p CST' },
	{ name: 'Giant International', external_phone: '800-353-2729', hours: 'M-F 7:00a-7:00p CST' },
	{ name: 'Motorola Mobility', external_phone: '800-331-6456' },
	{ name: 'Advance Tec Industries', external_phone: '866-881-8211' },
	{ name: 'Futurecom', external_phone: '800-701-9180' },
	{ name: 'Emergency Callworks', external_phone: '855-329-1911' }
])

Servicer.create([
	{ name: 'Repair Service Not Available' },
	{ name: 'Motorola Repair Center (MRC) - El Paso', internal_phone: 'XGPS-CCS Radio Repair', address: '1220 Don Haskins Dr, Suite A, El Paso, TX 79936' },
	{ name: 'Vertex Standard Repair Center', external_phone: '800-283-7839', address: '7201-A Intermodal Drive, Louisville KY 40258' },
	{ name: 'Zebra Technologies', external_phone: '800-653-5350' },
	{ name: 'Motorola Repair Center (MRC) - Elgin', internal_phone: 'XGPS-CCS Radio Repair', address: '2204 Galvin Dr, Elgin, IL 60124' },
	{ name: 'Infrastructure Depot Operations (IDO)', internal_phone: 'XGPS-SSC Return Authorization', address: '2214 Galvin Dr, Elgin, IL 60124' },
	{ name: 'AdvanceTec Industries', external_phone: '866-881-8211' },
	{ name: 'Astron Corp', external_phone: '949-458-7277' },
	{ name: 'AvtechTyee', external_phone: '425-290-3100 ' },
	{ name: 'Cadex Electronics', external_phone: '800-565-5228' },
	{ name: 'David Clark Co', external_phone: '508-751-5800' },
	{ name: 'Motorola Federal Technical Center', internal_phone: 'XGPS-CCS Fed Govt', external_phone: '800-969-6680', address: '10105 Senate Dr, Lanham, MD 20706' },
	{ name: 'Gamber Johnson', external_phone: '800-456-6868 x301' },
	{ name: 'Giant International', external_phone: '800-353-2729' },
	{ name: 'GAI-Tronics', external_phone: '800-492-1212' },
	{ name: 'Global Data Specialists', external_phone: '800-451-3464' },
	{ name: 'International Radio Repair', internal_phone: 'XGPS-CCS INTL' },
	{ name: 'Microwave Data Systems', external_phone: '585-242-9600' },
	{ name: 'Microwave Network', external_phone: '800-545-0334' },
	{ name: 'Newmar', external_phone: '800-854-3906' },
	{ name: 'Business Radio Repair', internal_phone: 'XGPS-CCS RBR Dealer Support' },
	{ name: 'Telex', external_phone: '800-898-6723' },
	{ name: 'TPL Communications', external_phone: '323-256-3000' },
	{ name: 'Zetron', external_phone: '425-820-6363' },
	{ name: 'Lorain Reltec Network', external_phone: '800-752-8733 x116' },
	{ name: 'Cambium Networks', external_phone: '888-863-5250' },
	{ name: 'Futurecom', external_phone: '800-701-9180' }
])

TechnologistAssignment.create([
	{ product_id: '1', technologist_id: '2', condition: 'All' },
	{ product_id: '2', technologist_id: '2', condition: 'All' },
	{ product_id: '3', technologist_id: '4', condition: 'All' },
	{ product_id: '4', technologist_id: '3', condition: 'All' }
])

ServicerAssignment.create([
	{ product_id: '1', servicer_id: '2', condition: 'All' },
	{ product_id: '2', servicer_id: '2', condition: 'All' },
	{ product_id: '3', servicer_id: '4', condition: 'All' },
	{ product_id: '4', servicer_id: '3', condition: 'All' }
])