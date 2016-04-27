var ParticipantRow = React.createClass({
  render: function() {
    column = []
    column.push(
      <td key={this.props.participant.name}>{this.props.participant.name}</td>
    );
    this.props.participant.attendances.forEach(function(attendance, i) {
      column.push(
        <AttendanceCheckbox onUserInput={this.props.onUserInput} checked={attendance.attending} key={i} id={attendance.id}/>
      );
    }.bind(this));

    return (
      <tr>
        {column}
      </tr>
    );
  }
});
