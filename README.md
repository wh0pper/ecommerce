# README
<%= form_with url: products_path, method: "get", local: true do |f| %>
  <%= f.text_field :search, params[:search], placeholder: "Search Products" %>
  <%= f.submit "Search", name: nil %>
<% end %>
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
