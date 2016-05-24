class AddSlugToEvents < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string, index: true, uniqueness: true
  end
end
