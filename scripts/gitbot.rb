#!/usr/bin/env ruby
require 'github_api'
require 'launchy'

ORGANIZATION = 'honeypot-challenges'.freeze
HOMEPAGE     = 'https://www.honeypot.io'.freeze
VERSION      = '001'.freeze

abort 'Usage: ruby gitbot.rb <full name> <username> <role>' if ARGV.length != 3
abort 'Please set environment variables correctly' unless ENV['GH_TOKEN']

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

github = Github.new(oauth_token: ENV['GH_TOKEN'])

github.repos.create(
  org:  ORGANIZATION,
  name: repository_name,
  description: "#{role} Challenge v#{VERSION.to_i} #{name}",
  private:  true,
  has_wiki: false,
  homepage: HOMEPAGE
)

github.repos.collaborators.add ORGANIZATION, repository_name, user

github.repos.contents.create ORGANIZATION, repository_name, 'README.md',
  path: "README.md",
  message: "Initial commit",
  committer: {"name" => "Honeypot Admin", "email" => "admin@honeypot.io"},
  content: File.read(File.expand_path(File.join(File.dirname(__FILE__), "..", "tasks", "#{short_role}_#{VERSION}.md")))

url = ['https://github.com', ORGANIZATION, repository_name].join('/')
Launchy.open(url)
