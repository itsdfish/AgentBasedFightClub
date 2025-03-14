############################################################################################################
# The code below shows how to set up a game simulation
# The code for this example can be found in src/guesser.jl
############################################################################################################
#                                         load packages
############################################################################################################
cd(@__DIR__)
using Pkg
Pkg.activate("..")
using Revise
using AgentBasedFightClub
using GoFish
using HypothesisTests
using Random
############################################################################################################
#                                         set up games
############################################################################################################
#Random.seed!(652)
ids = (:DFish, :Guesser, :Guesser1, :Guesser2)
types = (DFish, Guesser, Guesser, Guesser)
# optional keyword argumens for each player 
args = ((; ids), (; ids), (; ids), (; ids))
# number of games
n_games = 10000
############################################################################################################
#                                         battle!
############################################################################################################
# Tracks the number of wins for each player
results = Dict(id => 0 for id ∈ ids)
battle!(results, n_games; ids, types, args)
score = collect(values(results))
# chi-square goodness of fit test assuming no difference in player performance
@show test = ChisqTest(score)
@show pvalue(test)
results
