#!/usr/bin/env ruby
require 'bitbucket_rest_api'
require 'launchy'

ORGANIZATION = 'honeypot-challenges'.freeze
HOMEPAGE     = 'https://www.honeypot.io'.freeze
VERSION      = '001'.freeze

abort 'Usage: ruby archiver.rb <username> <role>' if ARGV.length != 3

roles = {
  be: 'Backend',
  fe: 'Frontend',
  do: 'DevOps',
  mo: 'Mobile'
}

name, user = ARGV
short_role = ARGV[2].to_sym
role       = roles[short_role]
abort 'Invalid role provided.' unless role

repository_name = [
  user,
  short_role,
  VERSION
].join('_')

Dir.mkdir('archive') unless Dir.exists?('archive')
abort 'This repository has been already download' if Dir.exists?("archive/#{repository_name}")
system "git clone https://github.com/#{ORGANIZATION}/#{repository_name}.git archive/#{repository_name}"

bitbucket = BitBucket.new login: ENV['BB_EMAIL'], password: ENV['BB_PASS']
bitbucket.repos.create(
  owner: ORGANIZATION,
  is_private: true,
  has_wiki:   false,
  website:    HOMEPAGE
)

Dir.chdir("archive/#{repository_name}") do
  system "git push --mirror https://bitbucket.org/#{ORGANIZATION}/#{repository_name}.git"
end

url = ['https://bitbucket.org', ORGANIZATION, repository_name].join('/')
Launchy.open(url)
