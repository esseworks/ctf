require 'ctf'

module Ctf
  require 'rails'

  class Railtie < Rails::Railtie

  end

  rake_tasks { load "tasks/compare.rake" }

end
