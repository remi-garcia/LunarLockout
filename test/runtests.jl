using Test

include("../src/boardrobots.jl")
include("../src/solver.jl")
include("../src/readchallenges.jl")


@testset "Instances" begin
    for file in readdir((@__DIR__)*"/../instances/")
        @test !isempty(find_solution(read_challenge((@__DIR__)*"/../instances/"*file, autodetectformat=true)))
    end
end


@testset "No solution" begin
    @test isempty(find_solution(read_board("""12\n\n\n\n""")))
    @test isempty(find_solution(read_board("""1 2 3\n\n\n\n""")))
end
