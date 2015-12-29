#!/usr/bin/env ruby
require 'bitbucket_rest_api'
require 'launchy'
require 'git'
require 'github_api'

ORGANIZATION = 'honeypot-challenges'.freeze
HOMEPAGE     = 'https://www.honeypot.io'.freeze
VERSION      = 1.0

abort 'Usage: ruby archiver.rb <username> <role> [version]' if ARGV.length < 2
abort 'Please set environment variables correctly'          if !ENV['BB_EMAIL'] || !ENV['BB_PASS']

roles = {
  be: 'Backend',
  fe: 'Frontend',
  do: 'DevOps',
  mo: 'Mobile'
}

user       = ARGV[0]
short_role = ARGV[1].to_sym
version    = ARGV.fetch(2, VERSION).to_i.to_s.rjust(3, '0')
role       = roles[short_role]
abort 'Invalid role provided.' unless role

repository_name = [user, short_role, version].join('_')

repository_uris = {
  current: "https://github.com/#{ORGANIZATION}/#{repository_name}.git",
  target:  "https://bitbucket.org/#{ORGANIZATION}/#{repository_name}.git"
}

Dir.mkdir('archive') unless Dir.exists?('archive')
Git.clone(repository_uris[:current], repository_name, path: 'archive')

bitbucket = BitBucket.new(login: ENV['BB_EMAIL'], password: ENV['BB_PASS'])
bitbucket.repos.create(
  owner: ORGANIZATION,
  name:  repository_name,
  description: "Mirror for #{user}'s #{role} challenge",
  is_private:  true,
  has_wiki:    false,
  website:     HOMEPAGE
)

git = Git.open("archive/#{repository_name}")
git.push(repository_uris[:target], 'master', mirror: true)

github = Github.new(oauth_token: ENV['GH_TOKEN'])
github.repos.delete ORGANIZATION, repository_name

Launchy.open(repository_uris[:target])
