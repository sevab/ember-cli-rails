require "singleton"

module EmberCli
  class Configuration
    include Singleton

    def app(name, **options)
      app = App.new(name, options)
      apps.store(name, app)
    end

    def apps
      @apps ||= HashWithIndifferentAccess.new
    end

    def bower_path
      @bower_path ||= Helpers.which("bower")
    end

    def npm_path
      @npm_path ||= Helpers.which("npm")
    end

    attr_accessor :watcher
  end
end
