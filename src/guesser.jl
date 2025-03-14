mutable struct Guesser{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
    memory::Dict{T,Vector{Bool}}
end

function Guesser(;id, ids)
    # card rank known for each player id
    memory = Dict(id => fill(false, 13) for id ∈ ids)
    return Guesser(id, Card[], memory)
end

function setup!(player::Guesser, ids)
    return nothing
end

function process_exchange!(player::Guesser, inquirer_id, opponent_id, value, cards)
    if isempty(cards)
        # if no cards are exchanged, inquierer has a card with rank `value`, but the opponent does not
        player.memory[inquirer_id][value] = true
        player.memory[opponent_id][value] = false
    else
        # if cards are exchanged, inquierer no longer has a card with rank `value`, but the opponent does
        player.memory[inquirer_id][value] = false
        player.memory[opponent_id][value] = true
    end
    return nothing
end

function process_books!(player::Guesser, book_map)
    for (p,c) ∈ book_map
        i = c[1].rnk
        player.memory[p][i] = false
    end
    return nothing
end

function process_go_fish!(player::Guesser, inquirer_id, n_cards)
    return nothing
end

"""
    decide(player::Guesser, ids)

Selects a player id and card rank (1-13) at random. 

# Arguments

- `player::Guesser`: a simple Go Fish player that guesses 
- `ids`: a vector or keyset of player ids 
"""
function decide(player::Guesser, ids)
    # this agent only guesses, but additional decision logic 
    # could be added
    if false 
        # some decision logic here
        #return id,value
    end 
    # guess if strategy cannot be used. Returns player_id, card_rank
    return guess(player, ids)
end
