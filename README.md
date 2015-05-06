# Guide To Be

## Team

Developed by Dr Ed Wallitt (backend) and Jamie Peak (frontend) for [Podmedics](http://podmedics.org)

## The Project

A website for brides to look up local supplier in their wedding city and leave reviews.

Suppliers can pay to 'claim their business page' offering them some improved functionality r.e. presenting their supplier page.

## Ruby and Rails

Built using Ruby 2.0 and Rails 4

Database is sqlite for development/test, and postgresql in production

Designed for deployment on [Heroku](http://www.heroku.com)

## Running the app locally

Note: this assumes that you have both Ruby 2.0 and bundler installed. If not please run the [Rails Installer](http://railsinstaller.org/en).

You will also need to be run Postgresql locally. An excellent installation guide can be found [here](https://www.digitalocean.com/community/articles/how-to-setup-ruby-on-rails-with-postgres)

- Clone the [repository](https://github.com/Podmedics/GuideToBe)
- Install the required gems

```bundle install```

- Migrate the database and add some seed data

```rake db:setup```

- Set your environment variables

You will need to set the following in a new file at config/application.yml

- SECRET_KEY_BASE (this will allow sessions to be secure)
- STRIPE KEYS (please contact us for more information)
- FILEPICKER KEYS (please contact us for more information)

- Run the app!

```rails server```

## Running the test suit

Unit and controller specs are handled by rspec, features by cucumber

- Prepare the test database

```bundle exec rake db:test:prepare```

- Run all the unit and controller specs

```bundle exec rspec```

Cucumber (integration/feature) tests can be run using:

```bundle exec cucumber```

## Licensing

Copyright (c) 2013 Podmedics. See the LICENSE file for license rights and limitations (GNU).




