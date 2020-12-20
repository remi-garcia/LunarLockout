function read_board(boardstr::String; autodetectformat::Bool=false, emptycell::Char=' ', usecolors::Bool=false)
    board = initialize_board()
    if autodetectformat
        if '-' in boardstr
            emptycell = '-'
        else
            emptycell = ' '
        end
        usecolors = ('r' in boardstr)
    end
    boardstr = replace(boardstr, (emptycell => '0'))
    if usecolors
        colors2int = Dict{Char, Char}([
        'r' => '1',
        'o' => '2',
        'g' => '3',
        'p' => '4',
        'y' => '5',
        'b' => '6'
        ])
        for (key, value) in colors2int
            boardstr = replace(boardstr, (key => value))
        end
    end
    boardstr_lines = split(boardstr, "\n")
    for i in 1:length(boardstr_lines)
        for j in 1:length(boardstr_lines[i])
            board[i,j] = parse(Int, boardstr_lines[i][j])
        end
    end
    return board
end


function read_challenge(file::String; autodetectformat::Bool=false, emptycell::Char=' ', usecolors::Bool = false)
    return read_board(read(file, String), autodetectformat=autodetectformat, emptycell=emptycell, usecolors=usecolors)
end
