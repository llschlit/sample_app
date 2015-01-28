class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end

# migration: provides a way to alter the structure of the database
# incrementally so that our data model can adapt to changing requirements
#
# create_table is a rails method that creates a table in the database, it
# accepts a block with one variable (here it's 't' that is used to generate
# the attributes of the data model
#
# t.timestamps null: false creates a created_at and updated_at column
#
# now when we run bundle exec rake db:migrate, this updates the db schema
# with the most recent migration file
