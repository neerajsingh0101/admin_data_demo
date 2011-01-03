if Rails.env.production?
  AdminData.config do |config|
    config.is_allowed_to_view = lambda {|controller| return true  }
    config.is_allowed_to_update = lambda {|controller| return false }
    config.number_of_records_per_page = 20
  end

else
  AdminData.config do |config|
    config.is_allowed_to_view = lambda {|controller| return true  }
    config.is_allowed_to_update = lambda {|controller| return true }
    config.feed_authentication_user_id = 'admin_data'
    config.feed_authentication_password = 'welcome'
    config.number_of_records_per_page = 2
  end

end
