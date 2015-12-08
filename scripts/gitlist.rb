#!/usr/bin/env ruby
require 'github_api'
require 'terminal-table'

ORGANIZATION = 'honeypot-challenges'.freeze

auth   = { username: ENV['GH_U'], password: ENV['GH_P'] }.values.join(':')
github = Github.new(basic_auth: auth)

class Hope
  attr_accessor :name, :updated_at, :branches_count, :pull_requests_count, :commits_count

  def initialize(infos)
    infos.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def to_a
    [@name, @url, ready? ? 'OK' : 'NOPE']
  end

  def ready?
    branches_count > 1 or pull_requests_count > 0 or commits_count > 1
  end
end

results = Terminal::Table.new(headings: %w(Name URL Ready?)) do |table|
  table.rows = [].tap do |rows|
    github.repos(org: ORGANIZATION).list(:every, per_page: 100) do |repo|
      rows << Hope.new({
        name:                repo['name'],
        url:                 repo['html_url'],
        updated_at:          repo['updated_at'],
        branches_count:      github.repos.branches(user: ORGANIZATION, repo: repo['name']).count,
        pull_requests_count: github.pull_requests.list(user: ORGANIZATION, repo: repo['name']).count,
        commits_count:       github.repos.commits.list(ORGANIZATION, repo['name']).count
      })
    end
  end.sort_by(&:updated_at).map(&:to_a).reverse
end

puts results
