import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import OrderEditor from './components/OrderEditor/OrderEditor';
import './styles/variables.css';

const App: React.FC = () => {
    return (
        <Router>
            <Switch>
                <Route path="/" exact>
                    <h1>Welcome to CyberOS Order Management</h1>
                </Route>
                <Route path="/edit-order" component={OrderEditor} />
            </Switch>
        </Router>
    );
};

export default App;