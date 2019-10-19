class AllowNullSubmittedBy < ActiveRecord::Migration[6.0]
  def change
    change_column_null :submissions, :submitted_by, true
  end
end
