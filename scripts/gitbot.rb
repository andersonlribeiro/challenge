#!/usr/bin/env ruby
require 'github_api'
require 'launchy'

ORGANIZATION = 'honeypot-challenges'.freeze
HOMEPAGE     = 'https://www.honeypot.io'.freeze
VERSION      = '001'.freeze

abort 'Usage: ruby gitbot.rb <full name> <username> <role>' if ARGV.length != 3

roles = {
  be: 'Backend',
  fe: 'Frontend',
  do: 'DevOps'
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

auth   = { username: ENV['GH_U'], password: ENV['GH_P'] }.values.join(':')
github = Github.new(basic_auth: auth)

github.repos.create(
  org:  ORGANIZATION,
  name: repository_name,
  description: "#{role} Challenge v#{VERSION.to_i} #{name}",
  private:  true,
  has_wiki: false,
  homepage: HOMEPAGE
)

github.repos.collaborators.add ORGANIZATION, repository_name, user

# TODO: Push README

url = ['https://github.com', ORGANIZATION, repository_name].join('/')
Launchy.open(url)
