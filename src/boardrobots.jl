Move = Pair{CartesianIndex{2}, CartesianIndex{2}}

"""
    initialize_board()

Return an empty board.
"""
function initialize_board()
    board = zeros(Int, 5, 5)
    return board
end

"""
    _robot_possible_moves(board::Matrix{Int}, position::CartesianIndex{2})

Return all the possible moves that can be done on `board` from a robot starting
at `position`.
"""
function _robot_possible_moves(board::Matrix{Int}, position::CartesianIndex{2})
    @assert board[position] in [1,2,3,4,5,6]
    moves = Vector{Pair{CartesianIndex{2}, CartesianIndex{2}}}()
    for (i,j) in [(-1,0),(0,1),(1,0),(0,-1)]
        ending_position = CartesianIndex(position[1]+i, position[2]+j)
        while (ending_position[1] >= 1 && ending_position[1] <= 5) && (ending_position[2] >= 1 && ending_position[2] <= 5) && board[ending_position] == 0
            ending_position = CartesianIndex(ending_position[1]+i, ending_position[2]+j)
        end
        if ending_position[1] != 0 && ending_position[1] != 6 && ending_position[2] != 0 && ending_position[2] != 6 && board[ending_position] != 0
            ending_position = CartesianIndex(ending_position[1]-i, ending_position[2]-j)
            if position != ending_position
                push!(moves, position => ending_position)
            end
        end
    end
    return moves
end

"""
    get_red_position(board::Matrix{Int})

Return the position of the Red robot.
"""
function get_red_position(board::Matrix{Int})
    return findfirst(x->x==1, board)
end

"""
    get_robot_positions(board::Matrix{Int})

Return a vector of positions with the positions of all the robots.
"""
function get_robot_positions(board::Matrix{Int})
    return findall(x->x!=0, board)
end

"""
    get_possible_moves(board::Matrix{Int})

Return a vector of all possible moves that can be made on the `board`.
"""
function get_possible_moves(board::Matrix{Int})
    moves = Vector{Pair{CartesianIndex{2}, CartesianIndex{2}}}()
    for position in get_robot_positions(board)
        append!(moves, _robot_possible_moves(board, position))
    end
    return moves
end

"""
    is_finished(board::Matrix{Int})

Check if Red is in the center of the `board`.
"""
function is_finished(board::Matrix{Int})
    if 1 in board[3,3]
        return true
    end
    return false
end

"""
    move_robot!(board::Matrix{Int}, starting_position::CartesianIndex{2}, ending_position::CartesianIndex{2})
    move_robot!(board::Matrix{Int}, move::Pair{CartesianIndex{2}, CartesianIndex{2}})

Move the robot in `starting_position` or `move[1]` to the `ending_position` or
`move[2]`.
"""
function move_robot!(board::Matrix{Int}, starting_position::CartesianIndex{2}, ending_position::CartesianIndex{2})
    @assert board[starting_position] != 0
    @assert board[ending_position] == 0
    board[ending_position] = board[starting_position]
    board[starting_position] = 0
    return board
end
move_robot!(board::Matrix{Int}, move::Pair{CartesianIndex{2}, CartesianIndex{2}}) =
    move_robot!(board, move[1], move[2])

"""
    print_current_board(board::Matrix{Int})

Print the current `board` in a simplified format where `X` corresponds to
robots, `O` to the Red one and `+` to the center of the board.
"""
function print_current_board(board::Matrix{Int})
    for i in 1:5
        for j in 1:5
            if i == 3 && j == 3 && board[i,j] == 0
                print("+")
            elseif board[i,j] == 0
                print(" ")
            elseif board[i,j] == 1
                print("O")
            else
                print("X")
            end
        end
        print("\n")
    end
    return nothing
end
