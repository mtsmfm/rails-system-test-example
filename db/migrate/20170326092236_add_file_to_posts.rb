class AddFileToPosts < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.binary :file
    end
  end
end
