 module CreateActivity
  def create_activity category_id, activity_type, type_id, user_id
    Activity.create! target_id: category_id, target_type: activity_type,
      type_id: type_id, user_id: user_id
  end
end
