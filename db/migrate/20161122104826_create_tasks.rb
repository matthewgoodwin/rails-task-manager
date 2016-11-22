class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :describe
      t.string :done
      t.string :boolean, default: false
      # setting default must be done here not on the 'generate migration'

      # timestamp is created automatically
      t.timestamps
    end
  end
end
