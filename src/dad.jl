mutable struct Dad{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

mutable struct Dad{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
end

function Dad(;id, kwargs...)
    return Dad(id, Card[])
end


function process_exchange!(player::Dad, inquirer_id, opponent_id, value, cards)
    return nothing
end

function process_books!(player::Dad, book_map)

    return nothing
end

function process_go_fish!(player::Dad, inquirer_id)
    
    return nothing
end

function decide(player::Dad, ids)

    return id, value
end