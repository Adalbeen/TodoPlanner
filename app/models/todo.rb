class Todo < ApplicationRecord

  # Schema Information
  # Table name todos
  #
  # id               :bigint          not null, primary key
  # text             :text
  # DateOfCreation   :date            Time.now
  # check            :boolean         default(false)
  # owner            :text            current_user.email
  # created_at       :timestamp
  # updated_at       :timestamp

  scope :right_user, -> { where(owner: 'voj.proch@gmail.com')}
  
  validates :text, presence: true

end
