require 'statuscake'
require 'time_diff'

config = YAML::load_file('config/statuscake.yml')

def calculate_difference date1, date2
  t = Time.diff(date1, date2)
  "#{t[:day]}d #{t[:hour]}h #{t[:minute]}m"
end

client = StatusCake::Client.new(API: config['api_key'], Username: config['api_user'])

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '50s', :first_in => 0 do |job|
  config['checks'].each do |id|
    check = client.tests_details(TestID: id)
    performance = client.tests_checks(TestID: id, Fields: "performance")
    status = check["Status"].downcase
    uptime = check["Uptime"].to_s + ' %'
    paused = check["Paused"]
    latency = performance[performance.first.first]["Performance"].to_s + 'ms'
    if paused == true
    	status = "pau"
    end
    last_check_time = DateTime.parse(check["LastTested"])
    last_check = calculate_difference(Time.now, Time.at(last_check_time))
    send_event("statuscake-status-#{id}", { current: status,
                                  latency: latency,
                                  last_check: last_check})
  end
end
