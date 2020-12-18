function read_board(boardstr::String)
    board = initialize_board()
    boardstr = replace(boardstr, (" " => "0"))
    boardstr_lines = split(boardstr, "\n")
    for i in 1:5
        for j in 1:length(boardstr_lines[i])
            board[i,j] = parse(Int, boardstr_lines[i][j])
        end
    end
    return board
end


function read_problem(file::String)
    return read_board(read((@__DIR__)*"/../instances/"*file, String))
end
