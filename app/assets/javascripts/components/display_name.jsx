var DisplayName = React.createClass({
  getInitialState: function() {
    return { name: 'Guest' }
  },

  componentWillMount: function() {
    this.setState({
      id: this.props.id,
      name: this.props.name
    })
  },

  render: function() {
    return <div>
      {this.state.name}
    </div>
  }
});
