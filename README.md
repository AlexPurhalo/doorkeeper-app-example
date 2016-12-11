### Usage
* $ bundle install
* $ rails s

### Progress
* $ rails generate doorkeeper:install
* $ rails generate doorkeeper:migration
* Go .../oauth/applications/ and create a new app with (redirect url must be different with server url)
* Pay attention to the application id and secret keys of new app
* Fill in the “Scopes” field with "public" "write" value (separated with space)

public – allows the client to fetch information about a user
write – allows the client to make changes to user’s profile