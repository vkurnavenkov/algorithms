# Assume there is a REST API available at "http://www.linkedin.corp/api" for accessing employee information
# The employee information endpoint is "/employee/<id>"
# Each employee record you retrieve will be a JSON object with the following keys:
#
# - 'name' refers to a String that contains the employee's first and last name
# - 'title' refers to a String that contains the employee's job title
# - 'reports' refers to an Array of Strings containing the IDs of the employee's direct reports
#
# Write a function that will take an employee ID and print out the entire hierarchy of employees under that employee.
# For example, suppose that Flynn Mackie's employee id is 'A123456789' and his only direct reports are Wesley Thomas and Nina Chiswick. If you provide 'A123456789' as input to your function, you will see the sample output below.
#
#
# -----------Begin Sample Output--------------
# Flynn Mackie - Senior VP of Engineering
# Wesley Thomas - VP of Design
# Randall Cosmo - Director of Design
# Brenda Plager - Senior Designer
# Nina Chiswick - VP of Engineering
# Tommy Quinn - Director of Engineering
# Jake Farmer - Frontend Manager
# Liam Freeman - Junior Software Engineer
# Sheila Dunbar - Backend Manager
# Peter Young - Senior Code Cowboy
# -----------End Sample Output--------------
#
# Sample JSON Return
# GET /employee/A123456789
# {
# "name": "Flynn Mackie",
# "title": "Senior VP of Engineering",
# "reports": ["A123456793", "A1234567898"]
# }

class ApiClient
  API_URL = 'http://www.linkedin.corp/api'

  def initialize
    @client = RestClient.new(API_URL)
  end

  def get_employee(id)
    @client.get("/employee/#{id}")
  end
end

Employee = Struct.new(:name, :title, :reports) do
  def to_s
    "#{name} - #{title}"
  end
end

class EmployeeListBuilder
  def initialize(api_client, employee_id)
    @api_client = api_client
    @employee_id = employee_id
  end

  def employee_names
    return @employee_names if @employee_names

    @employee_names = retrieve_name(@employee_id, [])
  end

  private

  def retrieve_name(employee_id, list)
    json = @api_client.get_employee(employee_id)
    employee = json_to_employee(json)
    list.push(employee.to_s)
    employee.reports.each do |id|
      list = retrieve_name(id, list)
    end
    list
  end

  def json_to_employee(json)
    Employee.new(json['name', json['title'], json['reports']])
  end
end

api_client = ApiClient.new
builder = EmployeeListBuilder.new(api_client, 'A123456789')
puts builder.employee_names
