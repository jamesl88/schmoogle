ParticipantRow = React.createClass({
  getInitialState: function() {
    return {
      value: "",
    };
  },

  render: function() {
    column = []

    column.push(
      <td className="col-md-3 participant-title" key={this.props.participant.id}>{this.props.participant.name}</td>
    );

    this.props.participant.attendances.forEach(function(attendance, i) {
      column.push(
        <AttendanceCheckbox checked={attendance.attending} key={attendance.id} id={attendance.id}/>
      );
    }.bind(this));

    return (
      <tr>
        {column}
      </tr>
    );
  }
});
