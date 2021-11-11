import React from 'react';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: 1,
      title: "",
      cost: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateCost = this.updateCost.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    let todo = this.state;
    this.props.receiveTodo(todo);
    this.setState({
      id: this.uniqueId(),
      title: "",
      cost: ""
    });
  }

  updateTitle(e) {
    this.setState({
      title: e.target.title
    });
  }

  updateCost(e) {
    this.setState({
      cost: e.target.title
    });
  }

  uniqueId() {
    return new Date().getTime();
  }

  render() {
    return (
      <> 
        <h1>Add a new List</h1>
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input type="text" onChange={this.updateTitle} value={this.state.title} />
          </label>
          <br />
          <label>Cost
            <input type="text" onChange={this.updateCost} value={this.state.cost}/>
          </label>
          <br />
          <input type="submit" value="submit"/>
        </form>
      </>
    );
  }
}

export default TodoForm;