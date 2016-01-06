#!/usr/bin/env ruby
require 'github_api'
require 'launchy'

module Gitbot
  ORGANIZATION = 'honeypot-challenges'.freeze
  HOMEPAGE     = 'https://www.honeypot.io'.freeze
  VERSION      = 1.0
  COMMITTER    = { name: 'Honeypot Admin', email: 'admin@honeypot.io' }.freeze

  def self.run(argv=ARGV)
    abort 'Usage: ruby gitbot.rb <full name> <username> <role> [version]' if argv.length < 3
    abort 'Please set environment variables correctly'                    unless ENV['GH_TOKEN']

    roles = {
      be: 'Backend',
      fe: 'Frontend',
      do: 'DevOps',
      mo: 'Mobile'
    }

    name, user = argv
    short_role = argv[2].to_sym
    version    = argv.fetch(3, VERSION).to_i.to_s.rjust(3, '0')
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

    task = File.read(File.expand_path(
      File.join(File.dirname(__FILE__), '..', 'tasks', "#{short_role}_#{version}.md")
    ))

    github.repos.contents.create(ORGANIZATION, repository_name, 'README.md',
      path:     'README.md',
      message:  'Initial commit',
      committer: COMMITTER.dup,
      content:   task
    )

    github.repos.collaborators.add(ORGANIZATION, repository_name, user)

    Launchy.open("https://github.com/#{ORGANIZATION}/#{repository_name}.git")
  end
end

Gitbot.run if __FILE__ == $0
