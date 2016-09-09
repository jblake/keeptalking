KNOB_RULES = {
    # Left, Right
    [ 4, 4 ] => "up",
    [ 4, 3 ] => "up",
    [ 5, 3 ] => "down",
    [ 3, 2 ] => "down",
    [ 1, 4 ] => "left",
    [ 0, 3 ] => "left",
    [ 5, 4 ] => "right",
    [ 5, 2 ] => "right",
}

def knob(*args)
    if args.length == 2 then
        left = args[0].to_i
        right = args[1].to_i
        $stdout.write("Set knob to #{KNOB_RULES[[left, right]]} position.\n")
    else
        $stderr.write("Usage: knob <left-side LEDs> <right-side LEDs>\n")
    end
end
