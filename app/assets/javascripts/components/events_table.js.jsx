var EventsTable = React.createClass({
  getInitialState: function() {
    return {
      activities: [],
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

    this.props.activities.forEach(function(activity, i) {
      header.push(<th key={activity.id}>{activity.name}<br/>{activity.scheduled_at}</th>);

      activity.participants.forEach(function(participant, i) {
        rows.push(<td>{participant.name}</td>);
      });

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
          <tr>
            <td></td>
            {rows}
          </tr>
        </tbody>
      </table>
    )
  }
});
