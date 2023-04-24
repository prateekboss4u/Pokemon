json.array! @all_pokemons do |all_pokemon|
    json.partial! 'all_pokemon', all_pokemon: all_pokemon
end