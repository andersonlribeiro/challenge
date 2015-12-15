#!/usr/bin/env ruby
require 'date'
require 'json'
require 'csv'
require 'terminal-table'

abort 'input is required' if ARGV.empty?

class Action
  attr_accessor :id, :before, :after, :name, :date

  STEPS = [
    'Not checked',
    'Send coding challenge',
    'GitHub to be checked ',
    'Waiting for CC solution',
    'Code evaluated',
    'Introduced to companies',
    'Accepted (by the companies)',
    'Not Responsive',
    'Rejected (poor code)'
  ].freeze

  def initialize(data)
    data.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def to_a
    [@id, @name, date.to_s, step_before, step_after]
  end

  def date
    Date.parse(@date)
  end

  def step_before
    "#{STEPS.index(before)} - #{before}"
  end

  def step_after
    "#{STEPS.index(after)} - #{after}"
  end
end

HEADINGS = %w(ID Talent Date Step\ before Step\ after)

results = [].tap do |rows|
  data = File.read File.expand_path(ARGV.shift)
  data = JSON.parse data

  data['actions'].each do |action|
    next unless action['type'] == 'updateCard'
    next unless action['data']['listAfter']

    rows << Action.new({
      id:     action['data']['card']['idShort'],
      before: action['data']['listBefore']['name'],
      after:  action['data']['listAfter']['name'],
      name:   action['data']['card']['name'],
      date:   action['date']
    })
  end
end.sort_by { |action| [-action.id, -action.date.to_time.to_i] }.map(&:to_a)

if ARGV.empty?
  puts Terminal::Table.new(headings: HEADINGS, rows: results)
else
  filename = File.expand_path(ARGV[0])
  CSV.open(filename, 'wb') do |csv|
    csv << HEADINGS
    results.each { |result| csv << result }
  end
end
