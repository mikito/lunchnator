include Term::ANSIColor

def each_task(title = "", skip: false)
  puts "@@ #{title} ".ljust(79, "@").cyan
  puts "\n"
  context = skip ? "-> Skip".yellow : yield
  puts "\n"
  if context.is_a? String
    puts context
  else
    puts "-> Done".green
  end
  puts "\n\n"
  context
end

desc "[Custom Task] Clear tmp/log, rebuild DB, and annotate models"
namespace :application do
  task :reset do
    begin
      FileUtils.touch('tmp/pids/reset.pid')
      puts "\n"

      each_task "Running \`bundle install\`" do
        system "bundle install >/dev/null 2>&1"
      end

      each_task "Clearing logs" do
        Rake::Task['log:clear'].invoke
      end

      each_task "Clearing /tmp" do
        Rake::Task['tmp:clear'].invoke
      end

      each_task "Rebuilding Database" do
        Rake::Task['db:migrate:reset'].invoke
      end

      ActionDispatch::Reloader.cleanup!
      ActionDispatch::Reloader.prepare!

      each_task("Seeding Database", skip: ENV['RAILS_ENV'] == "test") do
        Rake::Task['db:seed'].invoke
      end
    ensure
      FileUtils.rm_f('tmp/pids/reset.pid')
    end
  end

  task :update do
    begin
      FileUtils.touch('tmp/pids/reset.pid')
      puts "\n"

      each_task "Running \`bundle install\`" do
        system "bundle install >/dev/null 2>&1"
      end

      each_task "Clearing logs" do
        Rake::Task['log:clear'].invoke
      end

      each_task "Clearing /tmp" do
        Rake::Task['tmp:clear'].invoke
      end

      each_task "Rebuilding Database" do
        Rake::Task['db:migrate'].invoke
      end
    ensure
      FileUtils.rm_f('tmp/pids/reset.pid')
    end
  end

  task test: :environment do
    ENV['RAILS_ENV'] = "test"
    Rake::Task['application:reset'].invoke
    Rake::Task['spec'].invoke
  end
end
