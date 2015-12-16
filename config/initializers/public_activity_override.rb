module PublicActivity
  class Activity < inherit_orm("Activity")
    scope :my_activity, ->(passed_value) {where(key: passed_value).order "created_at DESC"}
  end
end