var Participants = React.createClass({
  getInitialState: function() {
    return {
      participants: this.props.participants,
      attending_count: 0
    }
  },

  componentWillMount: function() {
    number = jQuery.grep(this.state.participants, function(a){
      return a.attending == true
    }).length

    this.setState({attending_count: number})
  },

  render: function() {
    return <div> 
      {this.state.attending_count}
    </div>
  }
});
