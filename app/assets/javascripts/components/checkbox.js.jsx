var Checkbox = React.createClass({
  getInitialState: function() {
    return {
      checked: false,
    }
  },

  handleCheck: function(check) {
    $.ajax({
      type: "PUT",
      url: this.props.url,
      data: { _method:'PUT', checked: !this.state.checked },
      dataType: 'json',
    });

    this.setState({checked: !this.state.checked})
  },

  render: function() {
    return <div>
      <input type="checkbox" onChange={this.handleCheck} defaultChecked={this.props.checked} />
    </div>;
  }
});
