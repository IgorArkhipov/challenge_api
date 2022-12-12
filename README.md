# README

The goal of this API is to propose the right partners based on the details of a customer's flooring project.

This API offers the following functionality:
* Based on a customer-request, return a list of partners that offer the service. The list is by 'best match'. The quality of the match is determined first on average rating and second by distance to the customer.
* For a specific partner, return the detailed partner data.

## Requirements

* Ruby version manager (f.e. https://github.com/rbenv/rbenv)

* Ruby version 3.1+

## Installation

* Update Ruby gem manager
  - Run in terminal: `gem update --system`

* Update gems
  - Run in terminal: `gem update`

* Clone the current repository and then run in terminal inside its folder `bundle`

* Database initialization
  - Run in terminal: `rake db:seed`
  - This way you will populate a development environment with test data

## Usage

* Application start
  - Run in terminal: `rails server`
  - Now the application is ready to respond to the incoming requests on http://localhost:3000/

* Authentication
  - To be able to execute requests you should first obtain an authentication token
  - Run in terminal: `curl -X POST --data "client[email]=challenge@aroundhome.de" --data "client[password]=challenge_accepted" http://localhost:3000/api/v1/tokens` and save the provided token

* Application usage
  - List all available partners
  - `curl --header "Authorization: provided_token" --header "Content-Type: application/json" http://localhost:3000/api/v1/partners`

  - List specific partner
  - `curl --header "Authorization: provided_token" --header "Content-Type: application/json" http://localhost:3000/api/v1/partner/<id>`
  - The structure of the partner data is as follows:
    * Experience in flooring materials (wood, carpet, tiles or any combination)
    * Address (latitude and longitude of the office)
    * Operating radius (the beeline from the address)
    * Rating

  - Match partners with the requirements provided
  - The data in the request from the customer is:
    * Material for the floor (wood, carpet, tiles)
    * Address (in the lat/long of the house)
    * Square meters of the floor
    * Phone number
  - Requirements should be provided with the following schema:
    ```
      {
        requirements: {
          latitude: decimal between -90.0 and 90.0,
          longitude: decimal between -180.0 and 180.0,
          square_size: decimal greater or equal 1.0
          phone_number: string,
          material: array of strings
        }
      }
    ```
  - current materials include 'wood', 'carpet' and 'tiles'
  - `curl -X POST --header "Authorization: provided_token" --data "requirements[latitude]=50.37221" --data "requirements[longitude]=7.32442" --data "requirements[material][]=carpet" http://localhost:3000/api/v1/partners/match`
