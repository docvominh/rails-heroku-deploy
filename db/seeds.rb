# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if (!UserModel.find_by_user_name('minhpd'))
  user = UserModel.new
  user.user_id="minhpd"
  user.password="123456"
  user.user_name="Phạm Đức Minh"
  user.email="phamducminh1990@gmail.com"
  user.save
end

if (RoleModel.find_by_role_id(1))
# Role
  role = RoleModel.new
  role.role_id = 1
  role.role_name = 'Manager'
  role.save

end
if (RoleModel.find_by_role_id(2))
  role = RoleModel.new
  role.role_id = 2
  role.role_name = 'CEO'
  role.save

end
if (RoleModel.find_by_role_id(3))
  role = RoleModel.new
  role.role_id = 3
  role.role_name = 'System Analyze'
  role.save

end
if (RoleModel.find_by_role_id(4))
  role = RoleModel.new
  role.role_id = 4
  role.role_name = 'Developer'
  role.save

end
if (RoleModel.find_by_role_id(5))
  role = RoleModel.new
  role.role_id = 5
  role.role_name = 'Tester'
  role.save
end