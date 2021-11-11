import React from 'react';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
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

  handleSubmit(e) {
    e.preventDefault();
    let todo = this.state;
    console.log(this.props);
    this.props.receiveTodo(todo);
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

  uniqueId() {
    return new Date().getTime();
  }

  render() {
    return (
      <> 
        <h1>Add a new Todo List</h1>
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input type="text" onChange={this.updateTitle} value={this.state.title}/>
          </label>
          <br />
          <label>Body
            <input type="text" onChange={this.updateBody} value={this.state.body}/>
          </label>
          <br />
          <input type="submit" value="submit"/>
        </form>
      </>
    );
  }
}

export default TodoForm;