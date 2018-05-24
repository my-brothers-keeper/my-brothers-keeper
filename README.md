# My Brother's Keeper

An open source web application for charitable groups who serve Philadelphia's poor to quickly and easily let the community know what items they most urgently need.  Members of these charitable organizations can log in, select from a list of items they accept donations for, and log out in under a minute.  If they feel the need to be more specific, they also have the option to add a comment to any item they select.  

The app's landing page is a map showing the location of each organization.  Donors don't sign up or log in, they can simply click on any organization within the map to see relevant data about each group such as:

* Their current needs

* Contact information

* A brief description of the organization and what they do

* Address (hyperlinked to Google's Navigation Page)

* Website (if applicable)

## Gem Dependencies for Local Development

### Ruby Version
  * Ruby '2.4.1'

### Rails Version 
  * gem 'rails', '~> 5.2.0'

### PostgreSQL
  * gem 'pg'

### Enable Spatial DB Columns with ActiveRecord
  * gem 'activerecord-postgis-adapter'

### Tools for Mapping
  * gem 'rgeo-geojson'
  * gem 'mapbox-gl-rails'

### Password Hashing
  * gem 'bcrypt', '~> 3.1.7'

### JSON Web Tokens
  * gem 'jwt'

### Bootstrap 
  * gem 'bootstrap', '~> 4.1.1'

### Icons for Need Comments
  * gem 'open-iconic-rails'

### LICENSE

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/my-brothers-keeper/my-brothers-keeper/blob/master/LICENSE) file for details


