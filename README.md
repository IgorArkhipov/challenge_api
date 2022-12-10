# README

The goal of this API is to propose the right partner based on the details of a customer's flooring project.

This API offers the following functionality:
* Based on a customer-request, return a list of partners that offer the service. The list
should be sorted by 'best match'. The quality of the match is determined first on
average rating and second by distance to the customer.
* For a specific partner, return the detailed partner data.

The data in the request from the customer is:
* Material for the floor (wood, carpet, tiles)
* Address (assume that this is the lat/long of the house)
* Square meters of the floor
* Phone number (for the partner to contact the customer)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
