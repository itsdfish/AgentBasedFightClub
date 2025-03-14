function battle!(results; ids, types, args)
    players = Dict(id => t(;id, a...) for (t,id,a) in zip(types,ids,args))
    game = Game(ids)
    simulate!(game, players)
    winners = get_winners(game)
    # ignore ties
    if length(winners) == 1
        results[winners[1]] += 1
    end
    return nothing 
end

"""
    battle!(results, n_sim; ids, types, args)

Run the Gladitorial death battle. Ties are ignored.

# Arguments 

- `results`: a dictionary containing agent id and score 
- `n_games`: number of games to run 

# keywords

- `ids`: a tuple of agent ids 
- `types`: a tuple of agent types 
- `args`: a tuple of optional `NamedTuples` to be passed to respective agents. 
"""
function battle!(results, n_games; ids, types, args)
    map(_ -> battle!(results; ids, types, args), 1:n_games)
    return nothing
end

"""
    guess(player::AbstractPlayer, ids)

Select a player id and card rank (1-13) at random 

# Arguments

- `player::AbstractPlayer`: a Go Fish player 
- `ids`: a vector of key set of ids
"""
function guess(player::AbstractPlayer, ids)
    id = rand(setdiff(ids, [player.id]))
    card = rand(player.cards)
    return id,card.rnk
end