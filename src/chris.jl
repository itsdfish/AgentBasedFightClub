mutable struct Chris{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

function Chris(;id, kwargs...)
    return Chris(id, Card[])
end


function process_exchange!(player::Chris, inquirer_id, opponent_id, value, cards)
    return nothing
end

function process_books!(player::Chris, book_map)

    return nothing
end

function process_go_fish!(player::Chris, inquirer_id)
    
    return nothing
end

function decide(player::Chris, ids)

    return id, value
end