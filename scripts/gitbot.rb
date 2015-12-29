#!/usr/bin/env ruby
require 'github_api'
require 'launchy'

ORGANIZATION = 'honeypot-challenges'.freeze
HOMEPAGE     = 'https://www.honeypot.io'.freeze
VERSION      = 1.0
COMMITTER    = { name: 'Honeypot Admin', email: 'admin@honeypot.io' }.freeze

abort 'Usage: ruby gitbot.rb <full name> <username> <role> [version]' if ARGV.length < 3
abort 'Please set environment variables correctly'                    unless ENV['GH_TOKEN']

roles = {
  be: 'Backend',
  fe: 'Frontend',
  do: 'DevOps',
  mo: 'Mobile'
}

name, user = ARGV
short_role = ARGV[2].to_sym
version    = ARGV.fetch(3, VERSION).to_i.to_s.rjust(3, '0')
role       = roles[short_role]
abort 'Invalid role provided.' unless role

repository_name = [user, short_role, version].join('_')

github = Github.new(oauth_token: ENV['GH_TOKEN'])

github.repos.create(
  org:  ORGANIZATION,
  name: repository_name,
  description: "#{role} Challenge v#{VERSION.to_i} #{name}",
  private:  true,
  has_wiki: false,
  homepage: HOMEPAGE
)

github.repos.collaborators.add(ORGANIZATION, repository_name, user)

task = File.read(File.expand_path(
  File.join(File.dirname(__FILE__), '..', 'tasks', "#{short_role}_#{VERSION}.md")
))

github.repos.contents.create(ORGANIZATION, repository_name, 'README.md',
  path:     'README.md',
  message:  'Initial commit',
  committer: COMMITTER,
  content:   task
)

Launchy.open("https://github.com/#{ORGANIZATION}/#{repository_name}.git")
