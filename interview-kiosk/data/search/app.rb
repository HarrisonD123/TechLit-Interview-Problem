#!/usr/bin/env ruby

require 'sinatra'
require 'pg'

set :public_folder, '/var/www/html'

DB = PG.connect

%w[get post].each do |http_method|
  send http_method, '/' do
    sql = 'select * from books where title ilike $1 or author ilike $2'
    query = [params.fetch('title', ''), params.fetch('author', '')]
    @results = DB.exec_params(sql, query)
    erb :app
  end
end
