#!/usr/bin/env ruby

require 'csv'
require 'pg'

DB = PG.connect

puts 'setup: creating books table'
DB.exec <<~SQL
  create table books (
    id serial primary key,
    uid varchar,
    title varchar,
    author varchar,
    category varchar)
SQL

puts 'setup: seeding books'
sql = 'insert into books (uid, title, author, category) values ($1, $2, $3, $4)'
CSV.open(File.join(__dir__, 'seeds', 'books.csv')).each do |book|
  DB.exec_params(sql, book)
end

puts 'setup: done'
