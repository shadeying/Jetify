import React from 'react';
import ReactDOM from 'react-dom';
import { CookiesProvider } from 'react-cookie';
import './styles/index.scss';
import App from './js/App';
import * as serviceWorker from './js/serviceWorker';
require('dotenv').config();

ReactDOM.render(<CookiesProvider><App /></CookiesProvider>, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();