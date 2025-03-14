# Note: informed guessing does not improve performance
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
    if !isempty(cards)
       player.card_counts[inquirer_id] += length(cards)
       player.card_counts[opponent_id] -= length(cards)
    end
    return nothing
end

function process_go_fish!(player::DFish, inquirer_id, n_cards)
    player.card_counts[inquirer_id] += n_cards
    return nothing
end

function process_books!(player::DFish, book_map)
    for (id,card) ∈ book_map
        i = card[1].rnk
        if player.memory[id][i] ≠ :unavailable 
            player.memory[id][i] = :unavailable
            player.card_counts[id] -= 4
        end
    end
    return nothing
end

function decide(player::DFish, ids)
    player_id, card_rank = find_match(player, ids)
    if !isempty(player_id)
       return player_id[1], card_rank[1]
    end
    player_id, card_rank = informed_guess(player, ids)
    if isempty(player_id)
        return player_id[1], card_rank[1]
    end
    return guess(player, ids)
end

function find_match(player::DFish, ids::T) where T
    (; memory) = player
    matching_card = Int[]
    matching_id = T()
    for id ∈ ids 
        id == player.id ? continue : nothing 
        for card ∈ player.cards
            if memory[id][card.rnk] == :available
                push!(matching_card, card.rnk)
                push!(matching_id, id)
                return matching_id, matching_card
            end
        end
    end
    return matching_id, matching_card
end

function informed_guess(player::DFish, ids::T) where T
    (; memory, card_counts) = player
    card_rank = get_max_card(player)
    dict = Dict(id => 0 for id ∈ ids if id ≠ player.id)
    for id ∈ keys(dict)
        n_available = count(x -> x == :available, memory[id])
        dict[id] = card_counts[id] - n_available
    end
    _,player_id = findmax(dict)
    return [player_id], [card_rank]
end

function get_max_card(player::DFish)
    dict = Dict{Int,Int}()
    for card ∈ player.cards
        if haskey(dict, card.rnk)
            dict[card.rnk] += 1
        else 
            dict[card.rnk] = 1
        end
    end
    _, card_rank = findmax(dict)
    return card_rank
end