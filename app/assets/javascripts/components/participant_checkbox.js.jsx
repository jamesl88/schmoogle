var ParticipantCheckbox = React.createClass({
  getInitialState: function() {
    return {
      checked: false,
    }
  },

  handleChange: function(participant) {
    $.ajax({
      type: "PUT",
      url: "/api/v1/participants/" + this.props.id,
      data: { _method:'PUT', checked: !this.state.checked },
      dataType: 'json',
    });

    this.props.onUserInput(
      this.refs.attendingCheckbox.checked
    );
  },

  render: function() {
    return <td>
      <input
        type="checkbox"
        defaultChecked={this.props.checked}
        ref="attendingCheckbox"
        onChange={this.handleChange}
      />
    </td>;
  }
});
