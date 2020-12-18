function find_solution(board::Matrix{Int})
    solutions = Vector{Vector{Move}}()
    current_possible_moves = get_possible_moves(board)
    for move in current_possible_moves
        push!(solutions, Vector{Move}([move]))
    end
    solution_found = false
    valid_solutions = Vector{Vector{Move}}()
    begin
        red_moves = _robot_possible_moves(board, get_red_position(board))
        if CartesianIndex(3,3) in [red_moves[i][2] for i in 1:length(red_moves)]
            push!(valid_solutions, [(get_red_position(board) => CartesianIndex(3,3))])
            solution_found = true
        end
    end

    while !solution_found && !isempty(solutions)
        nb_solutions = length(solutions)
        for _ in 1:nb_solutions
            current_solution = solutions[1]
            new_board = copy(board)
            for move in current_solution
                move_robot!(new_board, move)
            end
            current_possible_moves = get_possible_moves(new_board)
            for move in current_possible_moves
                push!(solutions, copy(current_solution))
                push!(solutions[end], move)
                move_robot!(new_board, move)
                if is_finished(new_board)
                    solution_found = true
                    push!(valid_solutions, copy(solutions[end]))
                end
                move_robot!(new_board, reverse(move))
            end
            popfirst!(solutions)
        end
    end

    return valid_solutions
end


function print_solution(_board::Matrix{Int}, solution::Vector{Move})
    board = copy(_board)
    robotcolors = Dict{Int, String}([
        1 => "Red",
        2 => "Orange",
        3 => "Green",
        4 => "Purple",
        5 => "Yellow",
        6 => "Blue"
    ])
    i = 1
    for move in solution
        print("$i:\t$(robotcolors[board[move[1]]]) - ")
        if move[1][1] != move[2][1]
            if move[1][1] < move[2][1]
                println("Down")
            else
                println("Up")
            end
        else #move[1][2] != move[2][2]
            if move[1][2] < move[2][2]
                println("Right")
            else
                println("Left")
            end
        end
        i += 1
        move_robot!(board, move)
    end
    return nothing
end


function print_solutions(board::Matrix{Int}, solutions::Vector{Vector{Move}})
    i = 1
    for solution in solutions
        println("Solution $i:")
        print_solution(board, solution)
        println()
        i += 1
    end
    return nothing
end
