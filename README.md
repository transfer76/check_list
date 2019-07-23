# Check List

## Test Task

### Requirements

Create a system that allows users to create checklists, fill them in, and show results
on the questions filling.
A user can create a checklist with a dynamic amount of questions. A checklist has a
title and a description with a variable amount of questions.
A question consists of a question text and a detailed description.
A checklist is saved as Draft until it is published. When a user publishes it, then users
can fill it in. Dates of checklist publication and editing are saved and displayed in the
checklists table.
When a user fills a checklist, then he enters a project ID – a custom string.
When a user changes a question answer to “Yes”, “No” or “N/A”, then a user adds a
comment with at least 12 symbols length.
When a user wants to go back from a partly filled checklist, then he confirms that his
data will be lost.
A user can edit and delete checklists.
The UI should be as close as possible to the mockups below.

To get a bonus, implement the following features:
1. Authentication for Admin users and checklists creation restriction only for the
Admin users.
2. Cover solution with Unit Tests with RSpec.
We recommend using Ruby on Rails with Material Design UI components for the task
implementation.

### Description

Task is implemented on **Ruby 2.5.3**

**Ruby on Rails 5.2.3**

Language: English

Used gem for authorization and authentication: **Devise**, **Pundit**, **Rolify**

Load configuration variables into ENV in development: gem **Dotenv**

Database: **PostgreSQL**

### To Start

1. Clone this repositiry
2. Install all necessary gems
```
$ Bundle
```
3. Create database and migraitions
```
$ bundle exec rails db:create
$ bundle exec rails db:migrate
```
4. Add role Admin
Create user with username 'test'
```
$ rails db:seed
```
Or
```
$ rails c
=> user = User.find(1)
=> user.add_role :admin
```
5. To use mailer you need create .env file(see .env.exampl)
```
$ touch app/config/.env
```
