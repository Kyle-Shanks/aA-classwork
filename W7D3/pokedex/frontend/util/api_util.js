export const fetchAllPokemon = () => {
  return $.ajax("/api/pokemon");
};

export const fetchPokemon = id =>{
  return $.ajax(`/api/pokemon/${id}`);
};

export const createPokemon = (options) => {
  return $.ajax({
    method: 'POST',
    url: '/api/pokemon',
    data: { pokemon: options }
  });
};
