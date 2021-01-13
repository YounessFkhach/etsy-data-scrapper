class RemoveNullConstraintFromTitle < ActiveRecord::Migration[6.1]
  def change
    change_column :listings, :title, :string, :null => true
  end
end
