var Navigation = React.createClass({

  loggedIn: function () {
    if (this.props.user === null) {
      return <span>
        <li><a href="/users/new">Sign Up</a></li>
        <li><a href="/sessions/sign_in">Sign In</a></li>
      </span>
    } else {
      return <span>
        <li><a href={"/users/" + this.props.user.id + "/edit"}>Profile</a></li>
        <li><a href="/sessions/sign_out" data-method="DELETE">Sign Out</a></li>
      </span>
    }
  },

  render: function() {
    return (
      <div>
        <div className="row">
          <div className="col 2">
              {this.props.boards.map(function (board) {
                 return (<a key={board.id} className="header-board" href={"/boards/" + board.id}>/r/{board.name}</a>);
               })}
          </div>
        </div>

        <nav>
          <div className="nav-wrapper">
            <a className="big" href="/">Reddit</a>
            <ul id="nav-mobile" className="right">
              <li><a href="/links/new">New Post</a></li>
              <li><a href="/boards/new">New Board</a></li>
              {this.loggedIn()}
            </ul>
          </div>
        </nav>
      </div>
    );
  }
});
