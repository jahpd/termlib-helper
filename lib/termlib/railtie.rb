
require "#{File.dirname(__FILE__)}/builder"

module Termlib
  module Helper
  
    class Railtie < Rails::Railtie
      initializer "termlib.builder" do
        ActionView::Base.send :include, Builder
      end
    end

  end
end
