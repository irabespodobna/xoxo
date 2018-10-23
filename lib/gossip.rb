require 'csv'

class Gossip
  attr_accessor :author, :description

  def initialize(author, content)
    @author = author
    @description = content
  end

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @description]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    self.all[id]
  end
end
