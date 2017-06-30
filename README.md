# README

## Dependencies
  * Ruby  >=2.3.0
  * Postgresql
  * Yarn

## Get up and running

Ensure that you have postgresql installed in your system.

```
rake db:create
rake db:migrate
yarn install
rails server
```

## Deploying to Heroku

You will need to add Heroku buildpacks for nodejs as well, because of Yarn dependency.

```
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
git push heroku master
heroku run rake db:migrate
```
