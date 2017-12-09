import { combineReducers } from 'redux';

import counter from "./redux/reducers/counter";

export default () => {
  return combineReducers({
    counter
  })
};