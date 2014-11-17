# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(:first_name => "Hello", :last_name => "World", :address => "1st address", :address_2 => "2nd address", :state => "STATE", :zip_code => "9999", :age => 26, :preferences => {:blah => :foobar}.to_json)
outlet1 = Outlet.create(:name => "Best Outlet")
shift1 = Shift.create(:number => 1)


ReportEntry.create(:user => user1, :outlet => outlet1, :shift => shift1, :report_date => Date.today, :total_sales => 12345.78, :cash_remitted => 908765.89, :short => 7612.12, :remarks => "foobarbaz")

