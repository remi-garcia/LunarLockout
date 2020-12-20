using Test

@testset "Instances" begin
    for file in readdir((@__DIR__)*"/../instances/")
        @test !isempty(find_solution(read_problem((@__DIR__)*"/../instances/"*file)))
    end
end


@testset "No solution" begin
    @test isempty(find_solution(read_board("""12\n\n\n\n""")))
    @test_skip isempty(find_solution(read_board("""1 2 3\n\n\n\n""")))
end
