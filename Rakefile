<<<<<<< HEAD
require 'data_mapper'
require './app/app.rb'
=======
require_relative './app/app.rb'
require "data_mapper"


>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

<<<<<<< HEAD

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
=======
  desc "Desructive update"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data lost)"
  end

>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
end
