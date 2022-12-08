function battle!(results; ids, types, args)
    players = Dict(id => t(;id, a...) for (t,id,a) in zip(types,ids,args))
    game = Game(ids)
    deal!(game, players)
    simulate!(game, players)
    _,winner = findmax(game.books)
    results[winner] += 1
    return nothing 
end

"""
    battle!(results, n_sim; ids, types, args)

Run the Gladitorial death battle. 

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