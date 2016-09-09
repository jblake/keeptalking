MAZE_KEYS = {
    # X,Y
    [1,1] => 3,
    [1,2] => 0,
    [1,4] => 3,
    [1,5] => 8,
    [2,1] => 6,
    [2,4] => 1,
    [2,6] => 6,
    [3,2] => 8,
    [3,4] => 7,
    [3,5] => 5,
    [4,1] => 7,
    [4,4] => 2,
    [4,6] => 4,
    [5,1] => 5,
    [5,2] => 1,
    [5,3] => 4,
    [6,3] => 0,
    [6,4] => 2,
}

MAZES = [
    "╔═╗╔═╡" + # 0
    "║╔╝╚═╗" +
    "║╚╗╔═╣" +
    "║╞╩╝╞╣" +
    "╠═╗╔╡║" +
    "╚╡╚╝╞╝",

    "╞╦╡╔╦╡" + # 1
    "╔╝╔╝╚╗" +
    "║╔╝╔═╣" +
    "╠╝╔╝╥║" +
    "║╥║╔╝║" +
    "╨╚╝╚═╝",

    "╔═╗╥╔╗" + # 2
    "╨╥║╚╝║" +
    "╔╣║╔╗║" +
    "║║║║║║" +
    "║╚╝║║║" +
    "╚══╝╚╝",

    "╔╗╞══╗" + # 3
    "║║╔══╣" +
    "║╚╝╔╡║" +
    "║╞═╩═╣" +
    "╠═══╗║" +
    "╚═╡╞╝╨",

    "╞═══╦╗" + # 4
    "╔══╦╝╨" +
    "╠╗╞╝╔╗" +
    "║╚═╗╨║" +
    "║╔═╩╡║" +
    "╨╚═══╝",

    "╥╔╗╞╦╗" + # 5
    "║║║╔╝║" +
    "╠╝╨║╔╝" +
    "╚╗╔╣║╥" +
    "╔╝╨║╚╣" +
    "╚══╝╞╝",

    "╔══╗╔╗" + # 6
    "║╔╡╚╝║" +
    "╚╝╔╡╔╝" +
    "╔╗╠═╝╥" +
    "║╨╚═╗║" +
    "╚═══╩╝",

    "╥╔═╗╔╗" + # 7
    "╠╩╡╚╝║" +
    "║╔══╗║" +
    "║╚╗╞╩╝" +
    "║╥╚══╡" +
    "╚╩═══╡",

    "╥╔══╦╗" + # 8
    "║║╔╡║║" +
    "╠╩╝╔╝║" +
    "║╥╔╝╞╣" +
    "║║║╔╗╨" +
    "╚╝╚╝╚╡",
]

MOVES = {
    "down" => proc { | x, y | [x, y+1] },
    "left" => proc { | x, y | [x-1, y] },
    "right" => proc { | x, y | [x+1, y] },
    "up" => proc { | x, y | [x, y-1] },
}

TILES = {
    " " => [ ],
    "═" => [ "left", "right" ],
    "║" => [ "down", "up" ],
    "╔" => [ "down", "right" ],
    "╗" => [ "down", "left" ],
    "╚" => [ "right", "up" ],
    "╝" => [ "left", "up" ],
    "╞" => [ "right" ],
    "╠" => [ "down", "right", "up" ],
    "╡" => [ "left" ],
    "╣" => [ "down", "left", "up" ],
    "╥" => [ "down" ],
    "╦" => [ "down", "left", "right" ],
    "╨" => [ "up" ],
    "╩" => [ "left", "right", "up" ],
    "╬" => [ "down", "left", "right", "up" ],
}

def solve_maze(tiles, from, to, visited, moves)
    return moves if from == to
    return nil if visited.member?(from)
    here = tiles[(from[1]-1)*6+(from[0]-1)]
    TILES[here].each do | dir |
        solution = solve_maze(tiles, MOVES[dir].call(*from), to, visited + [from], moves + [dir])
        return solution if solution
    end
    return nil
end

def maze(*args)
    if args.length == 6 then
        kx = args[0].to_i
        ky = args[1].to_i
        sx = args[2].to_i
        sy = args[3].to_i
        ex = args[4].to_i
        ey = args[5].to_i
        key = MAZE_KEYS[[kx,ky]]
        tiles = MAZES[key]
        solution = solve_maze(tiles, [sx,sy], [ex,ey], [], [])
        $stdout.write("Follow these moves in sequence:\n#{solution.map { | m | "\t#{m}" }.join("\n")}\n")
    else
        $stderr.write("Usage: maze <circlex> <circley> <whitex> <whitey> <redx> <redy>\n")
        $stderr.write("Count coordinates with 1,1 as the top left corner.\n")
        $stderr.write("It doesn't matter which circle you specify.\n")
    end
end
