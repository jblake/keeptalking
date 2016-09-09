STAGES = [
    [
        proc { | bs, ps, ls | 2 },
        proc { | bs, ps, ls | 2 },
        proc { | bs, ps, ls | 3 },
        proc { | bs, ps, ls | 4 },
    ],
    [
        proc { | bs, ps, ls | bs.find_index(4) + 1 },
        proc { | bs, ps, ls | ps[0] },
        proc { | bs, ps, ls | 1 },
        proc { | bs, ps, ls | ps[0] },
    ],
    [
        proc { | bs, ps, ls | bs.find_index(ls[1]) + 1 },
        proc { | bs, ps, ls | bs.find_index(ls[0]) + 1 },
        proc { | bs, ps, ls | 3 },
        proc { | bs, ps, ls | bs.find_index(4) + 1 },
    ],
    [
        proc { | bs, ps, ls | ps[0] },
        proc { | bs, ps, ls | 1 },
        proc { | bs, ps, ls | ps[1] },
        proc { | bs, ps, ls | ps[1] },
    ],
    [
        proc { | bs, ps, ls | bs.find_index(ls[0]) + 1 },
        proc { | bs, ps, ls | bs.find_index(ls[1]) + 1 },
        proc { | bs, ps, ls | bs.find_index(ls[3]) + 1 },
        proc { | bs, ps, ls | bs.find_index(ls[2]) + 1 },
    ],
]

def memory(*args)
    if args.length == 0 then
        positions = []
        labels = []
        STAGES.each do | rules |
            $stdout.write("(stage #{positions.length + 1}) Display and button labels (in order)? ")
            display, *bs = $stdin.readline.chomp.split(/\s+/).map { | n | n.to_i }
            p = rules[display - 1].call(bs, positions, labels)
            l = bs[p - 1]
            positions << p
            labels << l
            $stdout.write("Press the button labeled #{l}.\n")
        end
    else
        $stderr.write("Usage: memory\n")
    end
end
