var ParticipantsRow = React.createClass({
  render: function() {
    column = []
    this.props.participants.forEach(function(participant) {
      column.push(
        <ParticipantCheckbox checked={participant.attending} id={participant.id} key={participant.id} onUserInput={this.props.onUserInput}/>
      );
    }.bind(this));

    return (
      <tr>
        <td>{this.props.participant_name}</td>
        {column}
      </tr>
    );
  }
});
