namespace :emails do
  desc('update emails')
  task(:update => :environment) do
    Email.update!
  end
end