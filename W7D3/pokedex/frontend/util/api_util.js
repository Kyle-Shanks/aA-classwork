export const fetchAllPokemon = () => {
  return $.ajax("/api/pokemon");
};
