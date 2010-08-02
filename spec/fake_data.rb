module ActiveRecord
  class Base
    def self.belongs_to(options = {}); end
    def self.has_many(options = {}); end
    def self.has_one(options = {}); end
  end
end

class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_one :description
end

class FakeAssociationReflection < Struct.new(:name)
end