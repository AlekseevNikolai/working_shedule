# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :environment, "development"
#
every 1.day, at: '09:00 am' do
  runner "Workday.update_all_holidays"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#bundle exec whenever --update-crontab
#crontab -l
#bundle exec whenever --clear-crontab
