export default function(state = null, action) {
  switch (action.type) {
    case 'FETCH_CARS':
      return action.payload;
    case 'REMOVE_PLACE':
      return state.filter((place) => place !== action.payload);
    default:
      return state;
  }
}
