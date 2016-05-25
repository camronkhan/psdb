# SSC Product Support

http://ssc-product-support.herokuapp.com

## Description

SSC Product Support is a web application designed to store searchable product, technical support, and repair service information for access by SSC agents during customer interactions by incorporating the following features:
- Fuzzy search
- Dynamic search criteria
- Tags
- Sorting
- Updates via multiple users / teams
- Embedded multimedia
- Responsive web design
- Data integrity and consistency

## The Problem
This solution addresses four opportunities regarding (1) searchability, (2) accessibility, (3) data integrity, and (4) data consistency. Addressing these four opportunities will provide agents with the means to efficiently access and conduct queries on accurate and consistent product data.  Ultimately, this will lead to reduced customer effort, call time, redirects, and escalations.

###Searchability
In the current Product Support List, users must type exact strings in order to locate a desired product.  For example, in order to locate the LEX L10, the user must type “LEX L10” in the search field.  The user cannot simply type “LEX” as there are multiple products beginning with this stem.  Nor can the user type “L10” as this would result in a collision with the L1000 – a distinct and unrelated product.  Our solution implements a fuzzy search algorithm that returns multiple search results ranked by relevance.  This method allows a wide net to be cast, which prevents filtering out true positives.  In addition, the tool provides users with the ability to search the Motorola Solutions homepage and Google from the same search bar.

###Accessibility & Data Integrity
Compass document statistics show that from 2006-2016 the average number of downloads of the Product Supported List is roughly 26 per day.  As far as is known, Compass does not differentiate between independent users, and therefore, does not account for the same user downloading the list multiple times per day (whether intentionally or accidentally).  Consequently, it is probable that the true average number of downloads per day is less than 26.  Given that the estimated number of users who should be accessing this tool on a daily basis is much higher than 26, it is likely an accessibility issue exists related to the steps of locating the document on Compass, downloading it, and opening it in Microsoft Excel.  The accessibility problem, however, further implies there is a lurking data integrity problem.  If users are re-opening the same document (if opening the document at all) rather than downloading a new version daily, there is no guarantee they are communicating accurate information to customers.  Our solution provides an easily accessible user interface via a web application, requiring no downloads and providing up-to-date information.

###Data Consistency
The Product Supported List currently has 2,200+ rows of product data stored in an Excel spreadsheet, each requiring manual updates.  In addition, there are groups of products all requiring the same information for many of their columns.  These conditions allow opportunities for human error, and in turn, inconsistent data.  Our solution stores product information in relational tables, and as a result, structure is imposed on the data while at the same time minimizing its duplication.