mutable struct Taylor{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

function Taylor(;id, kwargs...)
    return Taylor(id, Card[])
end

function setup!(player::Taylor, ids)
    return nothing
end

function process_exchange!(player::Taylor, inquirer_id, opponent_id, value, cards)
    return nothing
end

function process_books!(player::Taylor, book_map)

    return nothing
end

function process_go_fish!(player::Taylor, inquirer_id, n_cards)
    
    return nothing
end

function decide(player::Taylor, ids)

    return id, value
end