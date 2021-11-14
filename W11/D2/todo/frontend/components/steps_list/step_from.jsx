import React from 'react';


class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: this.uniqueId(),
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  uniqueId() {
    return new Date().getTime();
  }

  handleSubmit(e) {
    e.preventDefault();
    let step = {};
    this.props.recieveStep(step);
    this.setState({
      id: this.uniqueId(),
      title: "",
      body: "",
      done: false
    });
  }

  updateTitle(e) {
    this.setState({
      title: e.target.value
    });
  }

  updateBody(e) {
    this.setState({
      body: e.target.value
    });
  }

  render() {
    return (
      <>  
        <form onSubmit={this.handleSubmit}>
          <input type="text" onChange={this.updateTitle} />
        </form>
      </>
    );
  }
}

export default StepForm;