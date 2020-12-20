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


"""
    generate_all_instances()


"""
function generate_all_instances(folder::String)
    if folder[end] != '/'
        folder = folder*"/"
    end
    board = initialize_board()
    for i1 in 1:5
        for j1 in 1:3
            if j1 == 3 && i1 > 3
                continue
            end
            for i in 1:5
                for j in 1:5
                    if i == 3 && j == 3
                        continue
                    end
                    board = initialize_board()
                    board[i1,j1] = 2
                    if board[i,j] == 0
                        board[i,j] = 1
                        solutions = find_solution(board)
                        if !isempty(solutions)
                            if !isdir(folder*"$(length(solutions[1]))")
                                mkdir(folder*"$(length(solutions[1]))")
                            end
                            write_board(board, folder*"$(length(solutions[1]))/1$(i)$(j)2$(i1)$(j1).txt")
                        end
                    end
                end
            end
            for i2 in i1:5
                for j2 in 1:5
                    if i2 == i1 && j2 <= j1
                        continue
                    end
                    for i in 1:5
                        for j in 1:5
                            if i == 3 && j == 3
                                continue
                            end
                            board = initialize_board()
                            board[i1,j1] = 2
                            board[i2,j2] = 3
                            if board[i,j] == 0
                                board[i,j] = 1
                                solutions = find_solution(board)
                                if !isempty(solutions)
                                    board[i1,j1] = 0
                                    if !isempty(find_solution(board))
                                        continue
                                    end
                                    board[i1,j1] = 2
                                    board[i2,j2] = 0
                                    if !isempty(find_solution(board))
                                        continue
                                    end
                                    board[i2,j2] = 3
                                    if !isdir(folder*"$(length(solutions[1]))")
                                        mkdir(folder*"$(length(solutions[1]))")
                                    end
                                    write_board(board, folder*"$(length(solutions[1]))/1$(i)$(j)2$(i1)$(j1)3$(i2)$(j2).txt")
                                end
                            end
                        end
                    end
                    for i3 in i2:5
                        for j3 in 1:5
                            if i3 == i2 && j3 <= j2
                                continue
                            end
                            for i in 1:5
                                for j in 1:5
                                    if i == 3 && j == 3
                                        continue
                                    end
                                    board = initialize_board()
                                    board[i1,j1] = 2
                                    board[i2,j2] = 3
                                    board[i3,j3] = 4
                                    if board[i,j] == 0
                                        board[i,j] = 1
                                        solutions = find_solution(board)
                                        if !isempty(solutions)
                                            board[i1,j1] = 0
                                            if !isempty(find_solution(board))
                                                continue
                                            end
                                            board[i1,j1] = 2
                                            board[i2,j2] = 0
                                            if !isempty(find_solution(board))
                                                continue
                                            end
                                            board[i2,j2] = 3
                                            board[i3,j3] = 0
                                            if !isempty(find_solution(board))
                                                continue
                                            end
                                            board[i3,j3] = 4
                                            if !isdir(folder*"$(length(solutions[1]))")
                                                mkdir(folder*"$(length(solutions[1]))")
                                            end
                                            write_board(board, folder*"$(length(solutions[1]))/1$(i)$(j)2$(i1)$(j1)3$(i2)$(j2)4$(i3)$(j3).txt")
                                        end
                                    end
                                end
                            end
                            for i4 in i3:5
                                for j4 in 1:5
                                    if i4 == i3 && j4 <= j3
                                        continue
                                    end
                                    for i in 1:5
                                        for j in 1:5
                                            if i == 3 && j == 3
                                                continue
                                            end
                                            board = initialize_board()
                                            board[i1,j1] = 2
                                            board[i2,j2] = 3
                                            board[i3,j3] = 4
                                            board[i4,j4] = 5
                                            if board[i,j] == 0
                                                board[i,j] = 1
                                                solutions = find_solution(board)
                                                if !isempty(solutions)
                                                    board[i1,j1] = 0
                                                    if !isempty(find_solution(board))
                                                        continue
                                                    end
                                                    board[i1,j1] = 2
                                                    board[i2,j2] = 0
                                                    if !isempty(find_solution(board))
                                                        continue
                                                    end
                                                    board[i2,j2] = 3
                                                    board[i3,j3] = 0
                                                    if !isempty(find_solution(board))
                                                        continue
                                                    end
                                                    board[i3,j3] = 4
                                                    board[i4,j4] = 0
                                                    if !isempty(find_solution(board))
                                                        continue
                                                    end
                                                    board[i4,j4] = 5
                                                    if !isdir(folder*"$(length(solutions[1]))")
                                                        mkdir(folder*"$(length(solutions[1]))")
                                                    end
                                                    write_board(board, folder*"$(length(solutions[1]))/1$(i)$(j)2$(i1)$(j1)3$(i2)$(j2)4$(i3)$(j3)5$(i4)$(j4).txt")
                                                end
                                            end
                                        end
                                    end
                                    for i5 in i4:5
                                        for j5 in 1:5
                                            if i5 == i4 && j5 <= j4
                                                continue
                                            end
                                            for i in 1:5
                                                for j in 1:5
                                                    if i == 3 && j == 3
                                                        continue
                                                    end
                                                    board = initialize_board()
                                                    board[i1,j1] = 2
                                                    board[i2,j2] = 3
                                                    board[i3,j3] = 4
                                                    board[i4,j4] = 5
                                                    board[i5,j5] = 6
                                                    if board[i,j] == 0
                                                        board[i,j] = 1
                                                        solutions = find_solution(board)
                                                        if !isempty(solutions)
                                                            current_length = length(solutions[1])
                                                            board[i1,j1] = 0
                                                            if !isempty(find_solution(board))
                                                                continue
                                                            end
                                                            board[i1,j1] = 2
                                                            board[i2,j2] = 0
                                                            if !isempty(find_solution(board))
                                                                continue
                                                            end
                                                            board[i2,j2] = 3
                                                            board[i3,j3] = 0
                                                            if !isempty(find_solution(board))
                                                                continue
                                                            end
                                                            board[i3,j3] = 4
                                                            board[i4,j4] = 0
                                                            if !isempty(find_solution(board))
                                                                continue
                                                            end
                                                            board[i4,j4] = 5
                                                            board[i5,j5] = 0
                                                            if !isempty(find_solution(board))
                                                                continue
                                                            end
                                                            board[i5,j5] = 6
                                                            if !isdir(folder*"$(length(solutions[1]))")
                                                                mkdir(folder*"$(length(solutions[1]))")
                                                            end
                                                            write_board(board, folder*"$(length(solutions[1]))/1$(i)$(j)2$(i1)$(j1)3$(i2)$(j2)4$(i3)$(j3)5$(i4)$(j4)6$(i5)$(j5).txt")
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return nothing
end
