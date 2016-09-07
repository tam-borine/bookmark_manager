<<<<<<< HEAD
class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
=======
require "data_mapper"
require "dm-postgres-adapter"
#require_relative '../data_mapper_setup'

class Link

  include DataMapper::Resource

  property :id,    Serial
  property :title, String
  property :url,   String

  has n, :tags, through: Resource

>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
end
