ParticipantRow = React.createClass({
  getInitialState: function() {
    return {
      value: "",
      participant: this.props.participant,
    };
  },

  render: function() {
    column = []

    column.push(
      <td className="col-md-3 participant-title" key={this.state.participant.id}>{this.state.participant.name}</td>
    );

    this.state.participant.attendances.forEach(function(attendance, i) {
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
