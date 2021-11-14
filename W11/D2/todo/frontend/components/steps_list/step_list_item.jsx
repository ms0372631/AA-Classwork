import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    };
  }
  render() {
    debugger
    return (
      <>
        <h3>{this.props.step.title}</h3>
        <p>{this.props.step.body}</p>
        <button onClick={this.props.removeStep}>Delete</button>
      </>
    );
  }
}

export default StepListItem;