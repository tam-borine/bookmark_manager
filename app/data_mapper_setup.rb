<<<<<<< HEAD
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tags'
=======
require "data_mapper"
require "dm-postgres-adapter"
require_relative 'models/tag'
>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
require_relative 'models/link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
<<<<<<< HEAD
DataMapper.auto_upgrade!
=======
>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
