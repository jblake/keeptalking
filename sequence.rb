WIRE_SEQUENCE = {
    "red" => [
        [ "c" ],
        [ "b" ],
        [ "a" ],
        [ "a", "c" ],
        [ "b" ],
        [ "a", "c" ],
        [ "a", "b", "c" ],
        [ "a", "b" ],
        [ "b" ],
    ],
    "blue" => [
        [ "b" ],
        [ "a", "c" ],
        [ "b" ],
        [ "a" ],
        [ "b" ],
        [ "b", "c" ],
        [ "c" ],
        [ "a", "c" ],
        [ "a" ],
    ],
    "black" => [
        [ "a", "b", "c" ],
        [ "a", "c" ],
        [ "b" ],
        [ "a", "c" ],
        [ "b" ],
        [ "b", "c" ],
        [ "a", "b" ],
        [ "c" ],
        [ "c" ],
    ],
}

def sequence(*args)
    if args.length == 0 then
        num = { "red" => 0, "blue" => 0, "black" => 0 }
        while true do
            $stdout.write("Color and right-side connection of next wire? ")
            line = $stdin.readline.chomp
            break if line == ""
            color, pin = line.split(/\s+/)
            color = ALIASES[color] if ALIASES.member?(color)
            if WIRE_SEQUENCE[color][num[color]].member?(pin) then
                $stdout.write("Cut the wire.\n")
            else
                $stdout.write("Leave the wire.\n")
            end
            num[color] += 1
        end
    else
        $stderr.write("Usage: sequence\n")
    end
end
