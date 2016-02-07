var Table = React.createClass({
  getInitialState: function() {
    return {
      users: this.props.users,
      activities: this.props.activities,
    }
  },

  render: function() {
    return <table className="table table-bordered table-striped">
      <thead>
        <tr className="info">
          <th></th>
          {this.state.activities.map(function (activity) {
            return <th key={activity.id}>
              <DisplayName key={activity.id} name={activity.name} />
            </th>
          })}
        </tr>
      </thead>
      
      <tbody>
        { this.state.users.map(function (user) {
          return <tr key={user.id}>
            <th className="text-center">
              <DisplayName key={user.id} name={user.name} />
            </th>
            { 
              user.participants.map(function(participant) {
                url = "/api/v1/participants/" + participant.id

                return <td className="text-center" key={participant.id}>
                  <Checkbox checked={participant.attending} url={url} />
                </td>
              })
            }
          </tr>
        })}
        <tr>
          <th className="text-center">TOTAL</th>
          { 
            this.state.activities.map(function (user) {
              return <th className="info text-center" key={user.id}>
                <Participants participants={user.participants} />
              </th>
            })
          }
        </tr>
      </tbody>
    </table>
  }
});
