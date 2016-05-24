var AttendanceCheckbox = React.createClass({
  getInitialState: function() {
    return {
      checked: false,
    }
  },

  handleChange: function() {
    self = this;
    $.ajax({
      type: "PUT",
      url: "/attendances/" + this.props.id,
      data: { _method:'PATCH', checked: !this.state.checked },
      dataType: 'json',
      success: function(result) {
        self.props.handleAttendanceCount(result)
      }
    });
  },

  render: function() {
    return(
      <td className="col-md-1 attendance-checkbox" key={this.props.id}>
        <input
          className="css-checkbox"
          type="checkbox"
          defaultChecked={this.props.checked}
          onChange={this.handleChange}
          id={this.props.id}
        />
        <label className="css-label" htmlFor={this.props.id}></label>
      </td>
    )
  }
});
