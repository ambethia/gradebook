'use strict';

var BS = ReactBootstrap;


var StudentProgressReport = React.createClass({

    getInitialState: function () {
      return {
        students: [],
        homework: []
      };
    },
  
    fetchData: function () {
      fetch(`/students/${this.props.student.id}/assignments.json`)
        .then(resp => resp.json())
        .then(json => {
          console.log(json)
          this.setState({
            allAssignments:json
          })
        })
    },
  
    handleCreate: function (data) {
     
    },
  
    componentDidMount: function () {
      this.fetchData();
    },
  
    render: function () {
      console.log({props:this.props})
      return <div>
            <section className="student-profile">
                <header className="student-name">{this.props.student.name}</header>
                <header className="cohort-name">{this.props.cohort.name}</header>
            </section>
      </div>;
    }
  });