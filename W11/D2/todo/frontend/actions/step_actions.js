export const receiveStep = step => {
  return {
    type: RECEIVE_STEP,
    step,
  };
};

export const removeStep = step => {
  return {
    type: REMOVE_STEP,
    step,
  };
};

export const receiveSteps = steps => {
  return {
    type: RECEIVE_STEPS,
    steps,
  };
};

export const REMOVE_STEP = "REMOVE_STEP";
export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";