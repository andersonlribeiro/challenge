require 'github_api'
require 'terminal-table'

ORGANIZATION = 'honeypot-challenges'.freeze

abort 'Usage: ruby gitbot.rb <output>' if ARGV.length != 1

auth   = { username: ENV['GH_U'], password: ENV['GH_P'] }.values.join(':')
github = Github.new(basic_auth: auth)

class Hope
  attr_accessor :name, :branches_count, :pull_requests_count, :commits_count

  def initialize(infos)
    infos.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def to_a
    [@name, @url, completed? ? 'OK' : 'NOPE']
  end

  def completed?
    branches_count > 1 or pull_requests_count > 0 or commits_count > 1
  end
end

file = File.expand_path(ARGV[0])

File.open(file, ?w) do |f|
  f << Terminal::Table.new(headings: %w(Name URL Ready?)) do |table|
    table.rows = [].tap do |rows|
      github.repos(org: ORGANIZATION).list :every do |repo|
        hope = Hope.new({
          name:                repo['name'],
          url:                 repo['html_url'],
          branches_count:      github.repos.branches(user: ORGANIZATION, repo: repo['name']).count,
          pull_requests_count: github.pull_requests.list(user: ORGANIZATION, repo: repo['name']).count,
          commits_count:       github.repos.commits.list(ORGANIZATION, repo['name']).count
        })

        rows << hope.to_a
      end
    end
  end
end
