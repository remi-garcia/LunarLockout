include("../src/boardrobots.jl")
include("../src/solver.jl")
include("../src/problems.jl")

function main()
    board = read_problem("problem1.txt")
    solutions = find_solution(board)
    print_solutions(board, solutions)
    return 0
end
