# frozen_string_literal: true

class RenamePosteridColumnToReports < ActiveRecord::Migration[6.1]
  def change
    rename_column :reports, :poster_id, :user_id
  end
end
