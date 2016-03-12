var ParticipantsTable = React.createClass({
  getInitialState: function() {
    return {
      users: [],
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
    attending_count_row = []

    this.props.users.forEach(function(user, i) {
      if(i == 0) {
        user.activities.forEach(function(activity) {
          header.push(<th key={activity.id}>{activity.name}<br/>{activity.scheduled_at}</th>);
        });
      }
      rows.push(
        <ParticipantsRow onUserInput={this.handleUserInput} participants={user.participants} participant_name={user.name} key={user.name}/>
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
