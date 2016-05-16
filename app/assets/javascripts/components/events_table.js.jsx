var EventsTable = React.createClass({
  getInitialState: function() {
    return {
      event: this.props.event,
      checked: false,
      display_participant_form: false,
    }
  },

  _handleInputValue: function(e) {
    key = {}
    key[e.target.id] = e.target.value

    this.setState(key);
  },

  _handleAddParticipant: function() {
    this.setState({
      display_participant_form: true
    });
  },

  _displayNewParticipant: function() {
    if (this.state.display_participant_form == true) {
      return(
        <div className="input-group">
          <input type="text" className="form-control" id="participant_name" placeholder="Enter your name.." onChange={this._handleInputValue} ref="nameInput"/>
          <div className="input-group-btn">
            <button type="submit" className="btn btn-info" onClick={this._createNewParticipant}>Save</button>
          </div>
        </div>
      )
    } else {
      return(
        <a className="btn btn-primary add-participant fa fa-user-plus" onClick={this._handleAddParticipant}></a>
      )
    }
  },

  _createNewParticipant: function() {
    $.ajax({
      type: "POST",
      url: "/participants/",
      data: { participant: { name: this.state.participant_name, event_id: this.props.event.id } },
      dataType: 'json',
      success: function(result) {
        this.setState({
          event: result,
          display_participant_form: false,
        });
      }.bind(this),
    });
  },

  _submitActivityForm: function(event) {
    $.ajax({
      type: "POST",
      url: "/activities/",
      data: { activity: { name: this.state.activity_name, scheduled_at: this.state.scheduled_at, event_id: this.props.event.id } },
      dataType: 'json',
      success: function(result) {
        this.setState({
          event: result,
        })
      }.bind(this),
    });
  },

  _activityForm: function() {
    var csrfToken = $('meta[name=csrf-token]').attr('content');

    return(
      <div>
        <form className="text-right">
          <input value={this.state.event.id} type="hidden" name="activity[event_id]" id="activity_event_id" />
          <div className="form-group">
            <input className="form-control" placeholder="Activiy name" type="text" name="activity[name]" id="activity_name" onChange={this._handleInputValue}/>
          </div>
          <div className="form-group">
            <input className="time-picker form-control" placeholder="Time" type="text" name="activity[scheduled_at]" id="scheduled_at" />
          </div>
          <button type="submit" className="btn btn-info" onClick={this._submitActivityForm}>Add activity</button>
        </form>
      </div>
    )
  },

  componentDidMount: function() {
    self = this;

    $('.time-picker').timepicker({'scrollDefault': 'now'});
    $('.time-picker').on('changeTime', function(e) {
      $(e.target).on('change', function(evnt) {
        self._handleInputValue(evnt)
      });
    });
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
        <ParticipantRow participant={participant} key={participant.id} id={participant.id} event_id={this.state.event.id}/>
      );
    }.bind(this));

    return(
      <div>
        <h2 className="page-header">{this.props.event.name} </h2>
        <div className="table-responsive">
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

        <div className="row">
          <div className="col-md-5">
          {this._displayNewParticipant()}
          </div>
          <div className="col-md-5 col-md-offset-2">
          {this._activityForm()}
          </div>
        </div>
      </div>
    )
  }
});
