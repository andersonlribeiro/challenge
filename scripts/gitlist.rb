#!/usr/bin/env ruby
require 'github_api'
require 'terminal-table'
require 'csv'
require 'date'

ORGANIZATION = 'honeypot-challenges'.freeze
HEADINGS     = %w(Talent Challenge Repository\ URL Ready? Sent\ at).freeze

github = Github.new(oauth_token: ENV['GH_TOKEN'])

class Hope
  attr_accessor :name, :description, :updated_at, :branches_count, :pull_requests_count, :commits_count

  def initialize(infos)
    infos.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def to_a
    [full_name, challenge, @url, status, sent_at]
  end

  private

  def username
    @name.split('_')[0]
  end

  def challenge
    @description.split(' ')[0]
  end

  def full_name
    @description.split(' ')[3..-1].join(' ')
  end

  def ready?
    branches_count > 1 or pull_requests_count > 0 or commits_count > 1
  end

  def status
    ready? ? '✓' : '✗'
  end

  def sent_at
    Date.parse(@created_at).to_s
  end
end

results = [].tap do |rows|
  github.repos(org: ORGANIZATION).list(:every, per_page: 100) do |repo|
    rows << Hope.new({
      name:                repo['name'],
      description:         repo['description'],
      created_at:          repo['created_at'],
      url:                 repo['html_url'],
      updated_at:          repo['updated_at'],
      branches_count:      github.repos.branches(user: ORGANIZATION, repo: repo['name']).count,
      pull_requests_count: github.pull_requests.list(user: ORGANIZATION, repo: repo['name']).count,
      commits_count:       github.repos.commits.list(ORGANIZATION, repo['name']).count
    })
  end
end.sort_by(&:updated_at).map(&:to_a).reverse

if ARGV.empty?
  puts Terminal::Table.new(headings: HEADINGS, rows: results)
else
  filename = File.expand_path(ARGV[0])
  CSV.open(filename, 'wb') do |csv|
    csv << HEADINGS
    results.each { |result| csv << result }
  end
end
