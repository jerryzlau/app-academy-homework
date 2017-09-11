const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  // return state; // remove this and fill out the body of the reducer function
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
    default:
      return state;
  }
};

export default reducer;
