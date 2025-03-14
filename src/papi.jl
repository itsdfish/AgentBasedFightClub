mutable struct Papi{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

function Papi(;id, kwargs...)
    return Papi(id, Card[])
end

function setup!(player::Papi, ids)
    return nothing
end

function process_exchange!(player::Papi, inquirer_id, opponent_id, value, cards)
    return nothing
end

function process_books!(player::Papi, book_map)

    return nothing
end

function process_go_fish!(player::Papi, inquirer_id,  n_cards)
    
    return nothing
end

function decide(player::Papi, ids)

    return player_id, card_rank
end