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
        },
        :offset => {
          "\n    " => [:clear, :exit, :id]
        }
      }

      protected

      def define_command(o)
        @@term_commands[o[:key]][:exec] = o[:exec]
        @@term_commands[o[:key]][:help] = o[:help]
        @@term_commands[:offset]["\n    "].push o[:key]
      end

      def hook_commands
        src = ""
        help = "this.write(["
        @@term_commands[:offset].each_pair{|k, v| 
          v.each{|e|
            commands.each_pair{|key, value|
              if key == e and  key != :offset
                src << "#{k}if cmd=='#{key}'#{k}  #{value[:exec]}"
                help << "'#{key} ... #{value[:help]}',"
              end
            }
          }
        }
        help << "])\n"
        src << "\n    if cmd=='help'\n        #{help}"
      end

    end
  end
end
