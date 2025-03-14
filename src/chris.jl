mutable struct Chris{T} <: AbstractPlayer
    id::T 
    cards::Vector{Card}
    memory::Dict{T,Vector{Bool}}
end

function Chris(;id, ids, kwargs...)
    # card rank known for each player id
    memory = Dict(id => fill(false, 13) for id ∈ ids)
    return Chris(id, Card[], memory)
end

function setup!(player::Chris, ids)
    return nothing
end

function process_exchange!(player::Chris, inquirer_id, opponent_id, value, cards)
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

function process_books!(player::Chris, book_map)
    for (p,c) ∈ book_map
        i = c[1].rnk
        player.memory[p][i] = false
    end
    return nothing
end

function decide(player::Chris, ids)
    player_id, card_rank = find_match(player, ids)
    if isempty(player_id)
        return guess(player, ids)
    else
        return player_id[1], card_rank[1]
    end
end

function find_match(player::Chris, ids::T) where T
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