ParticipantRow = React.createClass({
  getInitialState: function() {
    return {
      value: "",
    };
  },

  render: function() {
    self = this;
    column = []
    column.push(
      <td className="col-md-3 participant-title" key={this.props.participant.id}>{this.props.participant.name}</td>
    );

    this.props.participant.attendances.forEach(function(attendance, i) {
      column.push(
        <AttendanceCheckbox checked={attendance.attending} key={attendance.id} id={attendance.id} handleAttendanceCount={self.props.handleAttendanceCount}/>
      );
    }.bind(this));

    return (
      <tr>
        {column}
      </tr>
    );
  }
});

ParticipantAttendanceCount = React.createClass({
  render: function() {
    return (
      <tr>
        <td>{this.props.participant.attendances.length}</td>
      </tr>
    );
  }
})
