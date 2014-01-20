require 'irb/completion'
 
# Make prompt red: use  ANSI color code \033[0;31m
IRB.conf[:PROMPT][:RAILSBRIDGE] = {
      :PROMPT_I => "\033[0;31m%N:line %03n >",
      :PROMPT_S => "%N:line %03n:%l \033[0;31m ",
      :PROMPT_C => "%N:line %03n:* \033[0;31m ",
      :RETURN => "%s\n"
}
 
IRB.conf[:PROMPT_MODE] = :RAILSBRIDGE
