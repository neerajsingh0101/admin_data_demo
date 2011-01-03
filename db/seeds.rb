User.all.each {|r| r.destroy }
Club.all.each {|r| r.destroy }


(1..100).to_a.each_with_index do |i,e|
  u = User.new(:data => {:year => 1900 + i, :music => 'rock, jazz'},
               :first_name => Faker::Name.first_name,
               :last_name => Faker::Name.last_name,
               :active => true,
               :age => 1 + i,
               :description => Faker::Lorem.paragraph,
               :born_at =>  Time.now)
  u.created_at = rand(30).send(:days).send(:ago)
  u.save!
end

User.find(:all).each do |u|
  2.times do
    p = u.phone_numbers.new(:number => Faker::PhoneNumber.phone_number)
    p.created_at = rand(30).send(:days).send(:ago)
    p.save!
  end
  w = u.build_website(:url => 'http://www.' + Faker::Internet.domain_name)
  w.created_at = rand(30).send(:days).send(:ago)
  w.save!

  c = u.clubs.new(:name => Faker::Company.name)
  c.save!
end
