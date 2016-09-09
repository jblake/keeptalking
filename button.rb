BUTTON_RULES = [
    [ proc { | c, w | c == "blue" and w == "abort" }, "Hold down" ],
    [ proc { | c, w | w == "detonate" and batteries > 1 }, "Press and release" ],
    [ proc { | c, w | c == "white" and lit("CAR") }, "Hold down" ],
    [ proc { | c, w | batteries > 2 and lit("FRK") }, "Press and release" ],
    [ proc { | c, w | c == "yellow" }, "Hold down" ],
    [ proc { | c, w | c == "red" and w == "hold" }, "Press and release" ],
    [ proc { | c, w | true }, "Hold down" ],
]

BUTTON_HOLD_RULES = [
    [ proc { | c | c == "blue" }, "4" ],
    [ proc { | c | c == "white" }, "1" ],
    [ proc { | c | c == "yellow" }, "5" ],
    [ proc { | c | true }, "1" ],
]

def button(*args)
    if args.length == 2 then
        result = apply_rules(BUTTON_RULES, *args)
        $stdout.write("#{result} the button.\n")
        if result == "Hold down" then
            $stdout.write("Color of the strip? ")
            strip = $stdin.readline.chomp
            strip = ALIASES[strip] if ALIASES.member?(strip)
            $stdout.write("Release the button when timer has a #{apply_rules(BUTTON_HOLD_RULES, strip)} in any position.\n")
        end
    else
        $stderr.write("Usage: button <color> <word>\n")
    end
end
