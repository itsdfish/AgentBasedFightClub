mutable struct Mary{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

function Mary(;id, kwargs...)
    return Mary(id, Card[])
end


function process_exchange!(player::Mary, inquirer_id, opponent_id, value, cards)
    return nothing
end

function process_books!(player::Mary, book_map)

    return nothing
end

function process_go_fish!(player::Mary, inquirer_id)
    
    return nothing
end

function decide(player::Mary, ids)

    return id, value
end