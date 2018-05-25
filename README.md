# My Brother's Keeper

An open source web application for charitable groups who serve Philadelphia's poor to quickly and easily let the community know what items they most urgently need.  Members of these charitable organizations can log in, select from a list of items they accept donations for, and log out in under a minute.  If they feel the need to be more specific, they also have the option to add a comment to any item they select.  

The app's landing page is a map showing the location of each organization.  Donors don't sign up or log in, they can simply click on any organization within the map to see relevant data about each group such as:

* Their current needs

* Contact information

* A brief description of the organization and what they do

* Address (hyperlinked to Google's Navigation Page)

* Website (if applicable)

## Getting Started

We recommend [Homebrew](https://brew.sh/) for macOS users to make installation of other dependencies easy to understand.

Developers will need to manually install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#homebrew), and [PostgreSQL](https://www.postgresql.org/download/) if you don't already have them.  These links provide detailed instructions for users of various operating systems.

You will also need the ActiveRecord PostGIS Adapter to enable spatial DB columns with PostgreSQL in Rails, which can be found with installation instructions [here](https://github.com/rgeo/activerecord-postgis-adapter).

Ruby v. 2.4.1 is the specific version currently in use in the project.  Assuming you already have [RVM](https://rvm.io/rvm/install), you can run:

```
rvm list
```

to check if you already have this version available.  If not, run:

```
rvm install ruby-2.4.1
```

Once you've cloned and set up this environment, `bundle install` will take care of your other gem dependencies.

### LICENSE

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/my-brothers-keeper/my-brothers-keeper/blob/master/LICENSE) file for details


