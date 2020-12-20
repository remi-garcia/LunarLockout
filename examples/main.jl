include("../src/boardrobots.jl")
include("../src/solver.jl")
include("../src/readchallenges.jl")

function main()
    board = read_challenge((@__DIR__)*"/../instances/"*"challenge_1.txt", autodetectformat=true)
    solutions = find_solution(board)
    print_solutions(board, solutions)
    return 0
end

main()
