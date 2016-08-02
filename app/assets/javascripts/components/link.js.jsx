var Link = React.createClass({

  render: function() {
    return (
      <div className="hlable">
        <div className="row">
          <a data-id={this.props.link.id} className="upvote col 12" data-remote="true" rel="nofollow" data-method="POST" href={"/upvotes?upvote%5Blink_id%5D=" + {this.props.link.id} + "&amp;upvote%5Buser_id%5D="}>
            <i className="material-icons">thumb_up</i>
          </a>
        </div>

        <div className="row">
          <div className="vote_count col 2">
            {this.props.link.upvotes_count - this.props.link.downvotes_count}
          </div>
          <div className="col 2">
          <a href={"/links/" + this.props.link.id}>{this.props.link.title}</a>
          </div>
        </div>

        <div className="row">
          <a data-id={this.props.link.id} className="downvote col 12" data-remote="true" rel="nofollow" data-method="POST" href={"/downvotes?downvote%5Blink_id%5D=" + {this.props.link.id} + "&amp;downvote%5Buser_id%5D="}>
            <i className="material-icons">thumb_down</i>
          </a>
        </div>
      </div>
    );
  }
});
