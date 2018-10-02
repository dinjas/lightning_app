# README

This application is a functional demo of one approach to integrating the [PaperTrailScrapbook
 gem](https://github.com/tjchambers/paper_trail_scrapbook) into a Rails app.
 
To use the app:

- Download the repository
- Install bundler
- Run the following commands:
  1. `bundle install`
  2. `bundle exec rails db:create`
  3. `bundle exec rails db:migrate`
  4. `bundle exec rails db:seed`
  5. `bundle exec rails server`

- Visit [localhost:3000](http://localhost:3000) in your browser and sign in:

- email:    'zeus@mail.com'
- password: 'password'

The main integration points are:

- [ApplicationRecord#story](https://github.com/dinjas/lightning_app/blob/master/app/models/application_record.rb#L6-L9)
- [ApplicationRecord#history_key](https://github.com/dinjas/lightning_app/blob/master/app/models/application_record.rb#L11-L18)
- [ApplicationHelper#history_link_for_object](https://github.com/dinjas/lightning_app/blob/master/app/helpers/application_helper.rb#L4-L13)
- [LifeStoryController](https://github.com/dinjas/lightning_app/blob/master/app/controllers/life_story_controller.rb)
- [app/views/lightnings/index.html.haml](https://github.com/dinjas/lightning_app/blob/master/app/views/lightnings/index.html.haml#L30-L35)
- [app/assets/javascripts/history.js](https://github.com/dinjas/lightning_app/blob/master/app/assets/javascripts/history.js)

The presentation that accompanied this talk is at:
- [docs/presentation.pdf](https://github.com/dinjas/lightning_app/blob/master/docs/paper_trail_scrapbook.pdf)

There is also [a blog article](https://hint.io/blog/paper-trail-scrapbook) about PaperTrail and PaperTrailScrapbook.
