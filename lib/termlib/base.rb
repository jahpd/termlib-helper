module Termlib
  module Helper

    module Base
      DEFAULT_COLOR ="#3d31a2"
      DEFAULT_TEXT_COLOR = "#7c70da"
 
      @@term_commands = {
        :clear => {
          :exec =>"this.clear()",
          :help => "clear terminal"
        },
        :exit  => {
          :exec => "this.type('# By!')\n      this.close()",
          :help => "kill terminal"
        },
        :id => {
          :exec => "this.type this.id", 
          :help => "show terminal id"
        }
      }

      protected

      def define_commands(o)
        o.each_pair{|k, v|
          @@term_commands[k] = v
        }
      end

      def hook_commands
        src = ""
        help = "this.write(["
        @@term_commands.each_pair{|key, value|
          src << "#\n    if cmd=='#{key}'\n      #{value[:exec]}"
          help << "'#{key} ... #{value[:help]}',"  
        }
        help << "])\n"
        src << "\n    if cmd=='help'\n      #{help}"
      end

    end
  end
end
