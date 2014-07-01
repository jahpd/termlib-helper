require "termlib/base"

module Termlib
  module Helper
    module Builder

      include Base

      def build(opt)
        opt[:custom_commands].each{|e| define_command(e)} if opt[:custom_commands]

        """term =  window.terminal = new Terminal
  rows: #{opt[:rows]}
  ps: '$ >'
  greeting: '#{opt[:id]} Terminal ready'
  id: '_#{opt[:id]}'
  termDiv: 'term_#{opt[:id]}'
  crsrBlinkMode: true
  handler: ->
    this.newLine()
    cmd = this.lineBuffer
    #{hook_commands}
    this.prompt()
  exitHandler: -> if term.closed==true then term.close()
  textColor: '#00FF00'

onHover = 
  terminal: ->
    TermGlobals.keylock = false
    term.focus()
  editor: ->
    TermGlobals.keylock = true
    window.editor.focus()

onExit = terminal: -> TermGlobals.setFocus false, editor: -> window.editor.blur()

$('#term_#{opt[:id]}').hover onHover.terminal, onExit.terminal

$('#coffee_editor').hover onHover.editor, onExit.editor

term.open()"""
      end

    end
  end
end
