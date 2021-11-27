# Authentication to a Rails.

## Using Devise and the Sendinblue transactional email service for confirmation


### Tech

This app uses:
- Ruby on Rails (6.1.4.1)
- Ruby (3.0.2)
- Devise (4.8.0)
- Sib-api-v3-sdk (7.5.0) - Sendinblue API
- Figaro (1.2.0)
- Roadie (4.0.0)
- Bootstrap (5.1)


## Installation

Clone the repository
```sh
https://github.com/Stanis1av/Authentication-to-a-Rails.git
```
OR
```sh
gh repo clone Stanis1av/Authentication-to-a-Rails
```
Run 'bundle install'
```sh
bundle install
```
Install Webpacker
```sh
bin/rails webpacker:install
```
OR
```sh
bundle exec rake webpacker:install
```
Next create DB
```sh
rails db:create
```
generate migration
```sh
rails db:migrate
```
and last step:
```sh
rails s
and go to localhost:3000
```
> For Sendinblue to work, you need to register and get an API key: [Sendinblue][id/name].

[id/name]: https://account.sendinblue.com/advanced/api
> Generate application.yml with Figaro: `bundle exec figaro install`

In it you will store the API-key



## License

MIT

**Free Software, Hell Yeah!**
