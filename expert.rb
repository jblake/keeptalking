#!/usr/bin/ruby

require "./common"

require "./button"
require "./complex"
require "./keypad"
require "./knob"
require "./maze"
require "./memory"
require "./morse"
require "./password"
require "./sequence"
require "./simon"
require "./who"
require "./wires"

$stdout.write(<<END)
Bomb disposal manual version 1
Verification code 241

Remember: You must restart this program when you move to a new bomb!

Modules:
    button
    complex
    keypad
    knob
    maze
    memory
    morse
    password
    sequence
    simon
    who
    wires

END

$stdout.write("Next module? ")
$stdin.each_line do | line |
    line.chomp!
    break if line == ""
    mod, *args = line.split(/\s+/)
    args = args.map { | arg | ALIASES.member?(arg) ? ALIASES[arg] : arg }
    begin
        send(mod, *args)
    rescue Exception => e
        $stderr.write("Something happened!\n\t#{e.message}\n#{e.backtrace.map { | p | "\t\t#{p}" }.join("\n")}\n")
    end
    $stdout.write("Next module? ")
end
