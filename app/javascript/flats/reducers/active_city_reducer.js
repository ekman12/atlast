export default function(state, action) {
  if (state === undefined) {
    return [];
  }
  switch (action.type) {
    case "ACTIVE_CITY":
      return action.payload;
    default:
      return state;
  }
}
