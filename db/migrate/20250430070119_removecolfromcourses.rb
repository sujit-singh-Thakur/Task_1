class Removecolfromcourses < ActiveRecord::Migration[8.0]
  def change
    remove_column :courses, :status, :bool
  end
end
