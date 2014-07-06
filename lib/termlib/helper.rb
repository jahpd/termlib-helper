require "termlib/helper/version"
require "termlib/base"

module Termlib
  module Helper
    module Builder

      include Base
      include ActionView::Helpers::JavaScriptHelper

      def termlib(opt)
       define_commands(opt[:custom_commands]) if opt[:custom_commands]

        string = """term =  window.terminal = new Terminal
  rows: #{opt[:rows]}
  ps: '$ >'
  greeting: '#{opt[:id]} Terminal ready'
  id: '#{opt[:id]}_#{Time.now}'
  termDiv: '#{opt[:id]}'
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

onExit = 
  terminal: -> TermGlobals.setFocus false
  editor: -> window.editor.blur()

$('##{opt[:id]}').hover onHover.terminal, onExit.terminal

$('##{opt[:editor]}').hover onHover.editor, onExit.editor

term.open()"""
        js = CoffeeScript.compile(string, :bare => true)
        javascript_tag(js)
      end

    end
  end
end
