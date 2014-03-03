## README

### Usage
* `bundle install`
* Export your single-user OAuth credentials as environment variables.
* Set the correct Desk.com subdomain in `config/application.
* For test and development the Rails secret is generated junk. On production, you'll need to export something appropriate as `SECRET_TOKEN`.
* Run tests: `rspec`

### About.
This application uses SQLite locally and Postgres on the server. Though at this point it doesn't actually use the database to story anything at all.

More later.

### Next extensions (things I punted on)
* ETags and caching in general
