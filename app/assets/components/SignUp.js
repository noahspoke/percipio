import React, {Component, PropTypes} from 'react';
import TextField from 'material-ui/TextField';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import RaisedButton from 'material-ui/RaisedButton';

export default class SignUp extends Component {
	render() {
		return(
			<MuiThemeProvider>
				<div class="content-wrapper">
					<TextField className="text-field" hintText="Username" />
					<RaisedButton>Submit!</RaisedButton>
				</div>
			</MuiThemeProvider>
		);
	}
}