class ChangeStorylineToText < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :storyline, :text
  end
end
