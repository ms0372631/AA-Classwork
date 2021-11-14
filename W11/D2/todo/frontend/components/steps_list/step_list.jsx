import React from 'react';
import StepListItem from './step_list_item';

export const StepList = (props) => {
  return (
    <div>
      <ul>
        <StepListItem props={props}/>
      </ul>
    </div>
  )
}
