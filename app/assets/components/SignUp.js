import React, {Component, PropTypes} from 'react';
import TextField from 'material-ui/TextField';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import RaisedButton from 'material-ui/RaisedButton';

export default class SignUp extends Component {
	static defaultProps = {
		action: '/signup'
	};

	render() {
		return(
			<MuiThemeProvider>
				<form method="POST" action={this.props.action} enctype="multipart/form-data">
					<TextField className="text-field" hintText="Username" name="user[username]" type="text" style={ {display:'block'} } />
					<TextField className="text-field" hintText="Password" name="user[password]" type="text" style={ {display:'block'} } />
					<TextField className="text-field" hintText="Confirm Password" name="user[password_confirmation]" type="text" style={ {display:'block'} } />
					<RaisedButton className="block-item" type="submit">Submit!</RaisedButton>
					<button type="submit">Submit</button>
				</form>
			</MuiThemeProvider>
		);
	}
}