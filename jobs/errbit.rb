# load the widget configuration
config = YAML.load File.open("config.yml")
config = config[:errbit]

SCHEDULER.every "5m", first_in: 0 do |job|

  projects = config[:projects].each_with_object([]) do |data, projects|
    project_name, project_attributes = data
    options = project_attributes.merge(date_format: config[:date_format], base_uri: config[:base_uri])

    projects << Errbit.new(options).values
  end

  send_event "errbit", { projects: projects }

end
