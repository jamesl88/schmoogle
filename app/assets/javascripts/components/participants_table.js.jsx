var ParticipantsTable = React.createClass({
  getInitialState: function() {
    return {
      users: [],
      activities: [],
    }
  },

  handleUserInput: function(checked) {
    this.setState({
      checked: checked
    });
  },

  render: function() {
    self = this
    header = []
    rows = []

    this.props.activities.forEach(function(activity) {
      header.push(<th key={activity.id}>{activity.name}<br/>{activity.scheduled_at}</th>);
    });

    this.props.users.forEach(function(user) {
      rows.push(
        <ParticipantsRow onUserInput={self.handleUserInput} participants={user.participants} participant_name={user.name} key={user.name}/>
      );
    });

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
