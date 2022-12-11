# Jungle

The Jungle web application is a mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. This project was meant to be an introduction to the role of a junior developer in the real world, where one could apply for a job and might need to learn a new tech stack.

I was provided with pre built app in which I had to seek out and correct various errors. Errors that I fixed include the following: 
* Money formatting and adding dollar signs to all prices across the site.
* Modified checkout cart page so that checkout button is only shown if items are in cart. If no items in cart user met with an "empty cart" page.
* Added a sold out badge for when an item has 0 quantity.
* Adjusted the order show page so that it displays line items in order, image, name, description, respective quantities, final amount for order and the email that was used for the purchase.
* Implemented admin security using http basic authentication for tasks (dashboard, product addition, category creation)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
