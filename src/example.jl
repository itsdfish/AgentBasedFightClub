mutable struct Example{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
    memory::Dict{T,Vector{Bool}}
end

function Example(;id, ids)
    # card rank known for each player id
    memory = Dict(id => fill(false, 13) for id ∈ ids)
    return Example(id, Card[], memory)
end

function setup!(player::Example, ids)
    return nothing
end

function process_exchange!(player::Example, inquirer_id, opponent_id, value, cards)
    player.memory[inquirer_id][value] = true
    player.memory[opponent_id][value] = false
    return nothing
end

function process_books!(player::Example, book_map)
    for (p,c) ∈ book_map
        i = c[1].rnk
        player.memory[p][i] = false
    end
    return nothing
end

function process_go_fish!(player::Example, inquirer_id, n_cards)
    return nothing
end


function decide(player::Example, ids)
    # this agent only guesses, but additional decision logic 
    # could be added
    if false 
        # some decision logic here
        #return id,value
    end 
    # guess if strategy cannot be used
    return guess(player, ids)
end

function guess(player, ids)
    id = rand(setdiff(ids, [player.id]))
    card = rand(player.cards)
    return id,card.rnk
end