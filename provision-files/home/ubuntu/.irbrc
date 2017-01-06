require 'irb/completion'
require 'irb/ext/history'

# Save history (will be shared between `irb` and `rails console`)

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# Apply ANSI color escapes to the main part of the prompt (so that
# students know they're in IRB), but reset back to normal before the
# prompt type indicator and their input (if the VM connection drops in
# the middle of the IRB session, we don't want to leave their terminal
# colored). Always use bold colors for readability.

_IRB_classic_base_prompt_bold_red = "\e[1;31m%N(%m):%03n:%i\e[0m"
_IRB_classic_return_bold_cyan = "=> \e[1;36m%s\e[0m\n"

IRB.conf[:PROMPT][:RAILSBRIDGE] = {
  :PROMPT_I => _IRB_classic_base_prompt_bold_red + '> ',
  :PROMPT_N => _IRB_classic_base_prompt_bold_red + '> ',
  :PROMPT_S => _IRB_classic_base_prompt_bold_red + '%l ',
  :PROMPT_C => _IRB_classic_base_prompt_bold_red + '* ',
  :RETURN   => _IRB_classic_return_bold_cyan
}

if File.exist?("#{ENV['HOME']}/.railsbridge_color")
  IRB.conf[:PROMPT_MODE] = :RAILSBRIDGE
end
