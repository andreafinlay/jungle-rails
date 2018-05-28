# Jungle

Jungle is a mini e-commerce application. :credit_card:

Jungle displays a list of products which can be purchased. Products are created by an administrator and placed into a category. Any user can then view the products, add them to a cart, and proceed to checkout with [Stripe](https://stripe.com/ca) using a credit card. Order confirmations are sent out to clients using [Mailgun](https://www.mailgun.com/). If users decide to register an account, they may also leave a review and rating of a given product.

This app was built using [Rails](https://rubyonrails.org/).

## Final Products

Home page

!["home"]()

Product page

!["product"]()

Cart

!["cart"]()

Order confirmation

!["order"]()

Admin - products

!["admin-products"]()

Admin - categories

!["admin-categories"]()

## Getting Started

1. From the root directory, install dependencies (`bundle install`).
2. Create `config/database.yml` by copying `config/database.example.yml`.
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
4. Run `bin/rake db:reset` to create, load and seed the database.
5. Create `.env` file based on `.env.example`.
6. Sign up for a [Stripe](https://stripe.com/ca) account.
7. Put Stripe (test) keys into appropriate .env vars.
8. Repeat steps 7 and 8 with [Mailgun](https://www.mailgun.com/).
9. Run `bin/rails s -b 0.0.0.0` to start the server.

## Stripe Testing

Use credit card # 4111 1111 1111 1111 for testing success scenarios.

More information in Stripe's docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* [Bcrypt](https://github.com/codahale/bcrypt-ruby)
* [Mailgun](https://www.mailgun.com/)
* [PostgreSQL 9.x](https://www.postgresql.org/)
* [Rails 4.2](http://guides.rubyonrails.org/v4.2/)
* [Stripe](https://stripe.com/ca)
