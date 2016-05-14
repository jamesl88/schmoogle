var EventsTable = React.createClass({
  getInitialState: function() {
    return {
      event: this.props.event,
      checked: false,
      new_participant: 'initial',
    }
  },

  _handleEnterName: function(e) {
    this.setState({
      value: e.target.value
    });
  },

  _handleAddParticipant: function() {
    this.setState({
      new_participant: 'enter_name'
    });
  },

  _createNewParticipant: function() {
    $.ajax({
      type: "POST",
      url: "/participants/",
      data: { participant: { name: this.state.value, event_id: this.props.event.id } },
      dataType: 'json',
      success: function(result) {
        this.setState({
          event: result,
          new_participant: 'initial',
        });
      }.bind(this),
    });
  },

  _displayNewParticipant: function(rows) {
    return(
      rows.push(
        <tr key='new-participant'>
          <td className="col-md-3 participant-title" key="new-participant">
            <div className="input-group">
              <input type="text" className="form-control" placeholder="Enter your name.." value={this.state.value} onChange={this._handleEnterName} ref="nameInput"/>
              <div className="input-group-btn">
                <button type="submit" className="btn btn-success" onClick={this._createNewParticipant}>Save</button>
              </div>
            </div>
          </td>
        </tr>
      )
    )
  },

  _addNewParticipantButton: function(rows) {
    rows.push(
      <tr key='add-participant-row'>
        <td key='add-participant-data'>
          <a className="btn btn-primary add-participant fa fa-user-plus" onClick={this._handleAddParticipant}></a>
        </td>
      </tr>
    );
  },

  render: function() {
    header = []
    rows = []
    first_participant = this.state.event.participants[0]

    first_participant.attendances.forEach(function(attendance, i) {
      activity = attendance.activity
      header.push(
        <th key={activity.id}>
          {activity.name}
          <br/>
          {activity.scheduled_at}
        </th>);
    }.bind(this));

    this.state.event.participants.forEach(function(participant, i) {
      rows.push(
        <ParticipantRow participant={participant} key={participant.id} id={participant.id}/>
      );
    }.bind(this));

    if (this.state.new_participant == 'enter_name') {
      this._displayNewParticipant(rows)
    } else {
      this._addNewParticipantButton(rows)
    }

    return(
      <div>
        <table className="table">
          <thead>
            <tr className="">
              <th></th>
              {header}
            </tr>
          </thead>
          <tbody>
            {rows}
          </tbody>
        </table>
      </div>
    )
  }
});
