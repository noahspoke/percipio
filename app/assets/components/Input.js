import React, {Component, PropTypes} from 'react';
import './Input.scss'

export default class Input extends Component {
	render() {
		return(
			<input type={this.props.type} name={this.props.name} placeholder={this.props.placeholder} />
		);
	}
}