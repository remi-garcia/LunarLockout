using Random
include("boardrobots.jl")
include("solver.jl")


"""
    write_board(board::Matrix{Int}, filename::String)

Write the challenge `board` in the file `filename`.
"""
function write_board(board::Matrix{Int}, filename::String)
    open(filename, "w") do io
        for i in 1:5
            for j in 1:5
                if board[i,j] != 0
                    write(io, "$(board[i,j])")
                else
                    write(io, " ")
                end
            end
            write(io, "\n")
        end
    end
    return nothing
end


"""
    generate_random_instance(nb_move::Int)

Return an instance that is doable in `nb_move` moves.
"""
function generate_random_instance(nb_move::Int)
    instance_found = false
    board = initialize_board()
    while !instance_found
        board = initialize_board()
        i = rand(1:5)
        j = rand(1:5)
        while i == 3 && j == 3
            i = rand(1:5)
            j = rand(1:5)
        end
        board[i,j] = 1
        for robot in 2:6
            i = rand(1:5)
            j = rand(1:5)
            while board[i,j] != 0
                i = rand(1:5)
                j = rand(1:5)
            end
            board[i,j] = robot
            if !isempty(find_solution(board)) && length(find_solution(board)[1]) == nb_move
                instance_found = true
                break
            end
        end
    end
    robot = 2
    for i in 1:5
        for j in 1:5
            if !(board[i,j] in [0,1])
                board[i,j] = robot
                robot += 1
            end
        end
    end
    return board
end
