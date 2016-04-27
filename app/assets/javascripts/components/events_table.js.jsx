var EventsTable = React.createClass({
  getInitialState: function() {
    return {
      event: [],
      checked: false,
    }
  },

  handleUserInput: function(checked) {
    this.setState({
      checked: checked
    });
  },

  render: function() {
    header = []
    rows = []
    this.props.event.participants[0].attendances.forEach(function(attendance, i) {
      activity = attendance.activity
      header.push(<th key={i}>{activity.name}</th>);
    }.bind(this));

    this.props.event.participants.forEach(function(participant, i) {
      rows.push(
        <ParticipantRow onUserInput={this.handleUserInput} participant={participant} key={i}/>
      );
    }.bind(this));

    return(
      <table className="table table-bordered table-striped">
        <thead>
          <tr className="info">
            <th></th>
            {header}
          </tr>
        </thead>
        <tbody>
          {rows}
        </tbody>
      </table>
    )
  }
});
