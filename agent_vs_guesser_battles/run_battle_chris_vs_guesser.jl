############################################################################################################
# The code below shows how to set up a game simulation
# The code for this example can be found in src/guesser.jl
############################################################################################################
#                                         load packages
############################################################################################################
cd(@__DIR__)
using Pkg
Pkg.activate("..")
using Revise, AgentBasedFightClub
using GoFish
using HypothesisTests
using Random
############################################################################################################
#                                         set up games
############################################################################################################
Random.seed!(451)
ids = (:Chris, :Guesser)
types = (Chris, Guesser)
# optional keyword argumens for each player 
args = ((; ids), (; ids))
# number of games
n_games = 1000
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
