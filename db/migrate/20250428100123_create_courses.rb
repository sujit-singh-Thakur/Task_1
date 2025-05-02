class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :description 
      t.integer :duration_week

      t.timestamps
    end
  end
end
