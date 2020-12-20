include("../src/boardrobots.jl")
include("../src/solver.jl")
include("../src/readchallenges.jl")

function main()
    board = read_problem((@__DIR__)*"/../instances/"*"challenge_1.txt", emptycell='-', usecolors=true)
    solutions = find_solution(board)
    print_solutions(board, solutions)
    return 0
end

main()
