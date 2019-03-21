p "Create test groups"

Group.find_or_create_by(name: 'project_manager')
Group.find_or_create_by(name: 'developer')
Group.find_or_create_by(name: 'quality_control')
