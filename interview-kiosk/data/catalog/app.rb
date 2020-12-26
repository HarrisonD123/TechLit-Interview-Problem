#!/usr/bin/env ruby

require 'sinatra'
require 'pg'

set :public_folder, '/var/www/html'

DB = PG.connect

get '/' do
  @books = DB.exec('select * from books limit 20')
  erb :app
end
