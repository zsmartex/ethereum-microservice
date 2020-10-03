namespace :service do
  @switch = Proc.new do |args, start, stop|
    case args.command
    when 'start'
      start.call
    when 'stop'
      stop.call
    when 'restart'
      stop.call
      start.call
    else
      puts "unknown command #{args.command}"
    end
  end

  desc 'Run Traefik (reverse-proxy)'
  task :proxy, [:command] do |task, args|
    args.with_defaults(:command => 'start')

    def start
      puts '----- Starting the proxy -----'
      File.new('config/acme.json', File::CREAT, 0600) unless File.exist? 'config/acme.json'
      sh 'docker-compose up -d proxy'
    end

    def stop
      puts '----- Stopping the proxy -----'
      sh 'docker-compose rm -fs proxy'
    end

    @switch.call(args, method(:start), method(:stop))
  end

  desc 'Run backend (db)'
  task :backend, [:command] do |task, args|
    args.with_defaults(:command => 'start')

    def start
      puts '----- Starting dependencies -----'
      sh 'docker-compose up -d db'
      sleep 7 # time for db to start, we can get connection refused without sleeping
    end

    def stop
      puts '----- Stopping dependencies -----'
      sh 'docker-compose rm -fs db'
    end


    @switch.call(args, method(:start), method(:stop))
  end

  desc 'Run app (explorer mew)'
  task :app, [:command] do |task, args|
    args.with_defaults(:command => 'start')

    def start
      puts '----- Starting dependencies -----'
      sh 'docker-compose up -d rpc explorer mew'
    end

    def stop
      puts '----- Stopping dependencies -----'
      sh 'docker-compose rm -fs rpc explorer mew'
    end


    @switch.call(args, method(:start), method(:stop))
  end

  desc 'Run daemons'
  task :daemons, [:command] do |task, args|
    args.with_defaults(:command => 'start')

    def start
      puts '----- Starting dependencies -----'
      sh 'docker-compose up -d sync stats richlist'
    end

    def stop
      puts '----- Stopping dependencies -----'
      sh 'docker-compose rm -fs sync stats richlist'
    end


    @switch.call(args, method(:start), method(:stop))
  end

  desc 'Run all'
  task :all, [:command] do |task, args|
    args.with_defaults(:command => 'start')

    def start
      puts '----- Starting dependencies -----'
      Rake::Task["service:proxy"].invoke('start')
      Rake::Task["service:backend"].invoke('start')
      Rake::Task["service:app"].invoke('start')
      Rake::Task["service:daemons"].invoke('start')
    end

    def stop
      puts '----- Stopping dependencies -----'
      Rake::Task["service:proxy"].invoke('stop')
      Rake::Task["service:backend"].invoke('stop')
      Rake::Task["service:app"].invoke('stop')
      Rake::Task["service:daemons"].invoke('stop')
    end


    @switch.call(args, method(:start), method(:stop))
  end
end
