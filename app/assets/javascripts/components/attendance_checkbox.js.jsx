var AttendanceCheckbox = React.createClass({
  getInitialState: function() {
    return {
      checked: false,
    }
  },

  handleChange: function() {
    $.ajax({
      type: "PUT",
      url: "/attendances/" + this.props.id,
      data: { _method:'PATCH', checked: !this.state.checked },
      dataType: 'json',
    });

    this.props.onUserInput(
      this.refs.attendingCheckbox.checked
    );
  },

  render: function() {
    return <td key={this.props.id}>
      <input
        type="checkbox"
        defaultChecked={this.props.checked}
        ref="attendingCheckbox"
        onChange={this.handleChange}
      />
    </td>;
  }
});
