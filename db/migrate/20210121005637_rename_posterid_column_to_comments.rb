# frozen_string_literal: true

class RenamePosteridColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :poster_id, :user_id
  end
end
