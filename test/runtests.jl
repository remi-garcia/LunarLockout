using Test

@testset "Instances" begin
    for file in readdir((@__DIR__)*"/../instances/")
        @test !isempty(find_solution(read_problem(file)))
    end
end
