## README

### Usage
* `bundle install`
* Export your single-user OAuth credentials as environment variables.
* Set the correct Desk.com subdomain in `config/application.rb`
* For test and development the Rails secret is generated junk. On production, you'll need to export something appropriate as `SECRET_TOKEN`.
* Run tests: `rspec`

### About.
This application uses SQLite locally and Postgres on the server. Though at this point it doesn't actually use the database to story anything at all.

More later.

### Next extensions and improvements (things I punted on)
* ETags and caching in general
* Controller specs. I think I have good feature level coverage so I don't feel _too_ bad about this.
