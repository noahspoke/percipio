// Import all of our other styles through sass, react, etc.
// React styles are all imported through their respective components.
require('../stylesheets/application.scss');

//Mount React 
var componentRequireContext = require.context('../components', true);
var ReactRailsUJS = require('react_ujs');
ReactRailsUJS.useContext(componentRequireContext);

//Import our starting react page, the dashboard.
import Dashboard from '../components/Dashboard';