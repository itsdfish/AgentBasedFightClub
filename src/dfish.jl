mutable struct DFish{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
    memory::Dict{T,Vector{Symbol}}
    card_counts::Dict{T,Int}
end

function DFish(;id, ids, kwargs...)
    # card rank known for each player id
    memory = Dict(id => fill(:unknown, 13) for id ∈ ids)
    card_counts = Dict(id => 0 for id ∈ ids)
    return DFish(id, Card[], memory, card_counts)
end

function setup!(player::DFish, ids)
    # all players start with the same number of cards
    n_cards = length(player.cards)
    for id ∈ ids
        player.card_counts[id] = n_cards
    end
    return nothing
end

function process_exchange!(player::DFish, inquirer_id, opponent_id, value, cards)
    player.memory[inquirer_id][value] = :available
    player.memory[opponent_id][value] = :unavailable
    end
    return nothing
end

function process_books!(player::DFish, book_map)
    for (p,c) ∈ book_map
        i = c[1].rnk
        player.memory[p][i] = false
    end
    return nothing
end

function decide(player::DFish, ids)
    player_id, card_rank = find_match(player, ids)
    if isempty(player_id)
        return guess(player, ids)
    else
        return player_id[1], card_rank[1]
    end
end

function find_match(player::DFish, ids::T) where T
    (; memory) = player
    matching_card = Int[]
    matching_id = T()
    for id ∈ ids 
        id == player.id ? break : nothing 
        for card ∈ player.cards
            if memory[id][card.rnk] 
                push!(matching_card, card.rnk)
                push!(matching_id, id)
                return matching_id, matching_card
            end
        end
    end
    return matching_id, matching_card
end